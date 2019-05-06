global main
extern printf
extern scanf
extern fflush
       
section .data
    array dd 7, 11, 10, 6
          dd 5, 8, 9, 2
          dd 1, 3, 12, 4
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
     
    mov eax, 16
    mul dword[a]
    mov ebx, 0
    mov ecx, 4
 
looping:
    add edx,[array+eax+(ebx*4)]
    add ebx,1
    LOOP looping
     
    mov eax, edx
      
Print:
    push eax
    push print
    call printf
    add esp, 8
      
exit:
    push 0
    call fflush
    add esp, 0
         
    mov eax,1
    mov ebx,0
    int 80H
