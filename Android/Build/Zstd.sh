#!/bin/bash -e
######
ndk=/the/path/to/android-ndk-r23-beta2
ver=1.4.9
######

mkdir -p deps
[ -d deps/zstd ] || { curl -L "https://github.com/facebook/zstd/releases/download/v$ver/zstd-$ver.tar.gz" \
	| tar -xz -C deps; mv deps/zstd-${ver} deps/zstd; }

toolchain=$(echo "$ndk"/toolchains/llvm/prebuilt/*)
[ -d "$toolchain" ] || { echo "NDK path wrong"; exit 1; }
export PATH="$toolchain/bin:$ndk:$PATH"

abi=$1
if [ "$abi" == armeabi-v7a ]; then
	apilvl=16
	export CC=armv7a-linux-androideabi$apilvl-clang
elif [ "$abi" == arm64-v8a ]; then
	apilvl=21
	export CC=aarch64-linux-android$apilvl-clang
else
	echo "Invalid ABI given"; exit 1
fi

dest=$PWD/../Zstd

mkdir -p deps/zstd/$abi
pushd deps/zstd/$abi
cmake -S ../build/cmake -B . -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_TOOLCHAIN_FILE=$ndk/build/cmake/android.toolchain.cmake \
	-DANDROID_ABI=$abi -DANDROID_NATIVE_API_LEVEL=$apilvl \
	-DZSTD_BUILD_SHARED=OFF
make -j4

if [ -d "$dest" ]; then
	make DESTDIR=$PWD install
	cp -fv usr/local/lib/*.a $dest/clang/$abi/
	rm -rf $dest/include
	cp -a usr/local/include $dest/include
fi
popd

echo "Zstd built successfully (for $abi, API$apilvl)."
exit 0
