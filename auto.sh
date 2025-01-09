#!/bin/sh

set -x

if termux-camera-photo /sdcard/image.jpg; then
	./ocr /sdcard/image.jpg
else
	printf "something's wrong in here somewhere...\n"
fi
