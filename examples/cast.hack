%include "./examples/natives.hack"

push 3.1415
f2i
native print_i64

push 3.1415
f2u
native print_u64

push -1.0
f2i
native print_i64

push -1.0
f2u
native print_u64

push 69
i2f
native print_f64

push -420
i2f
native print_f64

push 69
u2f
native print_f64

halt
