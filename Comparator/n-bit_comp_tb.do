----------------------
-- compile comp.vhd --
----------------------
vcom -reportprogress 300 -work work D:/university/term_5/DSD/Project/Comparator/comp.vhd
vcom -reportprogress 300 -work work D:/university/term_5/DSD/Project/Comparator/n-bit_comp.vhd
vcom -reportprogress 300 -work work D:/university/term_5/DSD/Project/Comparator/n-bit_comp_tb.vhd

----------------------
-- start simulation --
----------------------
vsim -gui work.compn_tb -t 1ns

-----------------------------
-- add waves to simulation --
-----------------------------
add wave -radix Hexadecimal\
-position insertpoint  \
sim:/compn_tb/a_t \
sim:/compn_tb/b_t \
sim:/compn_tb/go_t \
sim:/compn_tb/eo_t \
sim:/compn_tb/lo_t


run 45ns