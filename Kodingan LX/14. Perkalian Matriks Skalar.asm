extern printf
extern fflush
extern scanf
  
section .data
    fmtscan db '%d', 0
    fmtprint db '%d ', 0
    lastprint db '%d', 10, 0
    rowsize dd 4
    sz dd 4
      
        array   dd 7, 11, 10, 6, ;index start from 0
                dd 5, 8, 9, 12,
                dd 11, 13, 12, 15
                  
                ;0, 4, 8, 12
                ;16, 20, 24, 28
            ;32, 36, 40, 44
              
section .bss
    kali resd 4
  
      
section .text
    global main
  
main :
    push kali
    push fmtscan
    call scanf
    add esp, 8
     
    mov edi, 0
     
check :
    cmp edi, 44
    ja exit
     
Operation:
    mov eax,[array+edi]
    mul dword[kali]
     
    cmp edi, 12
    je newline
    cmp edi, 28
    je newline
    cmp edi, 44
    je newline
     
    push eax
    push fmtprint
    call printf
    add esp, 8
      
    push 0
    call fflush
    add esp, 4
     
    add edi, 4
    jmp check
     
 newline :                    
    push eax
    push lastprint
    call printf
    add esp, 8
     
    push 0
    call fflush
    add esp, 4
     
    add edi, 4
    jmp check
     
exit:
    mov eax, 1
    mov ebx, 0
    int 80h
