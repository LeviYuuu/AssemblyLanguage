	.file	"sum.c"
	.intel_syntax noprefix
 # GNU C23 (x86_64-mcf-seh-rev0, Built by MinGW-Builds project) version 15.2.0 (x86_64-w64-mingw32)
 #	compiled by GNU C version 15.2.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.27-GMP

 # GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 # options passed: -masm=intel -mtune=core2 -march=nocona
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "%d\12\0"
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
 # sum.c:3: int main() {
	call	__main	 #
 # sum.c:4:     int sum = 0;
	mov	DWORD PTR -4[rbp], 0	 # sum,
 # sum.c:5:     for (int i = 1; i <= 100; i++) {
	mov	DWORD PTR -8[rbp], 1	 # i,
 # sum.c:5:     for (int i = 1; i <= 100; i++) {
	jmp	.L2	 #
.L3:
 # sum.c:6:         sum += i;
	mov	eax, DWORD PTR -8[rbp]	 # tmp100, i
	add	DWORD PTR -4[rbp], eax	 # sum, tmp100
 # sum.c:5:     for (int i = 1; i <= 100; i++) {
	add	DWORD PTR -8[rbp], 1	 # i,
.L2:
 # sum.c:5:     for (int i = 1; i <= 100; i++) {
	cmp	DWORD PTR -8[rbp], 100	 # i,
	jle	.L3	 #,
 # sum.c:8:     printf("%d\n", sum);
	mov	edx, DWORD PTR -4[rbp]	 # tmp101, sum
	lea	rax, .LC0[rip]	 # tmp102,
	mov	rcx, rax	 #, tmp102
	call	printf	 #
 # sum.c:10:     return 0;
	mov	eax, 0	 # _7,
 # sum.c:11: }
	add	rsp, 48	 #,
	pop	rbp	 #
	ret	
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (x86_64-mcf-seh-rev0, Built by MinGW-Builds project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
