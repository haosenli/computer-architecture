onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /data_mem_testbench/zero
add wave -noupdate -radix unsigned /data_mem_testbench/branch
add wave -noupdate -radix unsigned /data_mem_testbench/cbz
add wave -noupdate -radix unsigned /data_mem_testbench/clk
add wave -noupdate -radix unsigned /data_mem_testbench/MemWrite
add wave -noupdate -radix unsigned /data_mem_testbench/MemtoReg_in
add wave -noupdate -radix unsigned /data_mem_testbench/alu_result
add wave -noupdate -radix unsigned /data_mem_testbench/write_data
add wave -noupdate -radix unsigned /data_mem_testbench/new_pc2_ex
add wave -noupdate -radix unsigned /data_mem_testbench/BrTaken
add wave -noupdate -radix unsigned /data_mem_testbench/MemtoReg_out
add wave -noupdate -radix unsigned /data_mem_testbench/dm_address
add wave -noupdate -radix unsigned /data_mem_testbench/dm_read_data
add wave -noupdate -radix unsigned /data_mem_testbench/new_pc2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {1 ns}
