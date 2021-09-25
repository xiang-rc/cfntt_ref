`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 16:23:45
// Design Name: 
// Module Name: tb_top
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


module tb_top;
  reg clk,rst;
  reg [2:0] conf;
  wire [2:0] done_flag;
  parameter data_width = 14;
  
  top_poly_mul poly_mul(
      .clk(clk),.rst(rst),
      .conf(conf),
      .done_flag(done_flag)
      );
      
  initial
  begin
    clk=1'b0;
    forever #5 clk=~clk;
  end
  
  task ntt_oper;
    output [3:0] conf;
    input [2:0] done_flag;
    begin
      if(done_flag == 1) 
        conf = 4;
      else
        conf = conf;
    end
  endtask
  
  initial 
  begin
    conf = 1;
    rst = 1;
    # 7 rst = 0;
    # 2 conf = 1;
  end
  
  always@(*)
      ntt_oper(conf,done_flag);
   
  initial
  begin 
     $readmemb("D:/Xilinx_project/scalable_ntt/radix2_ntt_1d/bank0.txt",tb_top.poly_mul.bank_0.bank);
     $readmemb("D:/Xilinx_project/scalable_ntt/radix2_ntt_1d/bank1.txt",tb_top.poly_mul.bank_1.bank);
  end
   
 endmodule
