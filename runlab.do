# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.


vlog "./adder30.sv"
vlog "./addsub1.sv"
vlog "./regfile.sv"
vlog "./ALU1.sv"
vlog "./ALU32.sv"
vlog "./control.sv"
vlog "./CPU.sv"
vlog "./IFU.sv"
vlog "./D_FF.sv"
vlog "./dataMem.sv"
vlog "./mux2.sv"
vlog "./control.sv"
vlog "./D_FF.sv"
vlog "./mux2x5.sv"
vlog "./mux2x32.sv"
vlog "./mux2x30.sv"
vlog "./decoder2_4.sv"
vlog "./decoder3_8.sv"
vlog "./decoder5_32.sv"
vlog "./register_1bit.sv"
vlog "./register_32bit.sv"
vlog "./register_32_32bit.sv"
vlog "./mux2_1.sv"
vlog "./mux4_1.sv"
vlog "./mux8_1.sv"
vlog "./mux32_1.sv"
vlog "./mux32x32_32.sv"
vlog "./InstructionMem.sv"
vlog "./mux4_multIn.sv"
vlog "./PC.sv"
vlog "./SignExtend30.sv"
vlog "./SignExtend32.sv"
vlog "./zero.sv"
vlog "./DFF32.sv"
vlog "./DFF16.sv"
vlog "./DFF5.sv"
vlog "./DFF2.sv"
vlog "./comparator6.sv"
vlog "./comparator32.sv"
vlog "./fwdTest.sv"
vlog "./forwarding.sv"


# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work cpu_tb

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do cpu_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
