#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

/*
 * 模拟 INT 4（溢出中断）中断服务程序
 */
void INT4_ISR()
{
    printf("\n*** Overflow Error (INT 4 triggered) ***\n");
    printf("Signed arithmetic overflow detected.\n");
}

/*
 * 使用内联汇编进行加法运算
 */
int add_with_into(int a, int b)
{
    int result = 0;
    int overflow_flag = 0;

#ifdef _M_IX86   // 仅在 x86 下启用内联汇编
    __asm {
        mov eax, a
        add eax, b          // 执行加法，CPU 自动设置 OF
        mov result, eax

        pushfd              // 读取 EFLAGS
        pop eax
        and eax, 0800h      // OF = bit 11
        jz no_overflow
        mov overflow_flag, 1
    no_overflow:
    }
#else
    result = a + b;
#endif

    if (overflow_flag) {
        printf("Overflow detected, simulating INT 4...\n");
        fflush(stdout);
        INT4_ISR();
    }

    return result;
}

int main()
{
    printf("INTO / INT 4 Simulation Demo\n");
    printf("============================\n");

    // 测试 1：无溢出
    printf("Test 1: 1000 + 2000 = ");
    printf("%d (OK)\n", add_with_into(1000, 2000));

    // 测试 2：有符号溢出
    printf("Test 2: 2000000000 + 2000000000 = ");
    add_with_into(2000000000, 2000000000);

    printf("\nProgram terminated after INT 4 handling.\n");
    printf("Press any key to exit...\n");
    _getch();

    return 0;
}
