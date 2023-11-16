##########################################################################
#
# aluop_sim.tcl
# Author: Ryan Chiang
# Class: ECEN 323
# Date: 01/17/2023
#
# Description: 
#   This .tcl script will apply the various operation on two operands 
#   to the circuit defined in alu.sv
#
##########################################################################

# restart the simulation at time 0
restart

# Run circuit with no input stimulus settings
run 20 ns

## No clock required for this simulation ##
# Set the clock to oscillate with a period of 10 ns
# add_force clk {0} {1 5} -repeat_every 10

# Run the circuit for two clock cycles
# run 20 ns

# set operand 1 (op1)= 32'hf3212f37 for 10 ns
add_force op1 f3212f37 -radix hex
run 10 ns

# set operand 2 (op2)= 32'h621c3ee7 for 10 ns
add_force op2 621c3ee7 -radix hex
run 10 ns

# Run the circuit for 20 ns
run 20 ns

# set operation (alu_op) = 4'b0000 for 20 ns
add_force alu_op 0000
run 20 ns

# set operation (alu_op) = 4'b0001 for 20 ns
add_force alu_op 0001
run 20 ns

# set operation (alu_op) = 4'b0010 for 20 ns
add_force alu_op 0010
run 20 ns

# set operation (alu_op) = 4'b0011 for 20 ns
add_force alu_op 0011
run 20 ns

# set operation (alu_op) = 4'b0110 for 20 ns
add_force alu_op 0110
run 20 ns

# set operation (alu_op) = 4'b0111 for 20 ns
add_force alu_op 0111
run 20 ns

# set operation (alu_op) = 4'b1000 for 20 ns
add_force alu_op 1000
run 20 ns

# set operation (alu_op) = 4'b1001 for 20 ns
add_force alu_op 1001
run 20 ns

# set operation (alu_op) = 4'b1010 for 20 ns
add_force alu_op 1010
run 20 ns

# set operation (alu_op) = 4'b1101 for 20 ns
add_force alu_op 1101
run 20 ns

# Run the circuit for 20 ns
run 20 ns

