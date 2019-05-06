global main
extern printf
extern scanf
extern fflush
      
section .data
    msg db '%d %d %d',0
    print db '%d',10,0  
    xt db '3',10,0
    xf db '1',10,0
section .bss
    a resd 4
    b resd 4
    c resd 4
section .text
      
main:
    push c
    push b
    push a
    push msg
    call scanf
    add esp,16
    mov eax,[a]
    mov ebx,[b]
        
    cmp eax, ebx
    JG b_c
    JMP false
       
b_c:
    mov ecx,[c]
    cmp eax,ecx
    JG true
    JMP false
       
true:
    push xt
    call printf
    add esp,4
    JMP exit
   
false:
    push xf
    call printf
    add esp,4
          
exit:
    push 0
    call fflush
    add esp, 0
        
    mov eax,1
    mov ebx,0
    int 80H
