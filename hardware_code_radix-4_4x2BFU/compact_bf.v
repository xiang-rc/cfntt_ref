module compact_bf #(parameter data_width = 14)(
        input clk,rst,
        input [data_width-1:0] u0,v0,u1,v1,
        input [data_width-1:0] wa1,wa2,wa3,
        input sel,
        output [data_width-1:0] bf_0_upper,bf_0_lower,bf_1_upper,bf_1_lower
        //bf_lower为大的数，赋给小的索引
        //bf_upper为小的数，赋给大的索引
        );
        wire [data_width-1:0] PE0_in_up,PE0_in_low,PE0_out_up,PE0_out_low;
        wire [data_width-1:0] PE1_in_up,PE1_in_low,PE1_out_up,PE1_out_low;
        wire [data_width-1:0] PE2_in_up,PE2_in_low,PE2_out_up,PE2_out_low;
        wire [data_width-1:0] PE3_in_up,PE3_in_low,PE3_out_up,PE3_out_low;
        
        PE0 m_pe0(
                  .clk(clk),.rst(rst),
                  .sel(sel),
                  .u(PE0_in_up),.v(PE0_in_low),.w(wa2),
                  .bf_upper(PE0_out_low),.bf_lower(PE0_out_up));
        PE1 m_pe1(
             .clk(clk),.rst(rst),
             .sel(sel),
             .u(PE1_in_up),.v(PE1_in_low),
             .bf_upper(PE1_out_low),.bf_lower(PE1_out_up));     
        PE2 m_pe2(
              .clk(clk),.rst(rst),
              .u(PE2_in_up),.v(PE2_in_low),.w1(wa1),.w2(wa3),
              .sel(sel),
              .bf_upper(PE2_out_low),.bf_lower(PE2_out_up));       
        PE3 m_pe3(
              .clk(clk),.rst(rst),
              .u(PE3_in_up),.v(PE3_in_low),
              .sel(sel),
              .bf_upper(PE3_out_low),.bf_lower(PE3_out_up));
              
   assign PE0_in_up = sel == 1'b0 ? u0 : PE3_out_up;
   assign PE0_in_low = sel == 1'b0 ? v0 : PE1_out_up;
   assign PE2_in_up = sel == 1'b0 ? u1 : PE3_out_low;
   assign PE2_in_low = sel == 1'b0 ? v1 : PE1_out_low;
 
   assign PE1_in_up = sel == 1'b0 ? PE0_out_up : u1;
   assign PE1_in_low = sel == 1'b0 ? PE2_out_up : v1;
   assign PE3_in_up = sel == 1'b0 ? PE0_out_low : u0;
   assign PE3_in_low = sel == 1'b0 ? PE2_out_low : v0;
   
   assign bf_0_lower = sel == 1'b0 ? PE1_out_up : PE0_out_up;
   assign bf_0_upper = sel == 1'b0 ? PE3_out_up : PE2_out_up;
   assign bf_1_lower = sel == 1'b0 ? PE1_out_low : PE0_out_low;
   assign bf_1_upper = sel == 1'b0 ? PE3_out_low : PE2_out_low;
   
endmodule