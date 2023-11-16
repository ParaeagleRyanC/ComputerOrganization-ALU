##########################################################################
#
# calc_sim.tcl
# Author: Ryan Chiang
# Class: ECEN 323
# Date: 01/17/2023
#
# Description: 
#   This .tcl script will perform a simulation according to the table in 
#   the spec of Lab 2.
#
##########################################################################

# restart the simulation at time 0
restart

# Run circuit with no input stimulus settings
run 20 ns

# Set the clock to oscillate with a period of 10 ns
add_force clk {0} {1 5} -repeat_every 10

# Run the circuit for two clock cycles
run 20 ns

# Issue a global reset (btnu) 
add_force btnu 1
run 10 ns

# Set reset (btnu) back to 0
add_force btnu 0
run 10 ns

# Set btnl, btnc, btnr to 0,0,0 and Switches (sw) to 0x0000 for 20 ns
add_force btnl 0
add_force btnc 0
add_force btnr 0
add_force sw 0000 -radix hex
run 20 ns

# Set btnd (update button) to 1 for 10 ns
add_force btnd 1
run 10 ns

# Set btnd (update button) to 0 for 10 ns
add_force btnd 0
run 10 ns

# Set btnl, btnc, btnr to 0,1,1 and Switches (sw) to 0x1234 for 20 ns
add_force btnl 0
add_force btnc 1
add_force btnr 1
add_force sw 1234 -radix hex
run 20 ns

# Set btnd (update button) to 1 for 10 ns
add_force btnd 1
run 10 ns

# Set btnd (update button) to 0 for 10 ns
add_force btnd 0
run 10 ns

# Set btnl, btnc, btnr to 0,1,0 and Switches (sw) to 0x0ff0 for 20 ns
add_force btnl 0
add_force btnc 1
add_force btnr 0
add_force sw 0ff0 -radix hex
run 20 ns

# Set btnd (update button) to 1 for 10 ns
add_force btnd 1
run 10 ns

# Set btnd (update button) to 0 for 10 ns
add_force btnd 0
run 10 ns

# Set btnl, btnc, btnr to 0,0,0 and Switches (sw) to 0x324f for 20 ns
add_force btnl 0
add_force btnc 0
add_force btnr 0
add_force sw 324f -radix hex
run 20 ns

# Set btnd (update button) to 1 for 10 ns
add_force btnd 1
run 10 ns

# Set btnd (update button) to 0 for 10 ns
add_force btnd 0
run 10 ns

# Set btnl, btnc, btnr to 0,0,1 and Switches (sw) to 0x2d31 for 20 ns
add_force btnl 0
add_force btnc 0
add_force btnr 1
add_force sw 2d31 -radix hex
run 20 ns

# Set btnd (update button) to 1 for 10 ns
add_force btnd 1
run 10 ns

# Set btnd (update button) to 0 for 10 ns
add_force btnd 0
run 10 ns

# Set btnl, btnc, btnr to 1,0,0 and Switches (sw) to 0xffff for 20 ns
add_force btnl 1
add_force btnc 0
add_force btnr 0
add_force sw ffff -radix hex
run 20 ns

# Set btnd (update button) to 1 for 10 ns
add_force btnd 1
run 10 ns

# Set btnd (update button) to 0 for 10 ns
add_force btnd 0
run 10 ns

# Set btnl, btnc, btnr to 1,0,1 and Switches (sw) to 0x7346 for 20 ns
add_force btnl 1
add_force btnc 0
add_force btnr 1
add_force sw 7346 -radix hex
run 20 ns

# Set btnd (update button) to 1 for 10 ns
add_force btnd 1
run 10 ns

# Set btnd (update button) to 0 for 10 ns
add_force btnd 0
run 10 ns

# Set btnl, btnc, btnr to 1,0,1 and Switches (sw) to 0xffff for 20 ns
add_force btnl 1
add_force btnc 0
add_force btnr 1
add_force sw ffff -radix hex
run 20 ns

# Set btnd (update button) to 1 for 10 ns
add_force btnd 1
run 10 ns

# Set btnd (update button) to 0 for 10 ns
add_force btnd 0
run 10 ns


# Run the circuit for 20 ns
run 20 ns

