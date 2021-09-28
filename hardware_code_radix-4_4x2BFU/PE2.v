`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 19:15:35
// Design Name: 
// Module Name: compact_bf
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


module PE2 #(parameter data_width = 14)(
    input clk,rst,
    input [data_width-1:0] u,v,w1,w2,
    input sel,
    output [data_width-1:0] bf_upper,bf_lower
    //bf_lower为大的数，赋给小的索引
    //bf_upper为小的数，赋给大的索引
    );
    
    wire [data_width-1:0] u_q1;
    wire [data_width-1:0] w1_q1,w1_q7,w2_q1,w2_q7;
    wire [data_width-1:0] mux_out1,mux_out2,mux_out3,mux_out4;
    wire [data_width-1:0] mux_out5,mux_out6,mux_out7,mux_out8;
    wire [data_width-1:0] v_q1;
    wire [data_width-1:0] mult_out1,mult_out2,add_out,sub_out;
    wire [data_width-1:0] add_out_q1,sub_out_q1;
    wire [data_width-1:0] sub_op1,sub_op2;
    wire [data_width-1:0] half_out1,half_out2;
    
    DFF dff_u(.clk(clk),.rst(rst),.d(u),.q(u_q1));
    assign mux_out1 = sel == 1'b0 ? u_q1 : add_out_q1;
    
    DFF dff_w1(.clk(clk),.rst(rst),.d(w1),.q(w1_q1));
    shift_7 #(.data_width(14)) shf_w1 (.clk(clk),.rst(rst),.din(w1_q1),.dout(w1_q7));
    assign mux_out2 = sel == 1'b0 ? w1_q1 : w1_q7;
    
    modular_mul mult1_pe2(.clk(clk),.rst(rst),.A_in(mux_out1),.B_in(mux_out2),.P_out(mult_out1));
    assign mux_out3 = sel == 1'b0 ? mult_out1 : u_q1;
    assign mux_out4 = sel == 1'b0 ? mult_out2 : v_q1;
    modular_add #(.data_width(14)) add(
               .x_add(mux_out3),
               .y_add(mux_out4),
               .z_add(add_out));
    DFF dff_add(.clk(clk),.rst(rst),.d(add_out),.q(add_out_q1));
    
    modular_half #(.data_width(14)) half1 (.x_half(mult_out1),.y_half(half_out1));
    assign bf_lower = sel == 1'b0 ? add_out_q1 : half_out1;
    
    //mux about signal v
    DFF dff_v(.clk(clk),.rst(rst),.d(v),.q(v_q1));
    assign mux_out5 = sel == 1'b0 ? v_q1 : sub_out_q1;
    
    DFF dff_w2(.clk(clk),.rst(rst),.d(w2),.q(w2_q1));
    shift_7 #(.data_width(14)) shf_w2 (.clk(clk),.rst(rst),.din(w2_q1),.dout(w2_q7));
    assign mux_out6 = sel == 1'b0 ? w2_q1 : w2_q7;   
    modular_mul mult2_pe2(.clk(clk),.rst(rst),.A_in(mux_out5),.B_in(mux_out6),.P_out(mult_out2));
    assign mux_out7 = sel == 1'b0 ? mult_out2 : v_q1;
    assign mux_out8 = sel == 1'b0 ? mult_out1 : u_q1;

    assign sub_op1 = sel == 1'b0 ? mux_out8 : mux_out7;
    assign sub_op2 = sel == 1'b0 ? mux_out7 : mux_out8;
    modular_substraction #(.data_width(14)) sub(.x_sub(sub_op1),.y_sub(sub_op2),.z_sub(sub_out)); 
    DFF dff_sub(.clk(clk),.rst(rst),.d(sub_out),.q(sub_out_q1));   
    modular_half #(.data_width(14)) half2 (.x_half(mult_out2),.y_half(half_out2));
    assign bf_upper = sel == 1'b0 ? sub_out_q1 : half_out2; 
endmodule
