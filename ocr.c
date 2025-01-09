#include <stdio.h>
#include <stdlib.h>
#include <tesseract/capi.h>
#include <leptonica/allheaders.h>

void ocr(const char *f) {
	TessBaseAPI *a = TessBaseAPICreate();
	if (TessBaseAPIInit3(a, NULL, "eng") != 0) {
		fprintf(stderr, "could not initialize tesseract...\n");
		TessBaseAPIDelete(a);
		return;
	}
	struct Pix *i = pixRead(f);
	if (i == NULL) {
		fprintf(stderr, "could not read image file: %s\n", f);
		TessBaseAPIDelete(a);
		return;
	}
	TessBaseAPISetImage2(a, i);
	TessBaseAPIRecognize(a, NULL);
	char *t = TessBaseAPIGetUTF8Text(a);
	if (t != NULL) {
		printf("text:\n\n%s\n", t);
		free(t);
	} else {
		fprintf(stderr, "could not retrieve recognized text...\n");
	}
	TessBaseAPIDelete(a);
	pixDestroy(&i);
}


int main(int z, char *x[]) {
	if (z < 2) {
		fprintf(stderr, "usage: %s <image>\n", x[0]);
		return 1;
	}
	ocr(x[1]);
	return 0;
}
