segment .data
    msg db 'Hello x86', 10
    len equ $ - msg
segment .text
    global main
main:
        mov eax, 4
        mov ebx, 1
        mov ecx, msg
        mov edx, len
        int 0x80
        
