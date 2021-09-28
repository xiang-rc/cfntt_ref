`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/06 20:27:57
// Design Name: 
// Module Name: DFFbit
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


module DFFbit(
    input clk,
    input rst,
    input d,
    output reg q
    );
    
    always@(posedge clk or posedge rst)
    begin
      if(rst)
        q <= 0;
      else
        q <= d;
    end
    
endmodule
