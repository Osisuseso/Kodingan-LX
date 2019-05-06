global main
extern printf
extern scanf
extern fflush
      
section .data
    msg db "%d",0
    print db "%d",10,0  
     
section .bss
    a resd 4
section .text
      
main:
    push a
    push msg
    call scanf
    add esp,8
     
    mov ecx, [a]
    mov ebx, 2
    mov eax, 1
     
L1:
    mul ebx
     
    LOOP L1
     
Print:    
    push eax
    push print
    call printf
    add esp, 4
     
exit:
    push 0
    call fflush
    add esp, 0
        
    mov eax,1
    mov ebx,0
    int 80H
