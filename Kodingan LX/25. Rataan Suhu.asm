
global main
extern scanf, printf
  
section .data
    fmt_in      db      "%lf", 0
    fmt_awalan  db      "%d", 0
    fmt_out     db      "%.1lf", 10, 0
  
section .bss
    x               resq    4
    y               resq    4
    sum             resq    4
    mean            resq    4
  
section .text
    main:
                ; scanf("%f", &loopingan)
                push    x
                push    fmt_awalan
                call    scanf                   ; %f --> float
                add     esp, 8
                mov     esi, dword [x]
                fld     qword [sum]
     
    ngulang:
                push    y
                push    fmt_in
                call    scanf
                add     esp, 8
                 
                fadd    qword [y]
                 
                sub     esi, 1
                cmp     esi, 0
                ja      ngulang
                 
                fidiv   dword [x]
                fst     qword [mean] 
  
                ; printf("%f\n", area)
                push    dword [mean+4]
                push    dword [mean]
                push    fmt_out
                call    printf                  ; %f --> double
                add     esp, 12
  
                ; return 0
                mov     eax, 0
                ret
