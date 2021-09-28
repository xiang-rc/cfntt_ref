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


module PE1 #(parameter data_width = 14)(
    input clk,rst,
    input sel,
    input [data_width-1:0] u,v,
    output [data_width-1:0] bf_upper,bf_lower
    );
    
   wire [data_width-1:0] u_q3;
   wire [data_width-1:0] v_q3;
   wire [data_width-1:0] add_out;
   wire [data_width-1:0] sub_out,sub_op1,sub_op2;
   wire [data_width-1:0] add_out_q3,sub_out_q3;
   wire [data_width-1:0] half_out1,half_out2;
    
   shift_3 #(.data_width(14)) shf_u (.clk(clk),.rst(rst),.din(u),.dout(u_q3));
   shift_3 #(.data_width(14)) shf_v (.clk(clk),.rst(rst),.din(v),.dout(v_q3));
   assign sub_op1 = sel == 1'b0 ? u_q3 : v_q3;
   assign sub_op2 = sel == 1'b0 ? v_q3 : u_q3;
   modular_substraction #(.data_width(14)) sub(.x_sub(sub_op1),.y_sub(sub_op2),.z_sub(sub_out));
   modular_add #(.data_width(14)) add(.x_add(u_q3),.y_add(v_q3),.z_add(add_out));
   shift_3 #(.data_width(14)) shf_add (.clk(clk),.rst(rst),.din(add_out),.dout(add_out_q3));
   shift_3 #(.data_width(14)) shf_sub (.clk(clk),.rst(rst),.din(sub_out),.dout(sub_out_q3));
   
    modular_half #(.data_width(14)) half1 (.x_half(add_out_q3),.y_half(half_out1));
    modular_half #(.data_width(14)) half2 (.x_half(sub_out_q3),.y_half(half_out2));
    assign bf_lower = sel == 0 ? add_out_q3 : half_out1;
    assign bf_upper = sel == 0 ? sub_out_q3 : half_out2;  

endmodule
