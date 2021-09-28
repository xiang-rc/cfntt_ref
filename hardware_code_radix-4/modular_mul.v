`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/04 10:45:43
// Design Name: 
// Module Name: barret_modular_mul
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


module modular_mul #(parameter data_width = 14)(
    input clk,rst,
    input [data_width-1:0] A_in, B_in,
    output wire [data_width-1:0]  P_out
    );
    
    parameter q0 = 15'h5553;
    parameter q = 14'd12289;
    wire [data_width*2-1:0] z;//28
    wire [data_width:0] z_shift;//28-13=15
    wire [data_width*2-1:0] z_q1;
    wire [data_width*2-1:0] z_q2,z_q3;
    wire [data_width*2:0] mul2;//15+15-1=29
    wire [data_width*2:0] mul2_q;
    wire [data_width-1:0] mul2_shift;
    wire [data_width*2-1:0] mul3;//14+14=28
    wire [data_width*2-1:0] mul3_q;
    wire [data_width*2-1:0] sub;
    wire [data_width:0] sub_low;
    wire sign;
    wire [data_width-1:0] sub_correct;
    wire [data_width-1:0] P_d;
    
    assign z = A_in * B_in;
    DFF #(.data_width(data_width*2)) d1(.clk(clk),.rst(rst),.d(z),.q(z_q1));
    
    assign z_shift = z_q1 >> (data_width - 1);     

    DFF #(.data_width(data_width*2)) d2(.clk(clk),.rst(rst),.d(z_q1),.q(z_q2));        
    DFF #(.data_width(data_width*2)) d3(.clk(clk),.rst(rst),.d(z_q2),.q(z_q3));                                         
    assign mul2 = z_shift * q0;
    DFF #(.data_width(data_width*2+1)) d5(.clk(clk),.rst(rst),.d(mul2),.q(mul2_q));  
   
   assign mul2_shift = mul2_q >> (data_width + 1); 

   assign mul3 = mul2_shift * q;
   DFF #(.data_width(data_width*2)) d6(.clk(clk),.rst(rst),.d(mul3),.q(mul3_q));  
   
   assign sub = z_q3 - mul3_q;
   assign sub_low = sub[data_width:0];
   assign {sign,sub_correct} = sub_low - q;
   assign P_d = sign == 1? sub_low : sub_correct;
   DFF #(.data_width(data_width)) d7(.clk(clk),.rst(rst),.d(P_d),.q(P_out));                                 
endmodule
