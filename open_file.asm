SYS_EXIT: equ 1
SYS_READ: equ 3
SYS_WRITE: equ 4
SYS_OPEN: equ 5


section .data
    filename db './open_file.asm'
    filename_len equ $-filename

section .bss
    num resb 65536

section .text
    global _start

_start:
    mov eax, SYS_OPEN
    mov ebx, filename
    mov ecx, 0
    mov edx, 1
    int 80h

    mov ebx, eax
    mov eax, SYS_READ
    mov ecx, num
    mov edx, 65536
    int 80h

    mov eax, SYS_WRITE
    mov ebx, 1
    mov ecx, num
    mov edx, 65536
    int 80h

    mov eax, SYS_EXIT
    xor ebx, 0
    int 80h
