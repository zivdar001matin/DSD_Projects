vcom -reportprogress 300 -work work {D:/university/term_5/DSD/Project/012 Rotate/basic_utils.vhd}
vcom -reportprogress 300 -work work {D:/university/term_5/DSD/Project/012 Rotate/myrotate.vhd}
vcom -reportprogress 300 -work work {D:/university/term_5/DSD/Project/012 Rotate/myrotate_tb.vhd}

vsim -gui work.myrotate_tb

do mywave.do

run -all