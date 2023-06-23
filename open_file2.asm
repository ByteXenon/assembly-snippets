SYS_EXIT: equ 1
SYS_READ: equ 3
SYS_WRITE: equ 4
SYS_OPEN: equ 5

%macro my_syscall 4
    mov eax, %1
    mov ebx, %2
    mov ecx, %3
    mov edx, %4
    int 80h
%endmacro

section .data
    filename db './open_file2.asm'
    filename_len equ $-filename

section .bss
    num resb 65536

section .text
    global _start

_start:
    my_syscall SYS_OPEN, filename, 0, 1
    my_syscall eax, SYS_READ, num, 65536
    my_syscall SYS_WRITE, 1, num, 65536
    my_syscall SYS_EXIT, 0, 0, 0