onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pipelined_cpu_testbench/clk
add wave -noupdate /pipelined_cpu_testbench/reset
add wave -noupdate -radix unsigned /pipelined_cpu_testbench/dut/if_module/pc
add wave -noupdate -radix unsigned /pipelined_cpu_testbench/dut/if_module/new_pc
add wave -noupdate -radix unsigned /pipelined_cpu_testbench/dut/if_module/new_pc1
add wave -noupdate -radix unsigned /pipelined_cpu_testbench/dut/if_module/new_pc2
add wave -noupdate -radix unsigned /pipelined_cpu_testbench/dut/if_module/new_pc3
add wave -noupdate -radix decimal -childformat {{{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[31]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[30]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[29]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[28]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[27]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[26]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[25]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[24]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[23]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[22]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[21]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[20]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[19]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[18]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[17]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[16]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[15]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[14]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[13]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[12]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[11]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[10]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[9]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[8]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[7]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[6]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[5]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[4]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[3]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[2]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[1]} -radix decimal} {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[0]} -radix decimal}} -subitemconfig {{/pipelined_cpu_testbench/dut/id_module/regfile_module/data[31]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[30]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[29]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[28]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[27]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[26]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[25]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[24]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[23]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[22]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[21]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[20]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[19]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[18]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[17]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[16]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[15]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[14]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[13]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[12]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[11]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[10]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[9]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[8]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[7]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[6]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[5]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[4]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[3]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[2]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[1]} {-height 15 -radix decimal} {/pipelined_cpu_testbench/dut/id_module/regfile_module/data[0]} {-height 15 -radix decimal}} /pipelined_cpu_testbench/dut/id_module/regfile_module/data
add wave -noupdate -radix binary /pipelined_cpu_testbench/dut/if_module/instruction
add wave -noupdate -radix decimal -childformat {{{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[14]} -radix decimal} {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[13]} -radix decimal} {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[12]} -radix decimal} {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[11]} -radix decimal} {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[10]} -radix decimal} {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[9]} -radix decimal} {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[8]} -radix decimal} {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[7]} -radix decimal} {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[6]} -radix decimal} {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[5]} -radix decimal} {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[4]} -radix decimal} {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[3]} -radix decimal} {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[2]} -radix decimal} {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[1]} -radix decimal} {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[0]} -radix decimal}} -subitemconfig {{/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[14]} {-radix decimal} {/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[13]} {-radix decimal} {/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[12]} {-radix decimal} {/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[11]} {-radix decimal} {/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[10]} {-radix decimal} {/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[9]} {-radix decimal} {/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[8]} {-radix decimal} {/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[7]} {-radix decimal} {/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[6]} {-radix decimal} {/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[5]} {-radix decimal} {/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[4]} {-radix decimal} {/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[3]} {-radix decimal} {/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[2]} {-radix decimal} {/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[1]} {-radix decimal} {/pipelined_cpu_testbench/dut/mem_module/datamem_module/mem[0]} {-radix decimal}} /pipelined_cpu_testbench/dut/mem_module/datamem_module/mem
add wave -noupdate -group Flags /pipelined_cpu_testbench/dut/ex_module/zero
add wave -noupdate -group Flags /pipelined_cpu_testbench/dut/ex_module/negative
add wave -noupdate -group Flags /pipelined_cpu_testbench/dut/ex_module/overflow
add wave -noupdate -group Flags /pipelined_cpu_testbench/dut/ex_module/carry_out
add wave -noupdate -group {ID signals} /pipelined_cpu_testbench/dut/id_module/Reg2Loc
add wave -noupdate -group {ID signals} /pipelined_cpu_testbench/dut/id_module/RegWrite
add wave -noupdate -group {ID signals} -radix unsigned /pipelined_cpu_testbench/dut/id_module/Rm
add wave -noupdate -group {ID signals} -radix unsigned /pipelined_cpu_testbench/dut/id_module/Rn
add wave -noupdate -group {ID signals} -radix unsigned /pipelined_cpu_testbench/dut/id_module/Rd_id
add wave -noupdate -group {ID signals} -radix unsigned /pipelined_cpu_testbench/dut/id_module/Rd_wb
add wave -noupdate -group {ID signals} -radix unsigned /pipelined_cpu_testbench/dut/id_module/Ab
add wave -noupdate -group {ID signals} -radix decimal /pipelined_cpu_testbench/dut/id_module/Da
add wave -noupdate -group {ID signals} -radix decimal /pipelined_cpu_testbench/dut/id_module/Db
add wave -noupdate -group {ID signals} -radix decimal /pipelined_cpu_testbench/dut/id_module/Dw
add wave -noupdate -group {ID signals} -radix decimal /pipelined_cpu_testbench/dut/id_module/WBsignal
add wave -noupdate -group {ID signals} /pipelined_cpu_testbench/dut/id_module/BLsignal
add wave -noupdate -group {EX signals} -radix decimal /pipelined_cpu_testbench/dut/ex_module/Da
add wave -noupdate -group {EX signals} -radix decimal /pipelined_cpu_testbench/dut/ex_module/Db
add wave -noupdate -group {EX signals} -radix decimal /pipelined_cpu_testbench/dut/ex_module/add2
add wave -noupdate -group {EX signals} -radix decimal /pipelined_cpu_testbench/dut/alu_result_ex
add wave -noupdate -group {EX signals} /pipelined_cpu_testbench/dut/forwardA
add wave -noupdate -group {EX signals} /pipelined_cpu_testbench/dut/forwardB
add wave -noupdate -group {EX signals} -radix decimal /pipelined_cpu_testbench/dut/alu_result_mem
add wave -noupdate -group {EX signals} -radix decimal /pipelined_cpu_testbench/dut/alu_result_wb1
add wave -noupdate -group Branch /pipelined_cpu_testbench/dut/id_module/BrTaken
add wave -noupdate -group Branch /pipelined_cpu_testbench/dut/id_module/branch
add wave -noupdate -group Branch /pipelined_cpu_testbench/dut/id_module/cbz
add wave -noupdate -group Branch /pipelined_cpu_testbench/dut/id_module/UnCondBr
add wave -noupdate -group Branch -radix decimal /pipelined_cpu_testbench/dut/id_module/COND_BR_addr64
add wave -noupdate -group Branch -radix decimal /pipelined_cpu_testbench/dut/id_module/BR_addr64
add wave -noupdate -group Branch -radix decimal /pipelined_cpu_testbench/dut/id_module/BR_to_shift
add wave -noupdate -group Branch -radix decimal /pipelined_cpu_testbench/dut/id_module/BR_PC
add wave -noupdate -group Branch -radix decimal /pipelined_cpu_testbench/dut/id_module/PC
add wave -noupdate -group Branch -radix decimal /pipelined_cpu_testbench/dut/id_module/new_PC2
add wave -noupdate -expand -group {MEM signals} /pipelined_cpu_testbench/dut/mem_module/MemWrite
add wave -noupdate -expand -group {MEM signals} /pipelined_cpu_testbench/dut/mem_module/MemtoReg
add wave -noupdate -expand -group {MEM signals} -radix decimal /pipelined_cpu_testbench/dut/mem_module/write_data
add wave -noupdate -expand -group {MEM signals} -radix decimal /pipelined_cpu_testbench/dut/mem_module/dm_read_data
add wave -noupdate -expand -group {MEM signals} -radix decimal /pipelined_cpu_testbench/dut/mem_module/alu_result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {120200 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 146
configure wave -valuecolwidth 194
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
WaveRestoreZoom {0 ps} {330750 ps}
