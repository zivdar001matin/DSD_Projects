onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /myrotate_tb/inp_header_t
add wave -noupdate /myrotate_tb/inp_pixels_t
add wave -noupdate /myrotate_tb/degree_t
add wave -noupdate /myrotate_tb/out_header_t
add wave -noupdate /myrotate_tb/out_pixels_t
add wave -noupdate /myrotate_tb/u1/inp_header
add wave -noupdate /myrotate_tb/u1/inp_pixels
add wave -noupdate /myrotate_tb/u1/degree
add wave -noupdate /myrotate_tb/u1/out_header
add wave -noupdate /myrotate_tb/u1/out_pixels
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7027 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 205
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
WaveRestoreZoom {0 ps} {21 ns}
