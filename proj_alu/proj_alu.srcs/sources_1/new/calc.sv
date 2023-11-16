`timescale 1ns / 1ps
`include "riscv_alu_constants.sv"
/***************************************************************************
* 
* File: calc.sv
*
* Author: Ryan Chiang
* Class: ECEN 323, Winter Semester 2023
* Date: 01/17/2023
*
* Module: calc
*
* Description:
*    This .sv file uses the alu module and oneshot module and some logic 
*    to implement a calculator with leds indicating the accumulating result.
*
****************************************************************************/


module calc(clk, btnc, btnl, btnu, btnr, btnd, sw, led);

    // 1-bit inputs for global clock and 5 buttons
    input wire logic clk, btnc, btnu, btnd, btnl, btnr;
	// 16-bit data input port named "sw" for the 16 switches on the Basys3 board
	input wire logic [15:0] sw;
	// 16-bit accumulator output port named "led" for the 16 leds on the Basys3 board
	output logic [15:0] led;
	
	// constant 1-bit 0
	localparam[3:0] ZERO = 0;
	
	// reset signal
	logic rst;
	// synchronized version of btnd
	logic btnd_d, btnd_dd;
	// The update counter output from the one shot module
	logic update_count;
	
	// Assign the 'rst' signal to btnu
	assign rst = btnu;
	
	
	// btnd synchronizer
	always_ff@(posedge clk) begin
        if (rst) begin
			btnd_d <= 0;
			btnd_dd <= 0;
        end
        else begin
			btnd_d <= btnd;
			btnd_dd <= btnd_d;
        end
    end
   

    // 1-bit zero for alu
    logic calc_zero;
    // 32-bit signal that is a sign extended version of the 16-bit accumulator
	logic [31:0] calc_op1;
	// 32-bit signal that is a sign extend version of the 16-bit switch inputs
	logic [31:0] calc_op2;
	// 32-bit signal of the calculation result
	logic [31:0] calc_result;
	// 4-bit signal for alu operation
	logic [3:0] calc_alu_op;  
    // 16-bit input to the accumulator
    logic [15:0] accumulator_input;  

    // 16-bit register (called the accumulator) 
    // to hold the contents of the current value of the calculator. 
    always_ff@(posedge clk) begin
        if (rst)
            accumulator_input <= ZERO;
        else if (update_count)
            accumulator_input <= calc_result[15:0];
    end
    assign led = accumulator_input;
    assign calc_op1 = {{16{accumulator_input[15]}},accumulator_input};
    assign calc_op2 = {{16{sw[15]}},sw};
	
	
    // 3-bit logic for opeartion types
    logic [2:0] op;
    assign op = {btnl,{btnc,btnr}};
    
    // constants of various operations based on buttons
    localparam[2:0] OP_ADD = 3'b000;
    localparam[2:0] OP_SUB = 3'b001;
    localparam[2:0] OP_AND = 3'b010;
    localparam[2:0] OP_OR = 3'b011;
    localparam[2:0] OP_XOR = 3'b100;
    localparam[2:0] OP_LT = 3'b101;
    localparam[2:0] OP_SLL = 3'b110;
    localparam[2:0] OP_SRA = 3'b111;
	
	// combination logic that converts the three bit value specified by 
	// the three buttons to the corresponding four-bit alu_op value for the ALU
	always_comb begin 
	   case(op)
	       OP_ADD: calc_alu_op = ALUOP_ADDITION;
	       OP_SUB: calc_alu_op = ALUOP_SUBTRACTION;
	       OP_AND: calc_alu_op = ALUOP_AND;
	       OP_OR: calc_alu_op = ALUOP_OR;
	       OP_XOR: calc_alu_op = ALUOP_XOR;
	       OP_LT: calc_alu_op = ALUOP_LESS_THAN; 
	       OP_SLL: calc_alu_op = ALUOP_SLL;
	       OP_SRA: calc_alu_op = ALUOP_SRA;
	   endcase
	end  
	
    // Instance the OneShot module for btnd
	OneShot os_d (.clk(clk), .rst(rst), .in(btnd_dd), .os(update_count));
            
    // Instance alu module
	alu calc_alu (.op1(calc_op1), .op2(calc_op2), .alu_op(calc_alu_op),
		.result(calc_result), .zero(calc_zero));
    
endmodule
