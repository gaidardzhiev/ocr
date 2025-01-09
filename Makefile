CC=gcc
BINS=ocr
ARCH=$(shell uname -m)


ifeq ($(ARCH), armv8l)
$(BINS): %: %.s
	$(CC) -w -o $@ $< -I/usr/include/tesseract -I/usr/include/leptonica -L/usr/lib -ltesseract -lleptonica -lc
else 
$(BINS): %: %.s
	$(CC) -w -o $@ $< -I/usr/include/tesseract -I/usr/include/leptonica -L/usr/lib -ltesseract -lleptonica
endif

test:
	@./ocr image.png | grep "A" && printf "success...\n" || printf "error...\n"

clean:
	rm $(BINS)
