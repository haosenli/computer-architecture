onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {64-bit Inputs} /data_ex_testbench/ReadData1
add wave -noupdate -expand -group {64-bit Inputs} /data_ex_testbench/ReadData2
add wave -noupdate -expand -group {64-bit Inputs} /data_ex_testbench/PC
add wave -noupdate -expand -group {64-bit Inputs} /data_ex_testbench/BR_to_shift
add wave -noupdate -expand -group {64-bit Inputs} /data_ex_testbench/ALU_imm_extend
add wave -noupdate -expand -group {Input Control Signals} /data_ex_testbench/ALUop
add wave -noupdate -expand -group {Input Control Signals} /data_ex_testbench/ALUsrc
add wave -noupdate -expand -group {Input Control Signals} /data_ex_testbench/update
add wave -noupdate -expand -group {64-bit Outputs} /data_ex_testbench/ALU_result
add wave -noupdate -expand -group {64-bit Outputs} /data_ex_testbench/ReadData2_out
add wave -noupdate -expand -group {64-bit Outputs} /data_ex_testbench/new_PC2
add wave -noupdate -expand -group Flags /data_ex_testbench/zero
add wave -noupdate -expand -group Flags /data_ex_testbench/overflow
add wave -noupdate -expand -group Flags /data_ex_testbench/negative
add wave -noupdate -expand -group Flags /data_ex_testbench/carry_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10761 ps} 0}
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
WaveRestoreZoom {0 ps} {21 ns}
