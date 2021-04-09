#!/bin/bash -e
######
# IMPORTANT: NDK r22 has broken zlib, use either r22b or r23*
ndk=/the/path/to/android-ndk-r23-beta2
irrlicht_ver=1.9.0mt1
png_ver=1.6.37
jpeg_ver=2.0.6
######

mkdir -p deps
[ -d deps/irrlicht ] || git clone https://github.com/minetest/irrlicht -b $irrlicht_ver deps/irrlicht
[ -d deps/libpng ] || { curl -L "https://download.sourceforge.net/libpng/libpng-${png_ver}.tar.gz" \
	| tar -xz -C deps; mv deps/libpng-${png_ver} deps/libpng; }
[ -d deps/libjpeg ] || { curl -L "https://download.sourceforge.net/libjpeg-turbo/libjpeg-turbo-${jpeg_ver}.tar.gz" \
	| tar -xz -C deps; mv deps/libjpeg-turbo-${jpeg_ver} deps/libjpeg; }

toolchain=$(echo "$ndk"/toolchains/llvm/prebuilt/*)
[ -d "$toolchain" ] || { echo "NDK path wrong"; exit 1; }
export PATH="$toolchain/bin:$ndk:$PATH"

abi=$1
if [ "$abi" == armeabi-v7a ]; then
	apilvl=16
	gentriple=arm-linux-androideabi
	export CC=armv7a-linux-androideabi$apilvl-clang
elif [ "$abi" == arm64-v8a ]; then
	apilvl=21
	gentriple=aarch64-linux-android
	export CC=$gentriple$apilvl-clang
else
	echo "Invalid ABI given"; exit 1
fi

mkdir -p deps/libpng/$abi
pushd deps/libpng/$abi
CFLAGS="-fPIC" ../configure --host=${CC%-*}
make -j4 && make DESTDIR=$PWD install
popd

mkdir -p deps/libjpeg/$abi
pushd deps/libjpeg/$abi
cmake -S .. -B . \
	-DCMAKE_TOOLCHAIN_FILE=$ndk/build/cmake/android.toolchain.cmake \
	-DANDROID_ABI=$abi -DANDROID_NATIVE_API_LEVEL=$apilvl
make -j4 && make DESTDIR=$PWD install
popd


dest=$PWD/../Irrlicht
libpng_a=$PWD/deps/libpng/$abi/usr/local/lib/libpng.a
libjpeg_a=$(echo "$PWD"/deps/libjpeg/$abi/opt/libjpeg-turbo/lib*/libjpeg.a)

mkdir -p deps/irrlicht/$abi
pushd deps/irrlicht/$abi
cmake -S .. -B . -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF \
	-DCMAKE_TOOLCHAIN_FILE=$ndk/build/cmake/android.toolchain.cmake \
	-DANDROID_ABI=$abi -DANDROID_NATIVE_API_LEVEL=$apilvl \
	-DPNG_LIBRARY=$libpng_a \
	-DPNG_PNG_INCLUDE_DIR=$(dirname "$libpng_a")/../include \
	-DJPEG_LIBRARY=$libjpeg_a \
	-DJPEG_INCLUDE_DIR=$(dirname "$libjpeg_a")/../include
make -j4

if [ -d "$dest" ]; then
	cp -fv lib/Android/libIrrlichtMt.a $dest/clang/$abi/
	rm -rf $dest/include $dest/shaders
	cp -a ../include $dest/include
	cp -a ../media/Shaders $dest/shaders
	# Integrate static dependencies directly into the Irrlicht library file
	# (someone else can bother with a better solution sometime)
	pushd $(mktemp -d)
	for deplib in $toolchain/sysroot/usr/lib/$gentriple/libz.a $libpng_a $libjpeg_a; do
		ar x "$deplib"
		ar q $dest/clang/$abi/libIrrlichtMt.a *.o
		rm -- *.o
	done
	popd
fi
popd

echo "IrrlichtMt built successfully (for $abi, API$apilvl)."
exit 0
