#!/bin/bash
ADDI_CFLAGS="-marm"
API=27
PLATFORM=arm-linux-androideabi
CPU=armv7-a
#使用自己的路径
NDK=/Users/tao/Downloads/android-ndk-r16b
SYSROOT=$NDK/platforms/android-$API/arch-arm/
ISYSROOT=$NDK/sysroot
ASM=$ISYSROOT/usr/include/$PLATFORM
TOOLCHAIN=$NDK/toolchains/$PLATFORM-4.9/prebuilt/darwin-x86_64
#手动创建输出目录
OUTPUT=/Users/tao/Downloads/ffmpeg-4.0.4/ffmpegtemp
function build_one
{
./configure \
--prefix=$OUTPUT \
--enable-shared \
--disable-static \
--disable-doc \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-avdevice \
--disable-doc \
--disable-symver \
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--target-os=android \
--arch=arm \
--enable-cross-compile \
--sysroot=$SYSROOT \
--extra-cflags="-I$ASM -isysroot $ISYSROOT -Os -fpic -marm" \
--extra-ldflags="-marm" \
$ADDITIONAL_CONFIGURE_FLAG
  #make clean
  #make -j4 
  #make install
}

build_one
