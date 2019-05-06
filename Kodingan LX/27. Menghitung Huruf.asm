extern scanf
extern printf
extern fflush
  
section .data
    scanfmt db "%s %s", 0
    print db "%d", 10, 0
      
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
     
    mov ecx, 40
    mov ebx, 0
 
    mov edi, string1
    mov al, [char]
looooop:
    repne scasb
     
    add ebx, 1
    cmp ecx,0
    ja looooop
     
    sub ebx,1
     
printtt:
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
