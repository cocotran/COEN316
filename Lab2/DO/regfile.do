add wave clk
add wave reset
add wave write
add wave write_address
add wave din
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
force write_address 00001
force din X"00000008"
force clk 0
run 2
force clk 1
run 2

force write_address 00010
force din X"00000005"
force clk 0
run 2
force clk 1
run 2

force write 0
force write_address 11011
force din X"FAFA3B3B"
force clk 0
run 2
force clk 1
run 2

force write 1
force clk 0
run 2
force clk 1
run 2

force read_a 00001
force read_b 00010
run 2

force read_a 11011
force read_b 01000
run 2


force reset 1
run 2

force read_a 00001
force read_b 11011
run 2

