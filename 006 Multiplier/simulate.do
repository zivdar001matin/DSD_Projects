----------------------
-- start simulation --
----------------------
vsim -gui work.mult_tb -t 1ns

-----------------------------
-- add waves to simulation --
-----------------------------
add wave -radix Hexadecimal\
-position insertpoint  \
sim:/mult_tb/t_a \
sim:/mult_tb/t_b \
sim:/mult_tb/t_s \
sim:/mult_tb/t_cout

run 500ns