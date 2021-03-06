# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.

vlog "./Data_Path.sv"
vlog "./RegegisterFile.sv"
vlog "./GenericDecoder2.v"
vlog "./RegisterDualOE.v"
vlog "./ALU.sv"
vlog "./Mux_16_Bit_2_to_1.v"
vlog "./Data_Memory.v"
#vlog "./TestTFF.sv"
#vlog "./FourBitAdder.sv"
#vlog "./FullAdder.sv"



# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work Data_Path_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do Data_Path_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
