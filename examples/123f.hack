%include "./examples/natives.hack"

main:
    push 1.0
    push 2.0
    push 3.0
    plusf
    plusf
    native print_f64
    halt

%entry main