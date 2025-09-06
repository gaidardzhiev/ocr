// Copyright (C) 2025 Ivan Gaydardzhiev
// Licensed under the GPL-3.0-only

.text
.section	.rodata
.align	2
.type	ADDED_BORDER, %object
.size	ADDED_BORDER, 4
ADDED_BORDER:
.word	32
.align	2
.type	L_RED_SHIFT, %object
.size	L_RED_SHIFT, 4
L_RED_SHIFT:
.word	24
.align	2
.type	L_GREEN_SHIFT, %object
.size	L_GREEN_SHIFT, 4
L_GREEN_SHIFT:
.word	16
.align	2
.type	L_BLUE_SHIFT, %object
.size	L_BLUE_SHIFT, 4
L_BLUE_SHIFT:
.word	8
.align	2
.type	L_ALPHA_SHIFT, %object
.size	L_ALPHA_SHIFT, 4
L_ALPHA_SHIFT:
.space	4
.align	2
.type	L_RED_WEIGHT, %object
.size	L_RED_WEIGHT, 4
L_RED_WEIGHT:
.word	1050253722
.align	2
.type	L_GREEN_WEIGHT, %object
.size	L_GREEN_WEIGHT, 4
L_GREEN_WEIGHT:
.word	1056964608
.align	2
.type	L_BLUE_WEIGHT, %object
.size	L_BLUE_WEIGHT, 4
L_BLUE_WEIGHT:
.word	1045220557
.align	2
.LC0:
.ascii	"eng\000"
.align	2
.LC1:
.ascii	"could not initialize tesseract...\012\000"
.align	2
.LC2:
.ascii	"could not read image file: %s\012\000"
.align	2
.LC3:
.ascii	"text:\012\012%s\012\000"
.align	2
.LC4:
.ascii	"could not retrieve recognized text...\012\000"
.text
.align	2
.global	ocr
.syntax unified
.arm
.type	ocr, %function
ocr:
push	{r4, fp, lr}
add	fp, sp, #8
sub	sp, sp, #28
str	r0, [fp, #-32]
ldr	r4, .L9
.LPIC1:
add	r4, pc, r4
ldr	r2, .L9+4
.LPIC6:
add	r2, pc, r2
ldr	r3, .L9+8
ldr	r3, [r2, r3]
ldr	r3, [r3]
str	r3, [fp, #-16]
mov	r3, #0
bl	TessBaseAPICreate(PLT)
str	r0, [fp, #-24]
ldr	r3, .L9+12
.LPIC0:
add	r3, pc, r3
mov	r2, r3
mov	r1, #0
ldr	r0, [fp, #-24]
bl	TessBaseAPIInit3(PLT)
mov	r3, r0
cmp	r3, #0
beq	.L2
ldr	r3, .L9+16
ldr	r3, [r4, r3]
ldr	r3, [r3]
mov	r2, #34
mov	r1, #1
ldr	r0, .L9+20
.LPIC2:
add	r0, pc, r0
bl	fwrite(PLT)
ldr	r0, [fp, #-24]
bl	TessBaseAPIDelete(PLT)
b	.L1
.L2:
ldr	r0, [fp, #-32]
bl	pixRead(PLT)
mov	r3, r0
str	r3, [fp, #-28]
ldr	r3, [fp, #-28]
cmp	r3, #0
bne	.L4
ldr	r3, .L9+16
ldr	r3, [r4, r3]
ldr	r3, [r3]
ldr	r2, [fp, #-32]
ldr	r1, .L9+24
.LPIC3:
add	r1, pc, r1
mov	r0, r3
bl	fprintf(PLT)
ldr	r0, [fp, #-24]
bl	TessBaseAPIDelete(PLT)
b	.L1
.L4:
ldr	r3, [fp, #-28]
mov	r1, r3
ldr	r0, [fp, #-24]
bl	TessBaseAPISetImage2(PLT)
mov	r1, #0
ldr	r0, [fp, #-24]
bl	TessBaseAPIRecognize(PLT)
ldr	r0, [fp, #-24]
bl	TessBaseAPIGetUTF8Text(PLT)
str	r0, [fp, #-20]
ldr	r3, [fp, #-20]
cmp	r3, #0
beq	.L5
ldr	r1, [fp, #-20]
ldr	r3, .L9+28
.LPIC4:
add	r3, pc, r3
mov	r0, r3
bl	printf(PLT)
ldr	r0, [fp, #-20]
bl	free(PLT)
b	.L6
.L5:
ldr	r3, .L9+16
ldr	r3, [r4, r3]
ldr	r3, [r3]
mov	r2, #38
mov	r1, #1
ldr	r0, .L9+32
.LPIC5:
add	r0, pc, r0
bl	fwrite(PLT)
.L6:
ldr	r0, [fp, #-24]
bl	TessBaseAPIDelete(PLT)
sub	r3, fp, #28
mov	r0, r3
bl	pixDestroy(PLT)
.L1:
ldr	r2, .L9+36
.LPIC7:
add	r2, pc, r2
ldr	r3, .L9+8
ldr	r3, [r2, r3]
ldr	r2, [r3]
ldr	r3, [fp, #-16]
eors	r2, r3, r2
mov	r3, #0
beq	.L8
bl	__stack_chk_fail(PLT)
.L8:
sub	sp, fp, #8
pop	{r4, fp, pc}
.L10:
.align	2
.L9:
.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+8)
.word	_GLOBAL_OFFSET_TABLE_-(.LPIC6+8)
.word	__stack_chk_guard(GOT)
.word	.LC0-(.LPIC0+8)
.word	stderr(GOT)
.word	.LC1-(.LPIC2+8)
.word	.LC2-(.LPIC3+8)
.word	.LC3-(.LPIC4+8)
.word	.LC4-(.LPIC5+8)
.word	_GLOBAL_OFFSET_TABLE_-(.LPIC7+8)
.size	ocr, .-ocr
.section	.rodata
.align	2
.LC5:
.ascii	"usage: %s <image>\012\000"
.text
.align	2
.global	main
.syntax unified
.arm
.type	main, %function
main:
push	{fp, lr}
add	fp, sp, #4
sub	sp, sp, #8
str	r0, [fp, #-8]
str	r1, [fp, #-12]
ldr	r2, .L14
.LPIC8:
add	r2, pc, r2
ldr	r3, [fp, #-8]
cmp	r3, #1
bgt	.L12
ldr	r3, .L14+4
ldr	r3, [r2, r3]
ldr	r0, [r3]
ldr	r3, [fp, #-12]
ldr	r3, [r3]
mov	r2, r3
ldr	r3, .L14+8
.LPIC9:
add	r3, pc, r3
mov	r1, r3
bl	fprintf(PLT)
mov	r3, #1
b	.L13
.L12:
ldr	r3, [fp, #-12]
add	r3, r3, #4
ldr	r3, [r3]
mov	r0, r3
bl	ocr(PLT)
mov	r3, #0
.L13:
mov	r0, r3
sub	sp, fp, #4
pop	{fp, pc}
.L15:
.align	2
.L14:
.word	_GLOBAL_OFFSET_TABLE_-(.LPIC8+8)
.word	stderr(GOT)
.word	.LC5-(.LPIC9+8)
.size	main, .-main
