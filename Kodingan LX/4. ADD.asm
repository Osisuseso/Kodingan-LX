global main
    extern printf, fflush, scanf
     
    section .data
        pfmt db "%d", 10, 0
        sfmt db "%d %d", 0
 
    section .bss
        a resd 4
        b resd 4
     
    section .text
 
main:
    push b
    push a
    push sfmt
    call scanf
    add esp, 12
     
    mov eax, [a]
    mov ebx, [b]
    add eax, ebx
     
    push eax
    push pfmt
    call printf
    add esp, 8
     
    push 0
    call fflush
    add esp, 4
     
    mov eax, 1
    mov ebx, 0
    int 0x80
  
