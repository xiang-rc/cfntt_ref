module network_bf_in #(parameter data_width = 14)(
    input clk,rst,
    input [3:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3,sel_a_4,sel_a_5,sel_a_6,sel_a_7,
    input [3:0] sel_a_8,sel_a_9,sel_a_10,sel_a_11,sel_a_12,sel_a_13,sel_a_14,sel_a_15,
    input [data_width-1:0] q0,q1,q2,q3,q4,q5,q6,q7,
    input [data_width-1:0] q8,q9,q10,q11,q12,q13,q14,q15,
    output reg [data_width-1:0] u0,v0,u1,v1,u2,v2,u3,v3,
    output reg [data_width-1:0] u4,v4,u5,v5,u6,v6,u7,v7);
   
   reg [3:0] sel_a_0_reg,sel_a_1_reg,sel_a_2_reg,sel_a_3_reg,sel_a_4_reg,sel_a_5_reg,sel_a_6_reg,sel_a_7_reg;
   reg [3:0] sel_a_8_reg,sel_a_9_reg,sel_a_10_reg,sel_a_11_reg,sel_a_12_reg,sel_a_13_reg,sel_a_14_reg,sel_a_15_reg;
   
   //DFF #(.data_width(4)) shift0 (.clk(clk),.rst(rst),.d(sel_a_0),.q(sel_a_0_reg));
   //DFF #(.data_width(4)) shift1 (.clk(clk),.rst(rst),.d(sel_a_1),.q(sel_a_1_reg));
   //DFF #(.data_width(4)) shift2 (.clk(clk),.rst(rst),.d(sel_a_2),.q(sel_a_2_reg));
   //DFF #(.data_width(4)) shift3 (.clk(clk),.rst(rst),.d(sel_a_3),.q(sel_a_3_reg));
   //DFF #(.data_width(4)) shift4 (.clk(clk),.rst(rst),.d(sel_a_4),.q(sel_a_4_reg));
   //DFF #(.data_width(4)) shift5 (.clk(clk),.rst(rst),.d(sel_a_5),.q(sel_a_5_reg));
   //DFF #(.data_width(4)) shift6 (.clk(clk),.rst(rst),.d(sel_a_6),.q(sel_a_6_reg));
   //DFF #(.data_width(4)) shift7 (.clk(clk),.rst(rst),.d(sel_a_7),.q(sel_a_7_reg));
   
   always@(posedge clk or posedge rst)
   begin
     if(rst)
     begin
     sel_a_0_reg <= 0;
     sel_a_1_reg <= 0;
     sel_a_2_reg <= 0;
     sel_a_3_reg <= 0;
     sel_a_4_reg <= 0;
     sel_a_5_reg <= 0;
     sel_a_6_reg <= 0;
     sel_a_7_reg <= 0;
     sel_a_8_reg <= 0;
     sel_a_9_reg <= 0;
     sel_a_10_reg <= 0;
     sel_a_11_reg <= 0;
     sel_a_12_reg <= 0;
     sel_a_13_reg <= 0;
     sel_a_14_reg <= 0;
     sel_a_15_reg <= 0;
     end
     else
     begin
     sel_a_0_reg <= sel_a_0;
     sel_a_1_reg <= sel_a_1;
     sel_a_2_reg <= sel_a_2;
     sel_a_3_reg <= sel_a_3;
     sel_a_4_reg <= sel_a_4;
     sel_a_5_reg <= sel_a_5;
     sel_a_6_reg <= sel_a_6;
     sel_a_7_reg <= sel_a_7;
     sel_a_8_reg <= sel_a_8;
     sel_a_9_reg <= sel_a_9;
     sel_a_10_reg <= sel_a_10;
     sel_a_11_reg <= sel_a_11;
     sel_a_12_reg <= sel_a_12;
     sel_a_13_reg <= sel_a_13;
     sel_a_14_reg <= sel_a_14;
     sel_a_15_reg <= sel_a_15;
     end
   end
   
   always@(*)
      begin
        u0 = 0;
        v0 = 0;
        u1 = 0;
        v1 = 0;
        u2 = 0;
        v2 = 0;
        u3 = 0;
        v3 = 0;
        u4 = 0;
        v4 = 0;
        u5 = 0;
        v5 = 0;
        u6 = 0;
        v6 = 0;
        u7 = 0;
        v7 = 0;
        case(sel_a_0_reg)
              //add generated file here
              4'd0: u0 = q0;
              4'd1: v0 = q0;
              4'd2: u1 = q0;
              4'd3: v1 = q0;
              4'd4: u2 = q0;
              4'd5: v2 = q0;
              4'd6: u3 = q0;
              4'd7: v3 = q0;
              4'd8: u4 = q0;
              4'd9: v4 = q0;
              4'd10: u5 = q0;
              4'd11: v5 = q0;
              4'd12: u6 = q0;
              4'd13: v6 = q0;
              4'd14: u7 = q0;
              4'd15: v7 = q0;
              default:;
              endcase
          
      
              case(sel_a_1_reg)
              //add generated file here
              4'd0: u0 = q1;
              4'd1: v0 = q1;
              4'd2: u1 = q1;
              4'd3: v1 = q1;
              4'd4: u2 = q1;
              4'd5: v2 = q1;
              4'd6: u3 = q1;
              4'd7: v3 = q1;
              4'd8: u4 = q1;
              4'd9: v4 = q1;
              4'd10: u5 = q1;
              4'd11: v5 = q1;
              4'd12: u6 = q1;
              4'd13: v6 = q1;
              4'd14: u7 = q1;
              4'd15: v7 = q1;
              default:;
              endcase
          
      
              case(sel_a_2_reg)
              //add generated file here
              4'd0: u0 = q2;
              4'd1: v0 = q2;
              4'd2: u1 = q2;
              4'd3: v1 = q2;
              4'd4: u2 = q2;
              4'd5: v2 = q2;
              4'd6: u3 = q2;
              4'd7: v3 = q2;
              4'd8: u4 = q2;
              4'd9: v4 = q2;
              4'd10: u5 = q2;
              4'd11: v5 = q2;
              4'd12: u6 = q2;
              4'd13: v6 = q2;
              4'd14: u7 = q2;
              4'd15: v7 = q2;
              default:;
              endcase
          
      
              case(sel_a_3_reg)
              //add generated file here
              4'd0: u0 = q3;
              4'd1: v0 = q3;
              4'd2: u1 = q3;
              4'd3: v1 = q3;
              4'd4: u2 = q3;
              4'd5: v2 = q3;
              4'd6: u3 = q3;
              4'd7: v3 = q3;
              4'd8: u4 = q3;
              4'd9: v4 = q3;
              4'd10: u5 = q3;
              4'd11: v5 = q3;
              4'd12: u6 = q3;
              4'd13: v6 = q3;
              4'd14: u7 = q3;
              4'd15: v7 = q3;
              default:;
              endcase
          
      
              case(sel_a_4_reg)
              //add generated file here
              4'd0: u0 = q4;
              4'd1: v0 = q4;
              4'd2: u1 = q4;
              4'd3: v1 = q4;
              4'd4: u2 = q4;
              4'd5: v2 = q4;
              4'd6: u3 = q4;
              4'd7: v3 = q4;
              4'd8: u4 = q4;
              4'd9: v4 = q4;
              4'd10: u5 = q4;
              4'd11: v5 = q4;
              4'd12: u6 = q4;
              4'd13: v6 = q4;
              4'd14: u7 = q4;
              4'd15: v7 = q4;
              default:;
              endcase
          
      
              case(sel_a_5_reg)
              //add generated file here
              4'd0: u0 = q5;
              4'd1: v0 = q5;
              4'd2: u1 = q5;
              4'd3: v1 = q5;
              4'd4: u2 = q5;
              4'd5: v2 = q5;
              4'd6: u3 = q5;
              4'd7: v3 = q5;
              4'd8: u4 = q5;
              4'd9: v4 = q5;
              4'd10: u5 = q5;
              4'd11: v5 = q5;
              4'd12: u6 = q5;
              4'd13: v6 = q5;
              4'd14: u7 = q5;
              4'd15: v7 = q5;
              default:;
              endcase
          
      
              case(sel_a_6_reg)
              //add generated file here
              4'd0: u0 = q6;
              4'd1: v0 = q6;
              4'd2: u1 = q6;
              4'd3: v1 = q6;
              4'd4: u2 = q6;
              4'd5: v2 = q6;
              4'd6: u3 = q6;
              4'd7: v3 = q6;
              4'd8: u4 = q6;
              4'd9: v4 = q6;
              4'd10: u5 = q6;
              4'd11: v5 = q6;
              4'd12: u6 = q6;
              4'd13: v6 = q6;
              4'd14: u7 = q6;
              4'd15: v7 = q6;
              default:;
              endcase
          
      
              case(sel_a_7_reg)
              //add generated file here
              4'd0: u0 = q7;
              4'd1: v0 = q7;
              4'd2: u1 = q7;
              4'd3: v1 = q7;
              4'd4: u2 = q7;
              4'd5: v2 = q7;
              4'd6: u3 = q7;
              4'd7: v3 = q7;
              4'd8: u4 = q7;
              4'd9: v4 = q7;
              4'd10: u5 = q7;
              4'd11: v5 = q7;
              4'd12: u6 = q7;
              4'd13: v6 = q7;
              4'd14: u7 = q7;
              4'd15: v7 = q7;
              default:;
              endcase
          
      
              case(sel_a_8_reg)
              //add generated file here
              4'd0: u0 = q8;
              4'd1: v0 = q8;
              4'd2: u1 = q8;
              4'd3: v1 = q8;
              4'd4: u2 = q8;
              4'd5: v2 = q8;
              4'd6: u3 = q8;
              4'd7: v3 = q8;
              4'd8: u4 = q8;
              4'd9: v4 = q8;
              4'd10: u5 = q8;
              4'd11: v5 = q8;
              4'd12: u6 = q8;
              4'd13: v6 = q8;
              4'd14: u7 = q8;
              4'd15: v7 = q8;
              default:;
              endcase
          
      
              case(sel_a_9_reg)
              //add generated file here
              4'd0: u0 = q9;
              4'd1: v0 = q9;
              4'd2: u1 = q9;
              4'd3: v1 = q9;
              4'd4: u2 = q9;
              4'd5: v2 = q9;
              4'd6: u3 = q9;
              4'd7: v3 = q9;
              4'd8: u4 = q9;
              4'd9: v4 = q9;
              4'd10: u5 = q9;
              4'd11: v5 = q9;
              4'd12: u6 = q9;
              4'd13: v6 = q9;
              4'd14: u7 = q9;
              4'd15: v7 = q9;
              default:;
              endcase
          
      
              case(sel_a_10_reg)
              //add generated file here
              4'd0: u0 = q10;
              4'd1: v0 = q10;
              4'd2: u1 = q10;
              4'd3: v1 = q10;
              4'd4: u2 = q10;
              4'd5: v2 = q10;
              4'd6: u3 = q10;
              4'd7: v3 = q10;
              4'd8: u4 = q10;
              4'd9: v4 = q10;
              4'd10: u5 = q10;
              4'd11: v5 = q10;
              4'd12: u6 = q10;
              4'd13: v6 = q10;
              4'd14: u7 = q10;
              4'd15: v7 = q10;
              default:;
              endcase
          
      
              case(sel_a_11_reg)
              //add generated file here
              4'd0: u0 = q11;
              4'd1: v0 = q11;
              4'd2: u1 = q11;
              4'd3: v1 = q11;
              4'd4: u2 = q11;
              4'd5: v2 = q11;
              4'd6: u3 = q11;
              4'd7: v3 = q11;
              4'd8: u4 = q11;
              4'd9: v4 = q11;
              4'd10: u5 = q11;
              4'd11: v5 = q11;
              4'd12: u6 = q11;
              4'd13: v6 = q11;
              4'd14: u7 = q11;
              4'd15: v7 = q11;
              default:;
              endcase
          
      
              case(sel_a_12_reg)
              //add generated file here
              4'd0: u0 = q12;
              4'd1: v0 = q12;
              4'd2: u1 = q12;
              4'd3: v1 = q12;
              4'd4: u2 = q12;
              4'd5: v2 = q12;
              4'd6: u3 = q12;
              4'd7: v3 = q12;
              4'd8: u4 = q12;
              4'd9: v4 = q12;
              4'd10: u5 = q12;
              4'd11: v5 = q12;
              4'd12: u6 = q12;
              4'd13: v6 = q12;
              4'd14: u7 = q12;
              4'd15: v7 = q12;
              default:;
              endcase
          
      
              case(sel_a_13_reg)
              //add generated file here
              4'd0: u0 = q13;
              4'd1: v0 = q13;
              4'd2: u1 = q13;
              4'd3: v1 = q13;
              4'd4: u2 = q13;
              4'd5: v2 = q13;
              4'd6: u3 = q13;
              4'd7: v3 = q13;
              4'd8: u4 = q13;
              4'd9: v4 = q13;
              4'd10: u5 = q13;
              4'd11: v5 = q13;
              4'd12: u6 = q13;
              4'd13: v6 = q13;
              4'd14: u7 = q13;
              4'd15: v7 = q13;
              default:;
              endcase
          
      
              case(sel_a_14_reg)
              //add generated file here
              4'd0: u0 = q14;
              4'd1: v0 = q14;
              4'd2: u1 = q14;
              4'd3: v1 = q14;
              4'd4: u2 = q14;
              4'd5: v2 = q14;
              4'd6: u3 = q14;
              4'd7: v3 = q14;
              4'd8: u4 = q14;
              4'd9: v4 = q14;
              4'd10: u5 = q14;
              4'd11: v5 = q14;
              4'd12: u6 = q14;
              4'd13: v6 = q14;
              4'd14: u7 = q14;
              4'd15: v7 = q14;
              default:;
              endcase
          
      
              case(sel_a_15_reg)
              //add generated file here
              4'd0: u0 = q15;
              4'd1: v0 = q15;
              4'd2: u1 = q15;
              4'd3: v1 = q15;
              4'd4: u2 = q15;
              4'd5: v2 = q15;
              4'd6: u3 = q15;
              4'd7: v3 = q15;
              4'd8: u4 = q15;
              4'd9: v4 = q15;
              4'd10: u5 = q15;
              4'd11: v5 = q15;
              4'd12: u6 = q15;
              4'd13: v6 = q15;
              4'd14: u7 = q15;
              4'd15: v7 = q15;
              default:;
              endcase        
      end
endmodule