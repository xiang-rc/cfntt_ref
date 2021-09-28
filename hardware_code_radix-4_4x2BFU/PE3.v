`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/06 19:45:50
// Design Name: 
// Module Name: PE3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PE3 #(parameter data_width = 14)(
        input clk,rst,
        input [data_width-1:0] u,v,
        input sel,
        output [data_width-1:0] bf_upper,bf_lower
        );
       
    parameter const_w = 10810;
    
    wire [data_width-1:0] u_q1,u_q5;
    wire [data_width-1:0] mux_out1,mux_out2,mux_out3;
    wire [data_width-1:0] mux_out5;
    wire [data_width-1:0] v_q1;
    wire [data_width-1:0] mult_out,add_out,sub_out;
    wire [data_width-1:0] add_out_q1,sub_out_q1,add_out_q5;
    wire [data_width-1:0] sub_op1,sub_op2;
    wire [data_width-1:0] half_out1,half_out2;
    
    //mux about signal u 
    DFF dff_u(.clk(clk),.rst(rst),.d(u),.q(u_q1));
    shift_4 #(.data_width(14)) shf_u (.clk(clk),.rst(rst),.din(u_q1),.dout(u_q5));
    assign mux_out1 = sel == 1'b0 ? u_q5 : u_q1;
    
    //mux about signal v
    DFF dff_v(.clk(clk),.rst(rst),.d(v),.q(v_q1));
    assign mux_out3 = sel == 1'b0 ? v_q1 : sub_out_q1;
    modular_mul mult_pe3(.clk(clk),.rst(rst),.A_in(mux_out3),.B_in(const_w),.P_out(mult_out));
    assign mux_out2 = sel == 1'b0 ? mult_out : v_q1;
    
    //mux about sub
    assign mux_out5 = sel == 1'b0 ? mult_out : v_q1;
    assign sub_op1 = sel == 1'b0 ? mux_out1 : mux_out5;
    assign sub_op2 = sel == 1'b0 ? mux_out5 : mux_out1;
    modular_substraction #(.data_width(14)) sub(.x_sub(sub_op1),.y_sub(sub_op2),.z_sub(sub_out)); 
    DFF dff_sub(.clk(clk),.rst(rst),.d(sub_out),.q(sub_out_q1));   

    modular_add #(.data_width(14)) add(
               .x_add(mux_out1),
               .y_add(mux_out2),
               .z_add(add_out));
    
    DFF dff_add(.clk(clk),.rst(rst),.d(add_out),.q(add_out_q1));
    shift_4 #(.data_width(14)) shf_add (.clk(clk),.rst(rst),.din(add_out_q1),.dout(add_out_q5));
    modular_half #(.data_width(14)) half1 (.x_half(add_out_q5),.y_half(half_out1));
    modular_half #(.data_width(14)) half2 (.x_half(mult_out),.y_half(half_out2));
    assign bf_lower = sel == 0? add_out_q1 : half_out1;
    assign bf_upper = sel == 0? sub_out_q1 : half_out2;                 
endmodule
