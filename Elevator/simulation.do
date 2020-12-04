vcom -reportprogress 300 -work work D:/university/term_5/DSD/Project/Elevator/elevator.vhd
vcom -reportprogress 300 -work work D:/university/term_5/DSD/Project/Elevator/elevator_tb.vhd

vsim -novopt -gui work.elevator_tb -t ns

do wave.do

run 250 ns