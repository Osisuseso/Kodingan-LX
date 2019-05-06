global main
extern printf
extern scanf
extern fflush
       
section .data
    array dd 7, 11, 10, 6
          dd 5, 8, 9, 2
          dd 1, 3, 12, 4
    msg db "%d %d",0
    print db "%d",10,0  
      
section .bss
    baris resd 4
    kolom resd 4
section .text
       
main:
    push kolom
    push baris
    push msg
    call scanf
    add esp,12
     
    mov eax, [kolom]
    mov ebx, 4
    mul ebx
    mov ecx, eax
     
    mov eax, [baris]
    mov ebx, 16
    mul ebx
    add ecx, eax
      
Print:
    mov eax, [array+ecx]
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
