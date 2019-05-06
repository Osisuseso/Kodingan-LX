global main
extern printf
extern scanf
extern fflush
   
section .data
    msg db '%d %d %d %d',0
    print db '%d',10,0
    ME db 'E',10,0
    MD db 'D',10,0
    MC db 'C',10,0
    MB db 'B',10,0
    MA db 'A',10,0
     
   
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
    mov ecx, 40
    cmp eax,ecx
    JAE D
    JB E
     
E:
    push ME
    call printf
    add esp,4
    JMP exit
     
D:
    mov ecx, 50
    cmp eax,ecx
    JAE C
    push MD
    call printf
    add esp,4
    JMP exit
     
C:
    mov ecx, 60
    cmp eax,ecx
    JAE B
    push MC
    call printf
    add esp,4
    JMP exit
     
B:
    mov ecx, 80
    cmp eax,ecx
    JAE A
    push MB
    call printf
    add esp,4
    JMP exit
 
A:
    push MA
    call printf
    add esp,4
    JMP exit
       
exit:
    push 0
    call fflush
    add esp, 0
     
    mov eax,1
    mov ebx,0
    int 80H
