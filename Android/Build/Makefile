######################################################################################
# toolchain config for ARMv7 (Clang)
######################################################################################

#API = 16
#TARGET_HOST = arm-linux
#TARGET_ABI = armeabi-v7a
#TARGET_ARCH = arm
#TARGET_TOOLCHAIN = arm-linux-androideabi
#TARGET_CFLAGS_ADDON = -mthumb -Ofast -fdata-sections -ffunction-sections -fvisibility=hidden -fexceptions -D__ANDROID_API__=$(API)
#TARGET_CXXFLAGS_ADDON = $(TARGET_CFLAGS_ADDON) -frtti
#CROSS_PREFIX = arm-linux-androideabi
#CROSS_CC = clang
#CROSS_CXX = clang++
#HOST_CC = "gcc -m32" # required for LuaJIT
#COMPILER_VERSION = clang
#APP_STL = c++_static
#APP_STL_LIB = libc++

######################################################################################
# toolchain config for ARM64 (Clang)
######################################################################################

API = 21
TARGET_HOST = arm-linux
TARGET_ABI = arm64-v8a
TARGET_ARCH = arm64
TARGET_TOOLCHAIN = aarch64-linux-android
TARGET_CFLAGS_ADDON = -Ofast -fvisibility=hidden -fexceptions -D__ANDROID_API__=$(API)
TARGET_CXXFLAGS_ADDON = $(TARGET_CFLAGS_ADDON) -frtti
CROSS_PREFIX = aarch64-linux-android
CROSS_CC = clang
CROSS_CXX = clang++
HOST_CC = "gcc -m64" # required for LuaJIT
COMPILER_VERSION = clang
APP_STL = c++_static
APP_STL_LIB = libc++

######################################################################################
# toolchain config for x86 (clang)
######################################################################################

#API = 16
#TARGET_HOST = x86-linux
#TARGET_ABI = x86
#TARGET_ARCH = x86
#TARGET_TOOLCHAIN = x86
#TARGET_CFLAGS_ADDON = -march=i686 -mtune=intel -mssse3 -mfpmath=sse -m32 -Ofast -funroll-loops -fdata-sections -ffunction-sections -fvisibility=hidden -fexceptions -D__ANDROID_API__=$(API)
#TARGET_CXXFLAGS_ADDON = $(TARGET_CFLAGS_ADDON) -frtti
#CROSS_PREFIX = i686-linux-android
#CROSS_CC = clang
#CROSS_CXX = clang++
#HOST_CC = "gcc -m32" # required for LuaJIT
#COMPILER_VERSION = clang
#APP_STL = c++_static
#APP_STL_LIB = libc++

######################################################################################

SHELL := /bin/bash
ANDR_ROOT = $(shell pwd)

LEVELDB_VERSION = 1.20
LEVELDB_DIR = $(ANDR_ROOT)/deps/leveldb
LEVELDB_LIB = $(LEVELDB_DIR)/out-static/libleveldb.a
LEVELDB_TIMESTAMP = $(LEVELDB_DIR)/timestamp
LEVELDB_TIMESTAMP_INT = $(ANDR_ROOT)/deps/leveldb_timestamp
LEVELDB_URL = https://github.com/google/leveldb/archive/v$(LEVELDB_VERSION).zip

OPENAL_VERSION = v1.19
#OPENAL_VERSION = c0cf323e1d56ce605e90927324d2fdafcfbb564a # Release 1.20.0
OPENAL_DIR = $(ANDR_ROOT)/deps/openal-soft
OPENAL_LIB = $(OPENAL_DIR)/libopenal.a
OPENAL_TIMESTAMP = $(OPENAL_DIR)/timestamp
OPENAL_TIMESTAMP_INT = $(ANDR_ROOT)/deps/openal_timestamp
OPENAL_URL_GIT = https://github.com/kcat/openal-soft/

VORBIS_DIR = $(ANDR_ROOT)/deps/libvorbis-android
VORBIS_LIB = $(VORBIS_DIR)/obj/local/$(TARGET_ABI)/libvorbis.a
VORBIS_TIMESTAMP = $(VORBIS_DIR)/timestamp
VORBIS_TIMESTAMP_INT = $(ANDR_ROOT)/deps/vorbis_timestamp
VORBIS_URL_GIT = https://github.com/MoNTE48/libvorbis-android

IRRLICHT_BRANCH = ogl-es
IRRLICHT_DIR = $(ANDR_ROOT)/deps/irrlicht
IRRLICHT_LIB = $(IRRLICHT_DIR)/lib/Android/libIrrlicht.a
IRRLICHT_TIMESTAMP = $(IRRLICHT_DIR)/timestamp
IRRLICHT_TIMESTAMP_INT = $(ANDR_ROOT)/deps/irrlicht_timestamp
IRRLICHT_URL_HTTP = https://github.com/MoNTE48/Irrlicht/archive/$(IRRLICHT_BRANCH).zip

CURL_VERSION = 7.67.0
CURL_DIR = $(ANDR_ROOT)/deps/curl
CURL_LIB = $(CURL_DIR)/lib/.libs/libcurl.a
CURL_TIMESTAMP = $(CURL_DIR)/timestamp
CURL_TIMESTAMP_INT = $(ANDR_ROOT)/deps/curl_timestamp
CURL_URL_HTTP = http://dl.uxnr.de/mirror/curl/curl-${CURL_VERSION}.tar.bz2

FREETYPE_VERSION = 2.10.1
FREETYPE_DIR = $(ANDR_ROOT)/deps/freetype
FREETYPE_LIB = $(FREETYPE_DIR)/objs/.libs/libfreetype.a
FREETYPE_TIMESTAMP = $(FREETYPE_DIR)/timestamp
FREETYPE_TIMESTAMP_INT = $(ANDR_ROOT)/deps/freetype_timestamp
FREETYPE_URL_HTTP = https://sourceforge.net/projects/freetype/files/freetype2/$(FREETYPE_VERSION)/freetype-$(FREETYPE_VERSION).tar.xz

ICONV_VERSION = 1.16
ICONV_DIR = $(ANDR_ROOT)/deps/libiconv
ICONV_URL_HTTP = https://ftp.gnu.org/pub/gnu/libiconv/libiconv-$(ICONV_VERSION).tar.gz

LUAJIT_VERSION = 2.1.2
LUAJIT_DIR = $(ANDR_ROOT)/deps/luajit
LUAJIT_LIB = $(LUAJIT_DIR)src/libluajit.a
LUAJIT_TIMESTAMP = $(LUAJIT_DIR)/timestamp
LUAJIT_TIMESTAMP_INT = $(ANDR_ROOT)/deps/luajit_timestamp
LUAJIT_URL_HTTP = https://github.com/moonjit/moonjit/archive/${LUAJIT_VERSION}.zip

GMP_VERSION = 6.1.2
GMP_DIR = $(ANDR_ROOT)/deps/gmp
GMP_LIB = $(GMP_DIR)/usr/lib/libgmp.a
GMP_TIMESTAMP = $(GMP_DIR)/timestamp
GMP_TIMESTAMP_INT = $(ANDR_ROOT)/deps/gmp_timestamp
GMP_URL_HTTP = https://gmplib.org/download/gmp/gmp-$(GMP_VERSION).tar.xz

######################################################################################

ANDROID_NDK = $(shell grep '^ndk\.dir' local.properties | sed 's/^.*=[[:space:]]*//')

release : local.properties
	$(MAKE) deps

local.properties:
	@echo "Please specify path of ANDROID NDK";							\
	echo "e.g. $$HOME/Android/android-ndk-r20/";						\
	read ANDROID_NDK ;													\
	if [ ! -d $$ANDROID_NDK ] ; then									\
		echo "$$ANDROID_NDK is not a valid folder";						\
		exit 1;															\
	fi;																	\
	echo "ndk.dir = $$ANDROID_NDK" > local.properties;

$(OPENAL_TIMESTAMP) : openal_download
	@LAST_MODIF=$$(find ${OPENAL_DIR} -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ");\
	if [ $$(basename $$LAST_MODIF) != "timestamp" ] ; then				\
		touch ${OPENAL_TIMESTAMP};										\
	fi

openal_download :
	@if [ ! -d ${OPENAL_DIR} ] ; then									\
		echo "openal sources missing, downloading...";					\
		mkdir -p ${ANDR_ROOT}/deps;										\
		cd ${ANDR_ROOT}/deps;											\
		git clone --branch ${OPENAL_VERSION} ${OPENAL_URL_GIT}			\
			openal-soft || exit 1;										\
#		git clone ${OPENAL_URL_GIT} || exit 1;							\
		cd ${OPENAL_DIR};												\
#		git reset --hard ${OPENAL_VERSION};								\
		sed '/CMAKE_FIND_ROOT_PATH / s/^/#/' -i XCompile-Android.txt;	\
		sed '/CMAKE_C_COMPILER/ s/-gcc"/-clang"/' -i XCompile-Android.txt;\
		sed '/CMAKE_CXX_COMPILER/ s/-g++"/-clang++"/' -i XCompile-Android.txt;\
	fi

openal : $(OPENAL_LIB)

$(OPENAL_LIB): $(OPENAL_TIMESTAMP)
	+@REFRESH=0;														\
	if [ ! -e ${OPENAL_TIMESTAMP_INT} ] ; then							\
		REFRESH=1;														\
	fi;																	\
	if [ ${OPENAL_TIMESTAMP} -nt ${OPENAL_TIMESTAMP_INT} ] ; then		\
		REFRESH=1;														\
	fi;																	\
	if [ $$REFRESH -ne 0 ] ; then										\
	echo "changed timestamp for openal detected building...";			\
	cd ${OPENAL_DIR};													\
	export TOOLCHAIN=/tmp/ndk-${TARGET_HOST}-openal;					\
	${ANDROID_NDK}/build/tools/make_standalone_toolchain.py				\
		--arch ${TARGET_ARCH}											\
		--api ${API}													\
		--stl=${APP_STL_LIB}											\
		--install-dir=$${TOOLCHAIN};									\
	if [[ ${COMPILER_VERSION} == "clang" && ${API} -lt 18 ]] ; then		\
		cd "$${TOOLCHAIN}/sysroot/usr/local/include";					\
		sed '/log2f/ s/^/\/\//' -i math.h;								\
		cd ${OPENAL_DIR};												\
	fi;																	\
	export PATH="$${TOOLCHAIN}/bin:$${PATH}";							\
	cmake .																\
		-DCMAKE_TOOLCHAIN_FILE=XCompile-Android.txt -DLIBTYPE=STATIC	\
		-DCMAKE_C_FLAGS="${TARGET_CFLAGS_ADDON}"						\
		-DHOST=${CROSS_PREFIX} -DCMAKE_FIND_ROOT_PATH=$${TOOLCHAIN}		\
		-DALSOFT_NO_CONFIG_UTIL=TRUE || exit 1;							\
	$(MAKE) || exit 1;													\
	touch ${OPENAL_TIMESTAMP};											\
	touch ${OPENAL_TIMESTAMP_INT};										\
	$(RM) -rf $${TOOLCHAIN};											\
	else																\
		echo "nothing to be done for openal";							\
	fi

clean_openal :
	$(RM) -rf ${OPENAL_DIR}

$(VORBIS_TIMESTAMP) : vorbis_download
	@LAST_MODIF=$$(find ${VORBIS_DIR} -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ");\
	if [ $$(basename $$LAST_MODIF) != "timestamp" ] ; then				\
		touch ${VORBIS_TIMESTAMP};										\
	fi

vorbis_download :
	@if [ ! -d ${VORBIS_DIR} ] ; then									\
		echo "vorbis sources missing, downloading...";					\
		mkdir -p ${ANDR_ROOT}/deps;										\
		cd ${ANDR_ROOT}/deps ;											\
		git clone ${VORBIS_URL_GIT} || exit 1;							\
	fi

vorbis : $(VORBIS_LIB)

$(VORBIS_LIB) : $(VORBIS_TIMESTAMP)
	+@REFRESH=0;														\
	if [ ! -e ${VORBIS_TIMESTAMP_INT} ] ; then							\
		echo "${VORBIS_TIMESTAMP_INT} doesn't exist";					\
		REFRESH=1;														\
	fi;																	\
	if [ ${VORBIS_TIMESTAMP} -nt ${VORBIS_TIMESTAMP_INT} ] ; then		\
		REFRESH=1;														\
	fi;																	\
	if [ $$REFRESH -ne 0 ] ; then										\
	echo "changed timestamp for vorbis detected building...";			\
	cd ${VORBIS_DIR};													\
	${ANDROID_NDK}/ndk-build											\
		NDEBUG=1														\
		APP_PLATFORM=android-${API}										\
		TARGET_ABI=${TARGET_ABI}										\
		APP_STL=${APP_STL}												\
		COMPILER_VERSION=${COMPILER_VERSION}							\
		NDK_APPLICATION_MK=${ANDR_ROOT}/Deps.mk || exit 1;				\
	touch ${VORBIS_TIMESTAMP};											\
	touch ${VORBIS_TIMESTAMP_INT};										\
	else																\
		echo "nothing to be done for libvorbis";						\
	fi

clean_vorbis :
	$(RM) -rf ${VORBIS_DIR}

$(LEVELDB_TIMESTAMP) : leveldb_download
	@LAST_MODIF=$$(find ${LEVELDB_DIR} -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ");\
	if [ $$(basename $$LAST_MODIF) != "timestamp" ] ; then				\
		touch ${LEVELDB_TIMESTAMP};										\
	fi

leveldb_download :
	@if [ ! -d ${LEVELDB_DIR} ] ; then									\
		echo "leveldb sources missing, downloading...";					\
		mkdir -p ${ANDR_ROOT}/deps;										\
		cd ${ANDR_ROOT}/deps ;											\
		wget ${LEVELDB_URL} || exit 1;									\
		unzip v${LEVELDB_VERSION}.zip || exit 1;						\
		rm v${LEVELDB_VERSION}.zip || exit 1;							\
		mv leveldb-${LEVELDB_VERSION} leveldb || exit 1;				\
	fi

leveldb : $(LEVELDB_LIB)
$(LEVELDB_LIB): $(LEVELDB_TIMESTAMP)
	@REFRESH=0;															\
	if [ ! -e ${LEVELDB_TIMESTAMP_INT} ] ; then							\
		REFRESH=1;														\
	fi;																	\
	if [ ${LEVELDB_TIMESTAMP} -nt ${LEVELDB_TIMESTAMP_INT} ] ; then		\
		REFRESH=1;														\
	fi;																	\
	if [ $$REFRESH -ne 0 ] ; then										\
	echo "changed timestamp for leveldb detected building...";			\
	cd deps/leveldb;													\
	export TOOLCHAIN=/tmp/ndk-${TARGET_HOST}-leveldb;					\
	${ANDROID_NDK}/build/tools/make_standalone_toolchain.py				\
		--arch ${TARGET_ARCH}											\
		--api ${API}													\
		--stl=${APP_STL_LIB}											\
		--install-dir=$${TOOLCHAIN};									\
	export PATH="$${TOOLCHAIN}/bin:$${PATH}";							\
	export CC=${CROSS_CC};												\
	export CXX=${CROSS_CXX};											\
	export TARGET_OS=OS_ANDROID_CROSSCOMPILE;							\
	export CFLAGS="$${CFLAGS} ${TARGET_CFLAGS_ADDON}";					\
	export CXXFLAGS="$${CPPFLAGS} ${TARGET_CXXFLAGS_ADDON}";			\
	$(MAKE) out-static/libleveldb.a || exit 1;							\
	touch ${LEVELDB_TIMESTAMP};											\
	touch ${LEVELDB_TIMESTAMP_INT};										\
	$(RM) -rf $${TOOLCHAIN};											\
	else																\
		echo "nothing to be done for leveldb";							\
	fi

clean_leveldb :
	$(RM) -rf deps/leveldb

$(FREETYPE_TIMESTAMP) : freetype_download
	@LAST_MODIF=$$(find ${FREETYPE_DIR} -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ");\
	if [ $$(basename $$LAST_MODIF) != "timestamp" ] ; then				\
		touch ${FREETYPE_TIMESTAMP};									\
	fi

freetype_download :
	@if [ ! -d ${FREETYPE_DIR} ] ; then									\
		echo "freetype sources missing, downloading...";				\
		mkdir -p ${ANDR_ROOT}/deps;										\
		cd deps;														\
		mkdir freetype;													\
		wget ${FREETYPE_URL_HTTP} || exit 1;							\
		tar -xJf freetype-${FREETYPE_VERSION}.tar.xz -C freetype		\
			--strip-components=1 || exit 1;								\
		rm freetype-${FREETYPE_VERSION}.tar.xz;							\
	fi

freetype : $(FREETYPE_LIB)

$(FREETYPE_LIB) : $(FREETYPE_TIMESTAMP)
	+@REFRESH=0;														\
	if [ ! -e ${FREETYPE_TIMESTAMP_INT} ] ; then						\
		REFRESH=1;														\
	fi;																	\
	if [ ! -e ${FREETYPE_LIB} ] ; then									\
		REFRESH=1;														\
	fi;																	\
	if [ ${FREETYPE_TIMESTAMP} -nt ${FREETYPE_TIMESTAMP_INT} ] ; then	\
		REFRESH=1;														\
	fi;																	\
	if [ $$REFRESH -ne 0 ] ; then										\
	mkdir -p ${FREETYPE_DIR};											\
	export PATH=$$PATH:${ANDROID_NDK};									\
	echo "changed timestamp for freetype detected building...";			\
	cd deps/freetype;													\
	export TOOLCHAIN=/tmp/ndk-${TARGET_HOST}-freetype;					\
	${ANDROID_NDK}/build/tools/make_standalone_toolchain.py				\
		--arch ${TARGET_ARCH}											\
		--api ${API}													\
		--stl=${APP_STL_LIB}											\
		--install-dir=$${TOOLCHAIN};									\
	export PATH="$${TOOLCHAIN}/bin:$${PATH}";							\
	export TARGET_OS=OS_ANDROID_CROSSCOMPILE;							\
	export CPPFLAGS="$${CPPFLAGS} ${TARGET_CXXFLAGS_ADDON} -fPIC";			\
	export CFLAGS="$${CFLAGS} ${TARGET_CFLAGS_ADDON}";					\
	CC=${CROSS_CC} ./configure --host=${TARGET_TOOLCHAIN}				\
		--enable-static --disable-shared --with-zlib=yes				\
		--with-bzip2=no --with-png=no --with-harfbuzz=no				\
		--prefix=${TOOLCHAIN} || exit 1;								\
	CC=${CROSS_CC} ANDROID_DEV=/tmp/ndk-${TARGET_HOST}-freetype			\
		$(MAKE) || exit 1;												\
	touch ${FREETYPE_TIMESTAMP};										\
	touch ${FREETYPE_TIMESTAMP_INT};									\
	$(RM) -rf $${TOOLCHAIN};											\
	else																\
		echo "nothing to be done for freetype";							\
	fi

clean_freetype :
	$(RM) -rf ${FREETYPE_DIR}

iconv_download :
	@if [ ! -d ${ICONV_DIR} ] ; then									\
		echo "iconv sources missing, downloading...";					\
		mkdir -p ${ANDR_ROOT}/deps;										\
		cd ${ANDR_ROOT}/deps;											\
		wget ${ICONV_URL_HTTP} || exit 1;								\
		tar -xzf libiconv-${ICONV_VERSION}.tar.gz || exit 1;			\
		rm libiconv-${ICONV_VERSION}.tar.gz;							\
		mv libiconv-${ICONV_VERSION} libiconv;							\
		cd libiconv;													\
		export TOOLCHAIN=/tmp/ndk-${TARGET_HOST}-iconv;					\
		${ANDROID_NDK}/build/tools/make_standalone_toolchain.py			\
			--arch ${TARGET_ARCH}										\
			--api ${API}												\
			--stl=${APP_STL_LIB}										\
			--install-dir=$${TOOLCHAIN};								\
		./configure || exit 1;											\
	fi

clean_iconv :
	$(RM) -rf ${ICONV_DIR}

irrlicht_download :
	@if [ ! -d "deps/irrlicht" ] ; then									\
		echo "irrlicht sources missing, downloading...";				\
		mkdir -p ${ANDR_ROOT}/deps;										\
		cd deps;														\
		wget ${IRRLICHT_URL_HTTP} || exit 1;							\
		unzip ${IRRLICHT_BRANCH}.zip || exit 1;							\
		rm ${IRRLICHT_BRANCH}.zip;										\
		mv Irrlicht-${IRRLICHT_BRANCH} irrlicht;						\
		cd irrlicht;													\
		mkdir -p lib/Android;											\
	fi

$(IRRLICHT_TIMESTAMP) : irrlicht_download
	@LAST_MODIF=$$(find ${IRRLICHT_DIR} -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ");\
	if [ $$(basename $$LAST_MODIF) != "timestamp" ] ; then				\
		touch ${IRRLICHT_TIMESTAMP};									\
	fi

irrlicht : $(IRRLICHT_LIB)

$(IRRLICHT_LIB): $(IRRLICHT_TIMESTAMP)
	+@REFRESH=0;														\
	if [ ! -e ${IRRLICHT_TIMESTAMP_INT} ] ; then						\
		REFRESH=1;														\
	fi;																	\
	if [ ! -e ${IRRLICHT_LIB} ] ; then									\
		REFRESH=1;														\
	fi;																	\
	if [ ${IRRLICHT_TIMESTAMP} -nt ${IRRLICHT_TIMESTAMP_INT} ] ; then	\
		REFRESH=1;														\
	fi;																	\
	if [ $$REFRESH -ne 0 ] ; then										\
	mkdir -p ${IRRLICHT_DIR};											\
	echo "changed timestamp for irrlicht detected building...";			\
	cd deps/irrlicht/source/Irrlicht/Android;							\
	export APP_PLATFORM=android-${API};									\
	export TARGET_ABI=${TARGET_ABI};									\
	${ANDROID_NDK}/ndk-build											\
		NDEBUG=1														\
		APP_PLATFORM=android-${API}										\
		TARGET_ABI=${TARGET_ABI}										\
		APP_STL=${APP_STL}												\
		COMPILER_VERSION=${COMPILER_VERSION}							\
		TARGET_CPPFLAGS_ADDON="${TARGET_CXXFLAGS_ADDON}"				\
		TARGET_CFLAGS_ADDON="${TARGET_CFLAGS_ADDON}"					\
		NDK_APPLICATION_MK=${ANDR_ROOT}/Irrlicht.mk || exit 1;			\
	touch ${IRRLICHT_TIMESTAMP};										\
	touch ${IRRLICHT_TIMESTAMP_INT};									\
	else																\
		echo "nothing to be done for irrlicht";							\
	fi

clean_irrlicht :
	$(RM) -rf deps/irrlicht

$(CURL_TIMESTAMP) : curl_download
	@LAST_MODIF=$$(find ${CURL_DIR} -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ");\
	if [ $$(basename $$LAST_MODIF) != "timestamp" ] ; then				\
		touch ${CURL_TIMESTAMP};										\
	fi

curl_download :
	@if [ ! -d "deps/curl" ] ; then										\
		echo "curl sources missing, downloading...";					\
		mkdir -p ${ANDR_ROOT}/deps;										\
		cd deps;														\
		wget ${CURL_URL_HTTP} || exit 1;								\
		tar -xjf curl-${CURL_VERSION}.tar.bz2 || exit 1;				\
		rm curl-${CURL_VERSION}.tar.bz2;								\
		mv curl-${CURL_VERSION} curl;									\
	fi

curl : $(CURL_LIB)

$(CURL_LIB) : $(CURL_TIMESTAMP)
	@REFRESH=0;															\
	if [ ! -e ${CURL_TIMESTAMP_INT} ] ; then							\
		REFRESH=1;														\
	fi;																	\
	if [ ! -e ${CURL_LIB} ] ; then										\
		REFRESH=1;														\
	fi;																	\
	if [ ${CURL_TIMESTAMP} -nt ${CURL_TIMESTAMP_INT} ] ; then			\
		REFRESH=1;														\
	fi;																	\
	if [ $$REFRESH -ne 0 ] ; then										\
	mkdir -p ${CURL_DIR};												\
	echo "changed timestamp for curl detected building...";				\
	cd deps/curl;														\
	export TOOLCHAIN=/tmp/ndk-${TARGET_HOST}-curl;						\
	${ANDROID_NDK}/build/tools/make_standalone_toolchain.py				\
		--arch ${TARGET_ARCH}											\
		--api ${API}													\
		--stl=${APP_STL_LIB}											\
		--install-dir=$${TOOLCHAIN};									\
	export PATH="$${TOOLCHAIN}/bin:$${PATH}";							\
	export CC=${CROSS_CC};												\
	export CXX=${CROSS_CXX};											\
	export TARGET_OS=OS_ANDROID_CROSSCOMPILE;							\
	export CPPFLAGS="$${CPPFLAGS} ${TARGET_CXXFLAGS_ADDON}";			\
	./configure --host=${TARGET_TOOLCHAIN}								\
		--disable-shared --enable-static --disable-debug				\
		--disable-verbose --disable-versioned-symbols					\
		--enable-hidden-symbols --disable-dependency-tracking			\
		--disable-proxy --disable-cookies --disable-crypto-auth			\
		--disable-manual --disable-ares --disable-ftp					\
		--disable-unix-sockets --without-libidn --without-librtmp		\
		--without-ssl --disable-sspi --disable-ldap --disable-ldaps		\
		--disable-rtsp --disable-dict --disable-telnet --disable-tftp	\
		--disable-pop3 --disable-imap --disable-smtp --disable-gopher	\
		--disable-libcurl-option;										\
	$(MAKE) -s || exit 1;												\
	touch ${CURL_TIMESTAMP};											\
	touch ${CURL_TIMESTAMP_INT};										\
	$(RM) -rf $${TOOLCHAIN};											\
	else																\
		echo "nothing to be done for curl";								\
	fi

clean_curl :
	$(RM) -R ${CURL_DIR}

$(LUAJIT_TIMESTAMP) : luajit_download
	@LAST_MODIF=$$(find ${LUAJIT_DIR} -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ");\
	if [ $$(basename $$LAST_MODIF) != "timestamp" ] ; then				\
		touch ${LUAJIT_TIMESTAMP};										\
	fi

luajit_download :
	@if [ ! -d ${LUAJIT_DIR} ] ; then									\
		echo "luajit sources missing, downloading...";					\
		mkdir -p ${ANDR_ROOT}/deps;										\
		cd ${ANDR_ROOT}/deps;											\
		wget ${LUAJIT_URL_HTTP} || exit 1;								\
		unzip ${LUAJIT_VERSION}.zip || exit 1;							\
		rm ${LUAJIT_VERSION}.zip;										\
		mv moonjit-${LUAJIT_VERSION} luajit;							\
	fi

luajit : $(LUAJIT_LIB)

$(LUAJIT_LIB) : $(LUAJIT_TIMESTAMP)
	@REFRESH=0;															\
	if [ ! -e ${LUAJIT_TIMESTAMP_INT} ] ; then							\
		REFRESH=1;														\
	fi;																	\
	if [ ${LUAJIT_TIMESTAMP} -nt ${LUAJIT_TIMESTAMP_INT} ] ; then		\
		REFRESH=1;														\
	fi;																	\
	if [ $$REFRESH -ne 0 ] ; then										\
	mkdir -p ${LUAJIT_DIR};												\
	export PATH=$$PATH:${ANDROID_NDK};									\
	echo "changed timestamp for luajit detected building...";			\
	cd ${LUAJIT_DIR};													\
	export TOOLCHAIN=/tmp/ndk-${TARGET_HOST}-luajit;					\
	${ANDROID_NDK}/build/tools/make_standalone_toolchain.py				\
		--arch ${TARGET_ARCH}											\
		--api ${API}													\
		--stl=${APP_STL_LIB}											\
		--install-dir=$${TOOLCHAIN};									\
	export PATH="$${TOOLCHAIN}/bin:$${PATH}";							\
	export TARGET_FLAGS="${TARGET_CFLAGS_ADDON} -fno-fast-math";		\
	$(MAKE) amalg CROSS=${CROSS_PREFIX}- TARGET_CC=${CROSS_PREFIX}-clang		\
	XCFLAGS="-DLUAJIT_DISABLE_FFI" HOST_CC=${HOST_CC} BUILDMODE=static;	\
	touch ${LUAJIT_TIMESTAMP};											\
	touch ${LUAJIT_TIMESTAMP_INT};										\
	$(RM) -rf $${TOOLCHAIN};											\
	else																\
		echo "nothing to be done for luajit";							\
	fi

clean_luajit :
	$(RM) -R deps/luajit

$(GMP_TIMESTAMP) : gmp_download
	@LAST_MODIF=$$(find ${GMP_DIR} -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ");\
	if [ $$(basename $$LAST_MODIF) != "timestamp" ] ; then				\
		touch ${GMP_TIMESTAMP};											\
	fi

gmp_download :
	@if [ ! -d "${GMP_DIR}" ] ; then									\
		echo "gmp sources missing, downloading...";						\
		mkdir -p ${ANDR_ROOT}/deps;										\
		cd deps;														\
		mkdir gmp;														\
		wget ${GMP_URL_HTTP} || exit 1;									\
		tar -xJf gmp-${GMP_VERSION}.tar.xz -C gmp						\
			--strip-components=1 || exit 1;								\
		rm gmp-${GMP_VERSION}.tar.xz;									\
	fi

gmp : $(GMP_LIB)

$(GMP_LIB) : $(GMP_TIMESTAMP)
	@REFRESH=0;															\
	if [ ! -e ${GMP_TIMESTAMP_INT} ] ; then								\
		REFRESH=1;														\
	fi;																	\
	if [ ! -e ${GMP_LIB} ] ; then										\
		REFRESH=1;														\
	fi;																	\
	if [ ${GMP_TIMESTAMP} -nt ${GMP_TIMESTAMP_INT} ] ; then				\
		REFRESH=1;														\
	fi;																	\
	if [ $$REFRESH -ne 0 ] ; then										\
	mkdir -p ${GMP_DIR};												\
	echo "changed timestamp for gmp detected building...";				\
	cd deps/gmp;														\
	export TOOLCHAIN=/tmp/ndk-${TARGET_HOST}-gmp;						\
	${ANDROID_NDK}/build/tools/make_standalone_toolchain.py				\
		--arch ${TARGET_ARCH}											\
		--api ${API}													\
		--stl=${APP_STL_LIB}											\
		--install-dir=$${TOOLCHAIN};									\
	export PATH="$${TOOLCHAIN}/bin:$${PATH}";							\
	export CC=${CROSS_CC};												\
	export CXX=${CROSS_CXX};											\
	export TARGET_OS=OS_ANDROID_CROSSCOMPILE;							\
	export CFLAGS="$${CFLAGS} ${TARGET_CFLAGS_ADDON}";					\
	export CXXFLAGS="$${CPPFLAGS} ${TARGET_CXXFLAGS_ADDON}";			\
	./configure --host=${TARGET_TOOLCHAIN}								\
	--enable-static --disable-shared --prefix=/usr;						\
	$(MAKE) install DESTDIR=/${GMP_DIR} || exit 1;						\
	touch ${GMP_TIMESTAMP};												\
	touch ${GMP_TIMESTAMP_INT};											\
	$(RM) -rf $${TOOLCHAIN};											\
	else																\
		echo "nothing to be done for gmp";								\
	fi

clean_gmp :
	$(RM) -R deps/gmp

deps : $(IRRLICHT_LIB) $(FREETYPE_LIB) $(CURL_LIB) $(LEVELDB_LIB)		\
	$(LUAJIT_LIB) $(OPENAL_LIB) $(VORBIS_LIB) $(GMP_LIB) iconv_download

clean_all :
	$(RM) -R deps
