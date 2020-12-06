onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /detector_tb/nrst_t
add wave -noupdate /detector_tb/mclk_t
add wave -noupdate /detector_tb/din_t
add wave -noupdate /detector_tb/u1/next_state
add wave -noupdate /detector_tb/u1/curr_state
add wave -noupdate /detector_tb/z_t
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70 ns} 0} {{Cursor 2} {85 ns} 0}
quietly wave cursor active 2
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {210 ns}
