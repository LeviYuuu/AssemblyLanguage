100数字和的c语言代码：
```
#include <stdio.h>

int main() {
    int sum = 0;
    for (int i = 1; i <= 100; i++) {
        sum += i;
    }
    printf("%d\n", sum);

    return 0;
}
```
对应的反汇编内容：
```
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "%d\12\0"		; 字符串常量: "%d\n" (12是换行符的ASCII码)
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	; === 函数序言 ===
	push	rbp	           ; 保存旧的基址指针
	mov	rbp, rsp	       ; 设置新的栈帧
	sub	rsp, 48	           ; 分配48字节栈空间
	.seh_stackalloc	48
	.seh_endprologue
	
	; === 程序初始化 ===
	call	__main	       ; GCC运行时初始化
	
	; === 变量初始化 ===
	mov	DWORD PTR -4[rbp], 0	 ; sum = 0 (sum存储在[rbp-4])
	mov	DWORD PTR -8[rbp], 1	 ; i = 1 (i存储在[rbp-8])
	jmp	.L2	             ; 跳转到循环条件检查
	
.L3:
	; === 循环体: sum += i ===
	mov	eax, DWORD PTR -8[rbp]	 ; 将i的值加载到eax
	add	DWORD PTR -4[rbp], eax	 ; sum = sum + i
	
	; === 循环增量: i++ ===
	add	DWORD PTR -8[rbp], 1	 ; i = i + 1
	
.L2:
	; === 循环条件检查: i <= 100 ===
	cmp	DWORD PTR -8[rbp], 100	 ; 比较i和100
	jle	.L3	             ; 如果i <= 100，继续循环
	
	; === 打印结果 ===
	mov	edx, DWORD PTR -4[rbp]	 ; 将sum作为第二个参数传入edx
	lea	rax, .LC0[rip]	         ; 加载格式字符串"%d\n"的地址到rax
	mov	rcx, rax	         ; 将格式字符串作为第一个参数传入rcx
	call	printf	             ; 调用printf函数
	
	; === 函数返回 ===
	mov	eax, 0	         ; 设置返回值0
	add	rsp, 48	         ; 释放栈空间
	pop	rbp	             ; 恢复旧的基址指针
	ret	                 ; 返回调用者
```
用户输入的c语言代码：
```
#include <stdio.h>

int main() {
    int sum = 0;
    int n = 0;
    printf("Input (1-100): ");
    scanf("%d", &n);
    for (int i = 1; i <= n; i++) {
        sum += i;
    }
    printf("Output: %d\n", sum);

    return 0;
}
```
对应的关键反汇编代码注释：
```
.file	"sum_input.c"
	.intel_syntax noprefix
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Input (1-100): \0"      # 输入提示字符串
.LC1:
	.ascii "%d\0"                   # scanf 格式字符串
.LC2:
	.ascii "Output: %d\12\0"        # 输出格式字符串，\12是换行符
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp	                   # 保存旧的基址指针
	.seh_pushreg	rbp
	mov	rbp, rsp	               # 设置新的栈帧基址
	.seh_setframe	rbp, 0
	sub	rsp, 48	                   # 在栈上分配48字节空间
	.seh_stackalloc	48
	.seh_endprologue
	call	__main	                 # 调用运行时初始化
	
	# sum_input.c:4: int sum = 0;
	mov	DWORD PTR -4[rbp], 0	     # 局部变量sum初始化为0，位置[rbp-4]
	
	# sum_input.c:5: int n = 0;
	mov	DWORD PTR -12[rbp], 0	     # 局部变量n初始化为0，位置[rbp-12]
	
	# sum_input.c:6: printf("Input (1-100): ");
	lea	rax, .LC0[rip]	           # 加载输入提示字符串地址
	mov	rcx, rax	                 # Windows x64调用约定，第一个参数放在rcx
	call	printf	                   # 调用printf函数
	
	# sum_input.c:7: scanf("%d", &n);
	lea	rax, -12[rbp]	             # 获取变量n的地址 [rbp-12]
	lea	rcx, .LC1[rip]	           # 加载"%d"格式字符串地址
	mov	rdx, rax	                 # 第二个参数：n的地址
	call	scanf	                   # 调用scanf读取输入
	
	# sum_input.c:8: for (int i = 1; i <= n; i++) {
	mov	DWORD PTR -8[rbp], 1	     # 循环变量i初始化为1，位置[rbp-8]
	jmp	.L2	                       # 跳转到循环条件判断
	
.L3:
	# sum_input.c:9: sum += i;
	mov	eax, DWORD PTR -8[rbp]	   # 将i的值加载到eax
	add	DWORD PTR -4[rbp], eax	   # sum = sum + i
	
	# sum_input.c:8: for (int i = 1; i <= n; i++) {
	add	DWORD PTR -8[rbp], 1	     # i = i + 1
	
.L2:
	# sum_input.c:8: for (int i = 1; i <= n; i++) {
	mov	eax, DWORD PTR -12[rbp]	   # 将n的值加载到eax
	cmp	DWORD PTR -8[rbp], eax	   # 比较 i 和 n
	jle	.L3	                       # 如果 i <= n，跳转回循环体
	
	# sum_input.c:11: printf("Output: %d\n", sum);
	mov	edx, DWORD PTR -4[rbp]	   # 第二个参数：sum的值
	lea	rax, .LC2[rip]	           # 第一个参数：输出格式字符串地址
	mov	rcx, rax	                 # Windows x64调用约定
	call	printf	                   # 调用printf输出结果
	
	# sum_input.c:13: return 0;
	mov	eax, 0	                   # 返回值0
	
	# sum_input.c:14: }
	add	rsp, 48	                   # 释放栈空间
	pop	rbp	                       # 恢复旧的基址指针
	ret	                           # 函数返回
	.seh_endproc
```