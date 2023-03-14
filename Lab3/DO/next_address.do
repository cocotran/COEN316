add wave rt
add wave rs
add wave pc
add wave target_address
add wave branch_type
add wave pc_sel
add wave next_pc
add wave branch_out
add wave sign_extended_branch_offset

force pc X"00000000"

force pc_sel 11
run 2

force pc_sel 01
force target_address 00000000000000000000000111
run 2

force pc_sel 10
force rs X"FAFA3B3B"
run 2

force pc_sel 00
force branch_type 00
run 2


force target_address 00000000000000000111111111

force branch_type 01
force rs X"00000001"
force rt X"00000001"
run 2

force branch_type 01
force rs X"00000001"
force rt X"00000002"
run 2


force branch_type 10
force rs X"00000001"
force rt X"00000002"
run 2

force branch_type 10
force rs X"00000001"
force rt X"00000001"
run 2


force branch_type 11
force rs X"11111111"
run 2

force branch_type 11
force rs X"00001111"
run 2





















