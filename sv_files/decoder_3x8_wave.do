onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /decoder_3x8_testbench/A
add wave -noupdate /decoder_3x8_testbench/B
add wave -noupdate /decoder_3x8_testbench/C
add wave -noupdate /decoder_3x8_testbench/enable
add wave -noupdate /decoder_3x8_testbench/decode
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {461 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1785 ps}
