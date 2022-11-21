onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /data_id_testbench/WBsignal
add wave -noupdate /data_id_testbench/BLT
add wave -noupdate /data_id_testbench/pc_if
add wave -noupdate /data_id_testbench/COND_BR_addr
add wave -noupdate /data_id_testbench/BR_addr
add wave -noupdate /data_id_testbench/ALUop
add wave -noupdate /data_id_testbench/Rn
add wave -noupdate /data_id_testbench/Rd
add wave -noupdate /data_id_testbench/Rm
add wave -noupdate /data_id_testbench/Rt
add wave -noupdate /data_id_testbench/ALU_imm
add wave -noupdate /data_id_testbench/DT_addr
add wave -noupdate /data_id_testbench/shamt
add wave -noupdate /data_id_testbench/Da
add wave -noupdate /data_id_testbench/Db
add wave -noupdate /data_id_testbench/BR_to_shift
add wave -noupdate /data_id_testbench/pc_id
add wave -noupdate /data_id_testbench/BRsignal
add wave -noupdate /data_id_testbench/update_flags
add wave -noupdate /data_id_testbench/dut/regfile_module/ReadData1
add wave -noupdate /data_id_testbench/dut/regfile_module/ReadData2
add wave -noupdate /data_id_testbench/dut/regfile_module/WriteData
add wave -noupdate /data_id_testbench/dut/regfile_module/ReadRegister1
add wave -noupdate /data_id_testbench/dut/regfile_module/ReadRegister2
add wave -noupdate /data_id_testbench/dut/regfile_module/WriteRegister
add wave -noupdate /data_id_testbench/dut/regfile_module/RegWrite
add wave -noupdate /data_id_testbench/dut/regfile_module/clk
add wave -noupdate /data_id_testbench/dut/regfile_module/decode
add wave -noupdate /data_id_testbench/dut/regfile_module/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {26 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 146
configure wave -valuecolwidth 400
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
WaveRestoreZoom {0 ps} {525 ps}
