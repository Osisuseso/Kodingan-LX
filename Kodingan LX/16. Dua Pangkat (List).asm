global main
extern printf
extern scanf
extern fflush
    
segment .data
    scan db '%d',0
    print db '%d',10,0
        
segment .bss
    a resd 4
        
segment .text
    
main:
    push a
    push scan
    call scanf
    add esp,8
    
cek:
    mov edx,[a]
    CMP edx,0
    JE exit
       
    mov eax,1
    mov ebx,2
    mov edi,[a]
    
pangkatdua:
    mul ebx
    sub edi,1
    CMP edi,0
    JA pangkatdua
        
    push eax
    push print
    call printf
    add esp,8
        
    push 0
    call fflush
    add esp,4
        
    push a
    push scan
    call scanf
    add esp,8
    JMP cek
        
exit:
    mov eax,1
    mov ebx,0
    int 80H
