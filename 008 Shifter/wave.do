onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /shifter_tb/clk_t
add wave -noupdate /shifter_tb/nrst_t
add wave -noupdate /shifter_tb/sham_t
add wave -noupdate /shifter_tb/shty_t
add wave -noupdate /shifter_tb/dir_t
add wave -noupdate /shifter_tb/sin_t
add wave -noupdate -radix hexadecimal /shifter_tb/din_t
add wave -noupdate /shifter_tb/sout_t
add wave -noupdate -radix hexadecimal /shifter_tb/dout_t
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {225310 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {315 ns}
