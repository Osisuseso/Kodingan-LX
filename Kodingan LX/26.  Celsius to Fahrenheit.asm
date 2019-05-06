global main
extern scanf, printf
 
section .data
    fmt_in      db      "%f", 0
    fmt_out     db      "%.2f", 10, 0
    kali        dd      1.8
    tambah      dd      32.0
 
section .bss
    c           resd    4
    f           resq    4
 
section .text
    main:
                ; scanf("%f %f", &radius, &height)
                push    c
                push    fmt_in
                call    scanf                   ; %f --> float
                add     esp, 8
 
                finit                          
                fld     dword [c]                         
                fmul    dword [kali]         
                fadd    dword [tambah]          
                fstp    qword [f]
                            
                ; printf("%f\n", area)
                push    dword [f+4]
                push    dword [f]
                push    fmt_out
                call    printf                  ; %f --> double
                add     esp, 12
 
                ; return 0
                mov     eax, 0
                ret
