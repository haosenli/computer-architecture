onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /alu_testbench/A
add wave -noupdate -radix binary /alu_testbench/B
add wave -noupdate /alu_testbench/cntrl
add wave -noupdate -radix binary /alu_testbench/result
add wave -noupdate /alu_testbench/zero
add wave -noupdate /alu_testbench/overflow
add wave -noupdate /alu_testbench/negative
add wave -noupdate /alu_testbench/carry_out
add wave -noupdate -radix decimal /alu_testbench/dut/B_sub
add wave -noupdate -radix decimal /alu_testbench/dut/B_in
add wave -noupdate /alu_testbench/dut/sub
add wave -noupdate /alu_testbench/dut/Cout_sel
add wave -noupdate /alu_testbench/dut/not_cntrl_2
add wave -noupdate /alu_testbench/dut/and_cntrl_21
add wave -noupdate /alu_testbench/dut/a2/sum
add wave -noupdate /alu_testbench/dut/a2/Cin
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8901 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 392
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
WaveRestoreZoom {3314 ps} {10352 ps}
