------------------------------------
-- compile sr.vhd and sr_tb.vhd --
------------------------------------
vcom -reportprogress 300 -work work D:/university/term_5/DSD/Project/SRAM/sr.vhd

----------------------
-- start simulation --
----------------------
vsim -gui work.sr_tb -t ns

-----------------------------
-- add waves to simulation --
-----------------------------
add wave -position insertpoint  \
sim:/alu_tb/t_A \
sim:/alu_tb/t_B \
sim:/alu_tb/t_cin \
sim:/alu_tb/t_sin \
sim:/alu_tb/t_funct \
sim:/alu_tb/t_sout \
sim:/alu_tb/t_cout \
sim:/alu_tb/t_Ov \
sim:/alu_tb/t_Z

run 320ns