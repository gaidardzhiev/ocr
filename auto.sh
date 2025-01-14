#!/bin/sh

set -x

#if termux-camera-photo /sdcard/image.jpg; then
#	if ./ocr /sdcard/image.jpg ; then
#		rm /sdcard/image.jpg
#		exit 0
#	else
#		printf "something's wrong in here somewhere...\n"
#		exit 2
#	fi
#else
#	printf "something's wrong in here somewhere...\n"
#	exit 1
#fi

termux-camera-photo /sdcard/image.jpg && ./ocr /sdcard/image.jpg && rm /sdcard/image.jpg && exit 0

printf "something's wrong in here somewhere...\n" && exit 1
