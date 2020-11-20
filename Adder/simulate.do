vcom -reportprogress 300 -work work D:/university/term_5/DSD/Project/Adder/adder.vhd
vcom -reportprogress 300 -work work D:/university/term_5/DSD/Project/Adder/adder_tb.vhd

-----------------------------------------------------------
-- We use -novopt to ModelSim doesn't optimize the code. --
-----------------------------------------------------------
vsim -novopt -gui work.adder_tb

do wave.do

run 30 ns