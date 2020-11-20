onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /adder_tb/n
add wave -noupdate -radix hexadecimal /adder_tb/a_t
add wave -noupdate -radix hexadecimal /adder_tb/b_t
add wave -noupdate /adder_tb/cin_t
add wave -noupdate -radix hexadecimal /adder_tb/sum_t
add wave -noupdate /adder_tb/cout_t
add wave -noupdate /adder_tb/u1/line__17/c
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12270 ps} 0}
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
WaveRestoreZoom {0 ps} {31500 ps}
