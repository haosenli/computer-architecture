# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./B_cond_decode.sv"
vlog "./sign_extender.sv"
vlog "./adder.sv"
vlog "./mux_2x1.sv"
vlog "./mux_4x1.sv"
vlog "./alu.sv"
vlog "./adder_more.sv"
vlog "./mux64_2x1.sv"
vlog "./math.sv"
vlog "./data_ex.sv"
vlog "./adder64.sv"
vlog "./adder64.sv"
vlog "./enabled_decoder_5x32.sv"
vlog "./decoder_3x8.sv"
vlog "./mux_8x1.sv"
vlog "./mux_16x1.sv"
vlog "./mux_32x1.sv"
vlog "./d_ff.sv"
vlog "./d_ff_en.sv"
vlog "./multiplexor.sv"
vlog "./register.sv"
vlog "./regfile.sv"
vlog "./data_id.sv"
vlog "./data_if.sv"
vlog "./data_mem.sv"
vlog "./data_wb.sv"
vlog "./datamem.sv"
vlog "./instructmem.sv"
vlog "./instruction_decoder.sv"
vlog "./mux5_2x1.sv"


# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work data_if_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do data_if_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
