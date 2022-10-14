# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
#vlog "./decoder_3x8.sv"
vlog "./enabled_decoder_5x32.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
#vsim -voptargs="+acc" -t 1ps -lib work decoder_3x8_testbench
vsim -voptargs="+acc" -t 1ps -lib work enabled_decoder_5x32_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
#do decoder_3x8_wave.do
do enabled_decoder_5x32_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
