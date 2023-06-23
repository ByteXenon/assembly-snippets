; This code demonstrates an example of assembly code that prints a message to the standard output and then exits.
; It uses software interrupts (syscalls) to perform I/O operations.
; For more information on interrupt functions, you can visit:
; - https://faculty.nps.edu/cseagle/assembly/sys_call.html
; - https://www.tutorialspoint.com/assembly_programming/assembly_system_calls.htm

; Define a section named ".data" to store initialized data
section .data
    msg: db "Hello, world!", 10, 0   ; Define a null-terminated string with a newline character
    msg_len equ $ - msg              ; Calculate the length of the message

; Define a section named ".text" to store executable instructions
section .text
    global _start                    ; Declare _start as a global symbol

; The entry point of the program
_start:
    ; Call the "write" interrupt to print the message
    mov eax, 4       ; System call number for "write"
    mov ebx, 1       ; File descriptor for standard output (stdout)
    mov ecx, msg     ; Pointer to the message to be printed
    mov edx, msg_len ; Length of the message
    int 0x80         ; Trigger the software interrupt to perform the system call

    ; Call the "exit" interrupt to terminate the program
    mov eax, 1       ; System call number for "exit"
    mov ebx, 0       ; Set the exit status to 0 (success)
    int 0x80         ; Trigger the software interrupt to perform the system call