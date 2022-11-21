onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /program_counter_testbench/in
add wave -noupdate -radix unsigned /program_counter_testbench/out
add wave -noupdate /program_counter_testbench/clk
add wave -noupdate /program_counter_testbench/reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3409 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 146
configure wave -valuecolwidth 223
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {38205 ps}
