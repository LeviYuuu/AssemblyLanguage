	.file	"ascii_c.c"
	.intel_syntax noprefix
 # GNU C23 (x86_64-mcf-seh-rev0, Built by MinGW-Builds project) version 15.2.0 (x86_64-w64-mingw32)
 #	compiled by GNU C version 15.2.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.27-GMP

 # GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 # options passed: -masm=intel -mtune=core2 -march=nocona
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp	 #
	.seh_pushreg	rbp
	mov	rbp, rsp	 #,
	.seh_setframe	rbp, 0
	sub	rsp, 48	 #,
	.seh_stackalloc	48
	.seh_endprologue
 # ascii_c.c:3: int main() {
	call	__main	 #
 # ascii_c.c:4:     for (int i = 0; i < 26; i++) {
	mov	DWORD PTR -4[rbp], 0	 # i,
 # ascii_c.c:4:     for (int i = 0; i < 26; i++) {
	jmp	.L2	 #
.L4:
 # ascii_c.c:5:         printf("%c", 'a' + i);
	mov	eax, DWORD PTR -4[rbp]	 # tmp103, i
	add	eax, 97	 # _1,
	mov	ecx, eax	 #, _1
	call	putchar	 #
 # ascii_c.c:6:         if ((i + 1) % 13 == 0) {
	mov	eax, DWORD PTR -4[rbp]	 # tmp104, i
	lea	ecx, 1[rax]	 # _2,
 # ascii_c.c:6:         if ((i + 1) % 13 == 0) {
	movsx	rax, ecx	 # tmp105, _2
	imul	rax, rax, 1321528399	 # tmp106, tmp105,
	shr	rax, 32	 # tmp107,
	mov	edx, eax	 # tmp108, tmp107
	sar	edx, 2	 # tmp108,
	mov	eax, ecx	 # tmp109, _2
	sar	eax, 31	 # tmp109,
	sub	edx, eax	 # _3, tmp109
	mov	eax, edx	 # tmp110, _3
	add	eax, eax	 # tmp110
	add	eax, edx	 # tmp110, _3
	sal	eax, 2	 # tmp110,
	add	eax, edx	 # tmp110, _3
	sub	ecx, eax	 # _2, tmp110
	mov	edx, ecx	 # _3, _2
 # ascii_c.c:6:         if ((i + 1) % 13 == 0) {
	test	edx, edx	 # _3
	jne	.L3	 #,
 # ascii_c.c:7:             printf("\n");
	mov	ecx, 10	 #,
	call	putchar	 #
.L3:
 # ascii_c.c:4:     for (int i = 0; i < 26; i++) {
	add	DWORD PTR -4[rbp], 1	 # i,
.L2:
 # ascii_c.c:4:     for (int i = 0; i < 26; i++) {
	cmp	DWORD PTR -4[rbp], 25	 # i,
	jle	.L4	 #,
 # ascii_c.c:11:     return 0;
	mov	eax, 0	 # _9,
 # ascii_c.c:12: }
	add	rsp, 48	 #,
	pop	rbp	 #
	ret	
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (x86_64-mcf-seh-rev0, Built by MinGW-Builds project) 15.2.0"
	.def	putchar;	.scl	2;	.type	32;	.endef
