vcom -reportprogress 300 -work work D:/university/term_5/DSD/Project/Shifter/shifter.vhd
vcom -reportprogress 300 -work work D:/university/term_5/DSD/Project/Shifter/shifter_tb.vhd

vsim -novopt -gui work.shifter_tb

do wave.do

run 300 ns