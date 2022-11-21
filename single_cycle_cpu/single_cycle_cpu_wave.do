onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /single_cycle_cpu_testbench/clk
add wave -noupdate -radix unsigned /single_cycle_cpu_testbench/dut/pc
add wave -noupdate -radix unsigned /single_cycle_cpu_testbench/dut/id_module/regfile_module/data
add wave -noupdate -radix unsigned /single_cycle_cpu_testbench/dut/mem_module/datamem_module/mem
add wave -noupdate -radix unsigned /single_cycle_cpu_testbench/dut/alu_result
add wave -noupdate -expand -group Flags /single_cycle_cpu_testbench/dut/zero
add wave -noupdate -expand -group Flags /single_cycle_cpu_testbench/dut/negative
add wave -noupdate -expand -group Flags /single_cycle_cpu_testbench/dut/carry_out
add wave -noupdate -expand -group Flags /single_cycle_cpu_testbench/dut/overflow
add wave -noupdate -expand -group Flags /single_cycle_cpu_testbench/dut/branch
add wave -noupdate /single_cycle_cpu_testbench/dut/ALUop
add wave -noupdate -expand -group Branch /single_cycle_cpu_testbench/dut/BrTaken
add wave -noupdate -expand -group Branch -radix unsigned /single_cycle_cpu_testbench/dut/BR_to_shift
add wave -noupdate -expand -group Branch -radix unsigned /single_cycle_cpu_testbench/dut/new_pc2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2713 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 190
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
WaveRestoreZoom {0 ps} {13156 ps}
