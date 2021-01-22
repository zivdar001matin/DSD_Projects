vcom -reportprogress 300 -work work {D:/university/term_5/DSD/Project/012 Rotate/basic_utils.vhd}
vcom -reportprogress 300 -work work {D:/university/term_5/DSD/Project/012 Rotate/rotate.vhd}
vcom -reportprogress 300 -work work {D:/university/term_5/DSD/Project/012 Rotate/rotate_tb.vhd}

vsim -gui work.rotate_tb