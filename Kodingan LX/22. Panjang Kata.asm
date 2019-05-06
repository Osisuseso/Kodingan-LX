extern scanf
extern printf
extern fflush
 
section .data
    scanfmt db "%s", 0
    print db "%d", 10, 0
     
section .bss
    string1 resb 22
     
section .text
    global main
 
main:
    cld
    push string1
    push scanfmt
    call scanf
    add esp, 12
    mov ecx, 20
    mov ebx, 19
     
    mov edi, string1
    mov al, ""
    repne scasb
     
    sub ebx, ecx
     
berhasil:
    push ebx
    push print
    call printf
    add esp, 8
    jmp exit
     
exit:
    push 0
    call fflush
    add esp, 4
         
    mov eax,1
    mov ebx,0
    int 80H
