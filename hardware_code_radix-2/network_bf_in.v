module network_bf_in #(parameter data_width = 14)(
    input clk,rst,
    input sel_a_0,sel_a_1,
    input [data_width-1:0] q0,q1,
    output [data_width-1:0] u0,v0
    );
   
   reg sel_a_0_tmp;
   always@(posedge clk or posedge rst)
   begin
     if(rst)
       sel_a_0_tmp <= 0;
     else
       sel_a_0_tmp <= sel_a_0; 
   end
   
   assign u0 = sel_a_0_tmp == 0 ? q0 : q1;
   assign v0 = sel_a_0_tmp == 1 ? q0 : q1;

endmodule