CC=gcc
BINS=ocr
ARCH=$(shell uname -m)

ifeq ($(ARCH), armv8l)
$(BINS): %: %.s
	$(CC) -w -o $@ $< -I/usr/include/tesseract -I/usr/include/leptonica -L/usr/lib -ltesseract -lleptonica -lc
else 
$(BINS): %: %.c
	$(CC) -w -o $@ $< -I/usr/include/tesseract -I/usr/include/leptonica -L/usr/lib -ltesseract -lleptonica
endif

test:
	@./ocr image.png | grep "A" > /dev/null 2>&1 && printf "success...\n" || printf "error...\n"

clean:
	rm $(BINS)
