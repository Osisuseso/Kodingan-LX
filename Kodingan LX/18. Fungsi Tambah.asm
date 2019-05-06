global main
extern scanf, printf, fflush
 
section .data
    fmt_out     db      '%d', 10, 0
    fmt_in      db      '%d %d', 0
 
section .bss
    a resd 4
    b resd 4
     
section .text
 
global main
 
pow:
    push    ebp                     ; save old ebp
    mov     ebp, esp                ; this new ebp (as reference to parameter and local variable)          
    mov     eax, [ebp+8]          ; eax = a
    add     eax, [ebp+12]      ; eax = eax + a
                 
    push    eax                     ; printf("%d\n", eax)
    push    fmt_out
    call    printf
    add     esp, 8
                 
                 
    mov     esp, ebp                ; deallocate local variables
    pop     ebp                     ; restore old ebp
    ret
 
main:
    push    a
    push    b
    push    fmt_in                 
    call    scanf
    add     esp, 12
                 
    push    dword[a]
    push    dword[b]
    call    pow                   
    add     esp, 4
     
exit:
    push 0
    call fflush
    add esp, 4
          
    mov eax,1
    mov ebx,0
    int 80H
