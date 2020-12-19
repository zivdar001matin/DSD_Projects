vcom -reportprogress 300 -work work {D:/university/term_5/DSD/Project/011 UART/uart.vhd}
vcom -reportprogress 300 -work work {D:/university/term_5/DSD/Project/011 UART/uart_tb.vhd}
vsim -gui work.uart_tb -novopt -t ns

do wave.do 
run 430