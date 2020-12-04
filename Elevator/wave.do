onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /elevator_tb/nreset_t
add wave -noupdate /elevator_tb/clk_t
add wave -noupdate /elevator_tb/switch_t
add wave -noupdate /elevator_tb/go_t
add wave -noupdate /elevator_tb/come_t
add wave -noupdate /elevator_tb/motor_up_t
add wave -noupdate /elevator_tb/motor_down_t
add wave -noupdate /elevator_tb/current_floor_t
add wave -noupdate /elevator_tb/move_state_t
add wave -noupdate /elevator_tb/CUT/curr_state
add wave -noupdate /elevator_tb/CUT/next_state
add wave -noupdate /elevator_tb/CUT/to_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {53 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 186
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
WaveRestoreZoom {0 ns} {250 ns}
