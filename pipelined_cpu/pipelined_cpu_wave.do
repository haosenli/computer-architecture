onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pipelined_cpu_testbench/clk
add wave -noupdate /pipelined_cpu_testbench/reset
add wave -noupdate /pipelined_cpu_testbench/dut/id_module/regfile_module/data
add wave -noupdate /pipelined_cpu_testbench/dut/if_module/pc
add wave -noupdate /pipelined_cpu_testbench/dut/if_module/new_pc
add wave -noupdate /pipelined_cpu_testbench/dut/if_module/new_pc1
add wave -noupdate /pipelined_cpu_testbench/dut/if_module/new_pc2
add wave -noupdate /pipelined_cpu_testbench/dut/if_module/new_pc3
add wave -noupdate /pipelined_cpu_testbench/dut/if_module/instruction
add wave -noupdate /pipelined_cpu_testbench/dut/mem_module/datamem_module/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 146
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {29205 ps}
