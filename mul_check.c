#include <stdio.h>

int multiplication_table[9][9] = {
    {7, 2, 3, 4, 5, 6, 7, 8, 9},      // 第1行
    {2, 4, 7, 8, 10, 12, 14, 16, 18}, // 第2行  
    {3, 6, 9, 12, 15, 18, 21, 24, 27},// 第3行
    {4, 8, 12, 16, 7, 24, 28, 32, 36},// 第4行
    {5, 10, 15, 20, 25, 30, 35, 40, 45},// 第5行
    {6, 12, 18, 24, 30, 7, 42, 48, 54},// 第6行
    {7, 14, 21, 28, 35, 42, 49, 56, 63},// 第7行
    {8, 16, 24, 32, 40, 48, 56, 7, 72}, // 第8行
    {9, 18, 27, 36, 45, 54, 63, 72, 81} // 第9行
};

// 检查乘法表正确性的函数
void check_multiplication_table() {
    int error_count = 0;
    
    printf("x y\n"); // 输出表头
    
    // 双循环遍历整个乘法表
    for (int i = 0; i < 9; i++) {        // 外层循环：行
        for (int j = 0; j < 9; j++) {    // 内层循环：列
            int expected = (i + 1) * (j + 1); // 正确的结果应该是 (行号)×(列号)
            int actual = multiplication_table[i][j]; // 实际存储的值
            
            // 检查是否正确
            if (expected != actual) {
                error_count++;
                printf("%d %d error\n", i + 1, j + 1); // 输出错误位置（从1开始计数）
            }
        }
    }
    
    printf("\nTotal errors: %d\n", error_count);
}

int main() {;
    
    check_multiplication_table();
    
    return 0;
}