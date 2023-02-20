add wave clk
add wave reset
add wave write
add wave write_address
add wave din
add wave d
add wave read_a
add wave read_b
add wave out_a
add wave out_b
add wave register_array

force reset 1
force clk 1
run 2

force reset 0

force write 1
force write_address 0001
force din 0001
force clk 0
run 2
force clk 1
run 2

force write_address 0010
force din 0010
force clk 0
run 2
force clk 1
run 2

force write 0
force write_address 1000
force din 1111
force clk 0
run 2
force clk 1
run 2

force write 1
force clk 0
run 2
force clk 1
run 2

force read_a 0001
force read_b 0010
run 2

force read_a 1000
force read_b 0100
run 2


force reset 1
run 2

force read_a 0001
force read_b 1000
run 2

