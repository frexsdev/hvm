;; TODO(#16): hack include directive has no support for include paths
%include "./examples/natives.hack"

%bind N 30

; N-1
; F_1+F_0
; F_1
main:
    push 0      ; F_0
    push 1      ; F_1
    push N      ; N - the amount of iterations
loop:
    swap 2
    dup 0
    native print_i64
    dup 1
    plusi
    swap 1
    swap 2
    push 1
    minusi

    dup 0
    push 0
    eqi
    not

    jmp_if loop
    halt

%entry main