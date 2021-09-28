`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/23 23:58:03
// Design Name: 
// Module Name: DFF
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


module DFF #(parameter data_width = 14)(
    input clk,rst,
    input [data_width-1:0] d,
    output reg [data_width-1:0] q 
    );
    always@(posedge clk or posedge rst)
    begin
      if(rst)
        q <= 0;
      else
        q <= d;
    end
endmodule
