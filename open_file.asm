; This assembly code uses system interrupts to open, read and display the file from the "filename" variable

; Set interrupt names
SYS_EXIT: equ 1
SYS_READ: equ 3
SYS_WRITE: equ 4
SYS_OPEN: equ 5

section .data
    filename db './open_file.asm'
    filename_len equ $-filename

; Reserve 65536 bytes for file contents 
section .bss
    num resb 65536

section .text
    global _start

_start:
    ; Open the file
    mov eax, SYS_OPEN ; Move the interrupt number to eax
    mov ebx, filename ; Move the filename pointer to ebx
    mov ecx, 0
    mov edx, 1
    int 80h ; Call the interrupt

    ; Read the file, move all contents to "num"
    mov ebx, eax ; Move the returned "eax" register from "SYS_OPEN" to ebx for "SYS_READ" 
    mov eax, SYS_READ ; Move the interrupt number to eax
    mov ecx, num ; Move the file contents array pointer to "ecx"
    mov edx, 65536 ; Max. file content size
    int 80h ; Call the interrupt

    ; Output file contents to console
    mov eax, SYS_WRITE ; Move the interrupt number to eax
    mov ebx, 1 ; Move 1 which means "stdout"
    mov ecx, num ; Move the file contents array pointer to "ecx", again
    mov edx, 65536 ; Max. file content size
    int 80h ; Call the interrupt

    ; Exit from the program
    mov eax, SYS_EXIT ; Move the interrupt number to eax
    mov ebx, 0 ; Set return number to "0" (success) 
    int 80h ; Call the interrupt
