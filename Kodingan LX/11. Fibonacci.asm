global main
extern printf, fflush, scanf
    
section .data
    pfmt db "%d", 10, 0
    sfmt db "%d", 0
     
segment .bss
    a resd 4
    
section .text
    
main:
    
    push a
    push sfmt
    call scanf
    add esp, 8
    mov ebx, 1      ;inisialisasi fibo(1)
    mov edx, 0      ;inisialisasi fibo(0)
    mov ecx, [a]    ;counter sekalian input
    loop fibo       ;loop sekali dulu soalnya f(0) sama f(1) udah ada, jadi loopnya n-1
          
    fibo:
    mov  eax, 0
    add  eax,ebx    ;eax ditambah ebx f(n-1)
    add  eax,edx    ;eax ditambah edx f(n-2)    
    mov  edx,ebx    ;pindahin edx jadi ebx
    mov  ebx,eax    ;pindahin ebx jadi eax
    loop fibo
          
          
    EXIT:
    push eax
    push pfmt
    call printf
    add esp, 8
        
    push 0
    call fflush
    add esp, 4
    mov eax, 1          ;exit(0)
    mov ebx, 0
    int 0x80
