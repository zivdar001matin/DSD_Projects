onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider inputs
add wave -noupdate /uart_tb/uatt1/start
add wave -noupdate /uart_tb/uatt1/rx
add wave -noupdate /uart_tb/uatt1/data_in
add wave -noupdate /uart_tb/uatt1/baud
add wave -noupdate -divider outputs
add wave -noupdate /uart_tb/uatt1/tx
add wave -noupdate /uart_tb/uatt1/data_ready
add wave -noupdate /uart_tb/uatt1/data_out
add wave -noupdate -divider {inner counters}
add wave -noupdate -divider get
add wave -noupdate /uart_tb/uatt1/line__26/state
add wave -noupdate /uart_tb/uatt1/line__26/next_state
add wave -noupdate /uart_tb/uatt1/line__26/baud_counter
add wave -noupdate /uart_tb/uatt1/line__26/bit_counter
add wave -noupdate /uart_tb/uatt1/line__26/parity
add wave -noupdate -divider send
add wave -noupdate /uart_tb/uatt1/line__26/state_s
add wave -noupdate /uart_tb/uatt1/line__26/next_state_s
add wave -noupdate /uart_tb/uatt1/line__26/baud_counter_s
add wave -noupdate /uart_tb/uatt1/line__26/bit_counter_s
add wave -noupdate /uart_tb/uatt1/line__26/res_flag
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider inputs
add wave -noupdate /uart_tb/uatt2/start
add wave -noupdate /uart_tb/uatt2/rx
add wave -noupdate /uart_tb/uatt2/data_in
add wave -noupdate /uart_tb/uatt2/baud
add wave -noupdate -divider outputs
add wave -noupdate /uart_tb/uatt2/tx
add wave -noupdate /uart_tb/uatt2/data_ready
add wave -noupdate /uart_tb/uatt2/data_out
add wave -noupdate -divider {inner counters}
add wave -noupdate -divider get
add wave -noupdate /uart_tb/uatt2/line__26/state
add wave -noupdate /uart_tb/uatt2/line__26/next_state
add wave -noupdate /uart_tb/uatt2/line__26/baud_counter
add wave -noupdate /uart_tb/uatt2/line__26/bit_counter
add wave -noupdate /uart_tb/uatt2/line__26/parity
add wave -noupdate -divider send
add wave -noupdate /uart_tb/uatt2/line__26/state_s
add wave -noupdate /uart_tb/uatt2/line__26/next_state_s
add wave -noupdate /uart_tb/uatt2/line__26/baud_counter_s
add wave -noupdate /uart_tb/uatt2/line__26/bit_counter_s
add wave -noupdate /uart_tb/uatt2/line__26/res_flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {55484 ps} 0} {{Cursor 2} {239968 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 235
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
WaveRestoreZoom {0 ps} {451500 ps}
