onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /data_if_testbench/clk
add wave -noupdate /data_if_testbench/BrTaken
add wave -noupdate /data_if_testbench/dut/id_module/BRsignal
add wave -noupdate /data_if_testbench/BLsignal
add wave -noupdate -radix unsigned /data_if_testbench/dut/id_module/Rn
add wave -noupdate -radix unsigned /data_if_testbench/dut/id_module/Rd
add wave -noupdate -radix unsigned /data_if_testbench/BR_addr
add wave -noupdate -radix unsigned /data_if_testbench/pc
add wave -noupdate -radix unsigned /data_if_testbench/dut/new_pc
add wave -noupdate -radix unsigned /data_if_testbench/dut/new_pc1
add wave -noupdate -radix unsigned /data_if_testbench/dut/new_pc2
add wave -noupdate -radix unsigned /data_if_testbench/dut/new_pc3
add wave -noupdate /data_if_testbench/instruction
add wave -noupdate -radix unsigned /data_if_testbench/Db
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {477 ps} 0}
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
WaveRestoreZoom {0 ps} {11147 ps}
