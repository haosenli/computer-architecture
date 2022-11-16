onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /instruction_decoder_testbench/clk
add wave -noupdate /instruction_decoder_testbench/instruction
add wave -noupdate /instruction_decoder_testbench/Rm
add wave -noupdate /instruction_decoder_testbench/Rt
add wave -noupdate /instruction_decoder_testbench/Rd
add wave -noupdate /instruction_decoder_testbench/Rn
add wave -noupdate /instruction_decoder_testbench/shamt
add wave -noupdate /instruction_decoder_testbench/DT_addr
add wave -noupdate /instruction_decoder_testbench/ALU_imm
add wave -noupdate /instruction_decoder_testbench/COND_BR_addr
add wave -noupdate /instruction_decoder_testbench/BR_addr
add wave -noupdate /instruction_decoder_testbench/ALUop
add wave -noupdate /instruction_decoder_testbench/Reg2Loc
add wave -noupdate /instruction_decoder_testbench/ALUSrc
add wave -noupdate /instruction_decoder_testbench/MemtoReg
add wave -noupdate /instruction_decoder_testbench/RegWrite
add wave -noupdate /instruction_decoder_testbench/MemWrite
add wave -noupdate /instruction_decoder_testbench/BrTaken
add wave -noupdate /instruction_decoder_testbench/UnCondBr
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
