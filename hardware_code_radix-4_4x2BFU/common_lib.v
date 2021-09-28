`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/08/14 10:54:22
// Design Name: 
// Module Name: common_lib
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

//这种写法只适用于信号变化速度很小(甚至不变)的情况，变化周期要小于延时周期数
/*module shift_reg #(parameter data_width = 1, shift_width = 3, latency = 6)(
    input [data_width-1:0] din,
	input rst,clk,
	output wire [data_width-1:0] dout
	);
	
	reg [shift_width-1:0] d_shift;
	reg [data_width-1:0] dout_tmp;
	
	always@(posedge clk or posedge rst)
	begin
	  if(rst)
	  begin
	    d_shift <= 0;
		dout_tmp <= 0;
	  end
	  else
	  begin
	    if(d_shift == latency - 1)
		begin
	      d_shift <= 0;
		  dout_tmp <= din;
		end
		else
		  d_shift <= d_shift + 1'b1;
      end		
	end
	
	assign dout = dout_tmp;

endmodule*/

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

/*module shift_12 #(parameter data_width = 14)(
    input [data_width-1:0] din,
	input rst,clk,
	output wire [data_width-1:0] dout
	);
	
	reg [data_width-1:0] t0,t1,t2,t3,t4,t5,t6;
	reg [data_width-1:0] t7,t8,t9,t10,t11;
	
	always@(posedge clk or posedge rst)
	begin
	  if(rst) begin
	    t0 <= 0; t1 <= 0; t2 <= 0; t3 <= 0; t4 <= 0;
	    t5 <= 0; t6 <= 0; t7 <= 0; t8 <= 0; t9 <= 0;
	    t10 <= 0; t11 <= 0; end
	  else begin
	    t0 <= din;
	    t1 <= t0; t2 <= t1; t3 <= t2; t4 <= t3;
	    t5 <= t4; t6 <= t5; t7 <= t6; t8 <= t7;
	    t9 <= t8; t10 <= t9; t11 <= t10;
	  end
	end
	
	assign dout = t11;
endmodul*/

module shift_7 #(parameter data_width = 14)(
    input [data_width-1:0] din,
	input rst,clk,
	output wire [data_width-1:0] dout
	);
	
	reg [data_width-1:0] t0,t1,t2,t3,t4,t5,t6;
	
	always@(posedge clk or posedge rst)
	begin
	  if(rst) begin
	    t0 <= 0; t1 <= 0; t2 <= 0; t3 <= 0; t4 <= 0;
	    t5 <= 0; t6 <= 0;
	    end
	  else begin
	    t0 <= din;
	    t1 <= t0; t2 <= t1; t3 <= t2; t4 <= t3;
	    t5 <= t4; t6 <= t5;
	  end
	end
	
	assign dout = t6;
endmodule

module shift_3 #(parameter data_width = 14)(
    input [data_width-1:0] din,
	input rst,clk,
	output wire [data_width-1:0] dout
	);
	
	reg [data_width-1:0] t0,t1,t2;
	
	always@(posedge clk or posedge rst)
	begin
	  if(rst) begin
	    t0 <= 0; t1 <= 0; t2 <= 0; 
	    end
	  else begin
	    t0 <= din;
	    t1 <= t0; t2 <= t1; 
	  end
	end
	
	assign dout = t2;
endmodule

module shift_4 #(parameter data_width = 14)(
    input [data_width-1:0] din,
	input rst,clk,
	output wire [data_width-1:0] dout
	);
	
	reg [data_width-1:0] t0,t1,t2,t3;
	
	always@(posedge clk or posedge rst)
	begin
	  if(rst) begin
	    t0 <= 0; t1 <= 0; t2 <= 0; t3 <= 0;
	    end
	  else begin
	    t0 <= din;
	    t1 <= t0; t2 <= t1; t3 <= t2;
	  end
	end
	
	assign dout = t3;
endmodule

module shift_13 #(parameter data_width = 14)(
    input [data_width-1:0] din,
	input rst,clk,
	output wire [data_width-1:0] dout
	);
	
	reg [data_width-1:0] t0,t1,t2,t3,t4,t5,t6;
	reg [data_width-1:0] t7,t8,t9,t10,t11,t12;
	
	always@(posedge clk or posedge rst)
	begin
	  if(rst) begin
	    t0 <= 0; t1 <= 0; t2 <= 0; t3 <= 0; t4 <= 0;
	    t5 <= 0; t6 <= 0; t7 <= 0; t8 <= 0; t9 <= 0;
	    t10 <= 0; t11 <= 0; t12 <= 0; end
	  else begin
	    t0 <= din;
	    t1 <= t0; t2 <= t1; t3 <= t2; t4 <= t3;
	    t5 <= t4; t6 <= t5; t7 <= t6; t8 <= t7;
	    t9 <= t8; t10 <= t9; t11 <= t10; t12 <= t11;
	  end
	end
	
	assign dout = t12;
endmodule

module shift_14 #(parameter data_width = 14)(
    input [data_width-1:0] din,
	input rst,clk,
	output wire [data_width-1:0] dout
	);
	
	reg [data_width-1:0] t0,t1,t2,t3,t4,t5,t6;
	reg [data_width-1:0] t7,t8,t9,t10,t11,t12,t13;
	
	always@(posedge clk or posedge rst)
	begin
	  if(rst) begin
	    t0 <= 0; t1 <= 0; t2 <= 0; t3 <= 0; t4 <= 0;
	    t5 <= 0; t6 <= 0; t7 <= 0; t8 <= 0; t9 <= 0;
	    t10 <= 0; t11 <= 0; t12 <= 0; t13 <= 0; end
	  else begin
	    t0 <= din;
	    t1 <= t0; t2 <= t1; t3 <= t2; t4 <= t3;
	    t5 <= t4; t6 <= t5; t7 <= t6; t8 <= t7;
	    t9 <= t8; t10 <= t9; t11 <= t10; t12 <= t11; t13 <= t12;
	  end
	end
	
	assign dout = t13;
endmodule


/*module shift_2 #(parameter data_width = 14)(
    input [data_width-1:0] din,
	input rst,clk,
	output wire [data_width-1:0] dout
	);
	
	reg [data_width-1:0] t0,t1;
	
	always@(posedge clk or posedge rst)
	begin
	  if(rst) begin
	    t0 <= 0; t1 <= 0; 
	    end
	  else begin
	    t0 <= din;
	    t1 <= t0; 
	  end
	end
	
	assign dout = t1;
endmodule*/