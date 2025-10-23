.MODEL SMALL             ; 指定程序使用的小内存模型
.STACK 100h              ; 为堆栈分配256字节的空间

.DATA
    SumResult DB ?       ; 保存求和结果的变量
    OutputResult DB ?    ; 保存输出结果的变量

.CODE
START:
    MOV AX, @DATA        ; 将数据段的起始地址加载到AX寄存器
    MOV DS, AX           ; 设置数据段寄存器DS指向数据段
    MOV CX, 100          ; 初始化循环计数器CX为100
    MOV AX, 0            ; 初始化AX为0，准备累加

SumLoop:
    ADD AX, CX           ; 将CX中的值加到AX中
    LOOP SumLoop         ; 循环直到CX为0，每次减1并跳转到SumLoop
    MOV SumResult, AL    ; 将累加结果（AL）保存到SumResult变量中
    PUSH AX              ; 将AX压入堆栈，备用
    MOV CX, 10           ; 将CX初始化为10，用于输出时的除法
    MOV BX, 10000        ; 初始化BX为10000，作为输出处理的除数

PrintLoop:
    XOR DX, DX           ; 清空DX寄存器
    MOV AX, BX           ; 将BX的值加载到AX中，用于除法操作
    DIV CX               ; AX / CX，将商存储在AX，余数存储在DX
    CMP AX, 0            ; 比较商是否为0
    JL ExitProgram       ; 如果AX小于0，退出程序
    JE ExitProgram       ; 如果商为0，结束输出循环
    MOV BX, AX           ; 将商存入BX，继续循环处理下一个数字
    XOR DX, DX           ; 清空DX寄存器，准备下一次除法操作
    POP AX               ; 从堆栈中恢复AX的值
    DIV BX               ; AX / BX，计算余数
    PUSH DX              ; 将余数（个位数）压入堆栈，备用
    ADD AL, 30H          ; 将AL转换为对应的ASCII码数字
    MOV DL, AL           ; 将AL中的值移动到DL，用于输出
    MOV AH, 2            ; 设置DOS功能调用号为2，准备显示字符
    INT 21H              ; 调用DOS中断，输出字符
    JMP PrintLoop        ; 跳转回PrintLoop继续输出下一个数字

ExitProgram:
    MOV AH, 4CH          ; 设置DOS功能调用号为4CH，退出程序
    INT 21H              ; 调用DOS中断，结束程序

END START                ; 程序结束，定义入口为START