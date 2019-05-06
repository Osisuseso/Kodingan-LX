segment .data
    hellow  db 'Hello '
segment .bss
    inputan resd 4
segment .text
    global main
main:
    ;input 
    mov eax, 3
    mov ebx, 0
    mov ecx, inputan
    mov edx, 4
    int 0x80
     
    ;write hellow
    mov eax, 4
    mov ebx, 1
    mov ecx, hellow
    mov edx, 6
    int 0x80
     
    ;write inputan
    mov eax, 4
    mov ebx, 1
    mov ecx, inputan
    mov edx, 4
    int 0x80
     
    ;exit
    mov eax, 1
    mov ebx, 0
    int 0x80
