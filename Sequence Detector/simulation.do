vcom -reportprogress 300 -work work {D:/university/term_5/DSD/Project/Sequence Detector/detector.vhd}
vcom -reportprogress 300 -work work {D:/university/term_5/DSD/Project/Sequence Detector/detector_tb.vhd}

vsim -gui work.detector_tb -t 1ns

do wave.do

run 200 ns