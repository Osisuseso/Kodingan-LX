global main
extern scanf, printf
  
section .data
    fmt_in      db      "%lf %lf", 0
    fmt_out     db      "%lf", 10, 0
  
section .bss
    x               resq    4
    y             resq    4
    euclid        resq    4
  
section .text
    main:
                ; scanf("%f %f", &radius, &height)
                push    x
                push    y
                push    fmt_in
                call    scanf                   ; %f --> float
                add     esp, 12
  
                ; A = sqrt(x^2+y^2)
                finit                           ; ST0           ST1
                fld     qword [x]               ; x
                fmul    st0                     ; x^2
                fld     qword [y]               ; y             x^2
                fmul    st0                     ; y^2           x^2
                faddp                           ; y^2 + x^2
                fsqrt                           ; sqrt(y^2 + x^2)
                fstp    qword [euclid]  
  
                ; printf("%f\n", area)
                push    dword [euclid+4]
                push    dword [euclid]
                push    fmt_out
                call    printf                  ; %f --> double
                add     esp, 12
  
                ; return 0
                mov     eax, 0
                ret
