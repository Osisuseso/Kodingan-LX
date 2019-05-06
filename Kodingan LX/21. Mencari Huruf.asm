
extern scanf
extern printf
extern fflush
 
section .data
    scanfmt db "%s %s", 0
    printyes db "%d", 10, 0
    printno db "tidak ada", 10, 0
     
section .bss
    string1 resb 51
    char resb 2
     
section .text
    global main
 
main:
    cld
    push char
    push string1
    push scanfmt
    call scanf
    add esp, 12
    mov ecx, 50
    mov ebx, 50
     
    mov edi, string1
    mov al, [char]
    repne scasb
     
    sub ebx, ecx
     
    cmp ecx, 0
    je gagal
     
     
berhasil
    push ebx
    push printyes
    call printf
    add esp, 8
    jmp exit
     
gagal:
    push printno
    call printf
    add esp, 4
 
exit:
    push 0
    call fflush
    add esp, 4
         
    mov eax,1
    mov ebx,0
    int 80H
