global main
extern printf
extern scanf
extern fflush
  
section .data
    msg db '%d %d %d %d',0
    print db '%d',10,0
  
section .bss
    a resd 4
    b resd 4
    c resd 4
    d resd 4
section .text
  
main:
    push a
    push b
    push c
    push d
    push msg
    call scanf
    add esp,20
    mov eax,[a]
    mov ebx,[b]
    mov ecx,[c]
    mov edx,[d]
     
    add eax,ebx
    add eax,ecx
    add eax,edx
    mov ebx,4
    mov edx,0
    div ebx
    push eax
    push print
    call printf
    add esp,8
     
    push 0
    call fflush
    add esp,0
     
      
      
exit:
    mov eax,1
    mov ebx,0
    int 80H
