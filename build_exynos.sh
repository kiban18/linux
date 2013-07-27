#!/bin/bash

case $OSTYPE in
	linux*)
		export CROSS_COMPILE=arm-linux-gnueabi-
		#export HOST_EXTRACFLAGS="-v --save-temps"
		;;
	darwin*)
		export CROSS_COMPILE=~/kernel/android/toolchain/arm-linux-androideabi-4.7/bin/arm-linux-androideabi-
		export HOST_EXTRACFLAGS="-I ~/kernel/linux_host_include"
		#export HOST_EXTRACFLAGS="-I ~/kernel/linux_host_include -v --save-temps"
		;;
esac

export ARCH=arm
export SUBARCH=arm

export TARGET=$*

make exynos_defconfig
make $TARGET 2>&1 | tee make.log

vim +/\\cerror:.* make.log
