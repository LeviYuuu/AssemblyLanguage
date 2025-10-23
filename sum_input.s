	.file	"sum_input.c"
	.intel_syntax noprefix
 # GNU C23 (x86_64-mcf-seh-rev0, Built by MinGW-Builds project) version 15.2.0 (x86_64-w64-mingw32)
 #	compiled by GNU C version 15.2.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.27-GMP

 # GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 # options passed: -masm=intel -mtune=core2 -march=nocona
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Input (1-100): \0"
.LC1:
	.ascii "%d\0"
.LC2:
	.ascii "Output: %d\12\0"
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
 # sum_input.c:3: int main() {
	call	__main	 #
 # sum_input.c:4:     int sum = 0;
	mov	DWORD PTR -4[rbp], 0	 # sum,
 # sum_input.c:5:     int n = 0;
	mov	DWORD PTR -12[rbp], 0	 # n,
 # sum_input.c:6:     printf("Input (1-100): ");
	lea	rax, .LC0[rip]	 # tmp101,
	mov	rcx, rax	 #, tmp101
	call	printf	 #
 # sum_input.c:7:     scanf("%d", &n);
	lea	rax, -12[rbp]	 # tmp102,
	lea	rcx, .LC1[rip]	 # tmp103,
	mov	rdx, rax	 #, tmp102
	call	scanf	 #
 # sum_input.c:8:     for (int i = 1; i <= n; i++) {
	mov	DWORD PTR -8[rbp], 1	 # i,
 # sum_input.c:8:     for (int i = 1; i <= n; i++) {
	jmp	.L2	 #
.L3:
 # sum_input.c:9:         sum += i;
	mov	eax, DWORD PTR -8[rbp]	 # tmp104, i
	add	DWORD PTR -4[rbp], eax	 # sum, tmp104
 # sum_input.c:8:     for (int i = 1; i <= n; i++) {
	add	DWORD PTR -8[rbp], 1	 # i,
.L2:
 # sum_input.c:8:     for (int i = 1; i <= n; i++) {
	mov	eax, DWORD PTR -12[rbp]	 # n.0_1, n
	cmp	DWORD PTR -8[rbp], eax	 # i, n.0_1
	jle	.L3	 #,
 # sum_input.c:11:     printf("Output: %d\n", sum);
	mov	edx, DWORD PTR -4[rbp]	 # tmp105, sum
	lea	rax, .LC2[rip]	 # tmp106,
	mov	rcx, rax	 #, tmp106
	call	printf	 #
 # sum_input.c:13:     return 0;
	mov	eax, 0	 # _11,
 # sum_input.c:14: }
	add	rsp, 48	 #,
	pop	rbp	 #
	ret	
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (x86_64-mcf-seh-rev0, Built by MinGW-Builds project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
