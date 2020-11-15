vcom -reportprogress 300 -work work D:/university/term_5/DSD/Project/Multiplier/adder.vhd
vcom -reportprogress 300 -work work D:/university/term_5/DSD/Project/Multiplier/multiplier.vhd
vcom -reportprogress 300 -work work D:/university/term_5/DSD/Project/Multiplier/multiplier_tb.vhd

vsim -gui work.mult_tb

add wave -position insertpoint  \
sim:/mult_tb/t_a \
sim:/mult_tb/t_b \
sim:/mult_tb/t_s \
sim:/mult_tb/t_cout

run 50ns