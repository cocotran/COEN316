add wave rt_in
add wave rs_in
add wave pc_in
add wave target_address_in
add wave branch_type
add wave pc_sel
add wave next_pc_out
add wave branch_out
add wave sign_extended_branch_offset

force pc_in 000

force pc_sel 11
run 2

force pc_sel 01
force target_address_in 111
run 2

force pc_sel 10
force rs_in 01
run 2

force pc_sel 00
force branch_type 00
run 2


force target_address_in 010

force branch_type 01
force rs_in 00
force rt_in 00
run 2

force branch_type 01
force rs_in 00
force rt_in 11
run 2


force branch_type 10
force rs_in 11
force rt_in 01
run 2

force branch_type 10
force rs_in 10
force rt_in 10
run 2


force branch_type 11
force rs_in 11
run 2

force branch_type 11
force rs_in 00
run 2





















