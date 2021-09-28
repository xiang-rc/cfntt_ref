module network_bf_in #(parameter data_width = 14)(
    input clk,rst,
    input [2:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3,sel_a_4,sel_a_5,sel_a_6,sel_a_7,
    input [data_width-1:0] q0,q1,q2,q3,q4,q5,q6,q7,
    output reg [data_width-1:0] u0,v0,u1,v1,u2,v2,u3,v3
    );
   
   reg [2:0] sel_a_0_tmp,sel_a_1_tmp,sel_a_2_tmp,sel_a_3_tmp,sel_a_4_tmp,sel_a_5_tmp,sel_a_6_tmp,sel_a_7_tmp;
   always@(posedge clk or posedge rst)
   begin
     if(rst)
     begin
       sel_a_0_tmp <= 0;
       sel_a_1_tmp <= 0;
       sel_a_2_tmp <= 0;
       sel_a_3_tmp <= 0;
       sel_a_4_tmp <= 0;
       sel_a_5_tmp <= 0;
       sel_a_6_tmp <= 0;
       sel_a_7_tmp <= 0;
     end
     else
     begin
       sel_a_0_tmp <= sel_a_0; 
       sel_a_1_tmp <= sel_a_1;
       sel_a_2_tmp <= sel_a_2;
       sel_a_3_tmp <= sel_a_3;
       sel_a_4_tmp <= sel_a_4;
       sel_a_5_tmp <= sel_a_5;
       sel_a_6_tmp <= sel_a_6;
       sel_a_7_tmp <= sel_a_7;
     end
   end
   
   always@(*)
      begin
        case(sel_a_0_tmp)
        3'b000:u0 = q0;
        3'b001:v0 = q0;
        3'b010:u1 = q0;
        3'b011:v1 = q0;
        3'b100:u2 = q0;
        3'b101:v2 = q0;
        3'b110:u3 = q0;
        3'b111:v3 = q0;
        default:;
        endcase
        
        case(sel_a_1_tmp)
        3'b000:u0 = q1;
        3'b001:v0 = q1;
        3'b010:u1 = q1;
        3'b011:v1 = q1;
        3'b100:u2 = q1;
        3'b101:v2 = q1;
        3'b110:u3 = q1;
        3'b111:v3 = q1;
        default:;
        endcase
        
        case(sel_a_2_tmp)
        3'b000:u0 = q2;
        3'b001:v0 = q2;
        3'b010:u1 = q2;
        3'b011:v1 = q2;
        3'b100:u2 = q2;
        3'b101:v2 = q2;
        3'b110:u3 = q2;
        3'b111:v3 = q2;
        default:;
        endcase   
        
        case(sel_a_3_tmp)
        3'b000:u0 = q3;
        3'b001:v0 = q3;
        3'b010:u1 = q3;
        3'b011:v1 = q3;
        3'b100:u2 = q3;
        3'b101:v2 = q3;
        3'b110:u3 = q3;
        3'b111:v3 = q3;
        default:;
        endcase  
        
        case(sel_a_4_tmp)
        3'b000:u0 = q4;
        3'b001:v0 = q4;
        3'b010:u1 = q4;
        3'b011:v1 = q4;
        3'b100:u2 = q4;
        3'b101:v2 = q4;
        3'b110:u3 = q4;
        3'b111:v3 = q4;
        default:;
        endcase        
   
        case(sel_a_5_tmp)
        3'b000:u0 = q5;
        3'b001:v0 = q5;
        3'b010:u1 = q5;
        3'b011:v1 = q5;
        3'b100:u2 = q5;
        3'b101:v2 = q5;
        3'b110:u3 = q5;
        3'b111:v3 = q5;
        default:;
        endcase
        
        case(sel_a_6_tmp)
        3'b000:u0 = q6;
        3'b001:v0 = q6;
        3'b010:u1 = q6;
        3'b011:v1 = q6;
        3'b100:u2 = q6;
        3'b101:v2 = q6;
        3'b110:u3 = q6;
        3'b111:v3 = q6;
        default:;
        endcase
        case(sel_a_7_tmp)
        3'b000:u0 = q7;
        3'b001:v0 = q7;
        3'b010:u1 = q7;
        3'b011:v1 = q7;
        3'b100:u2 = q7;
        3'b101:v2 = q7;
        3'b110:u3 = q7;
        3'b111:v3 = q7;
        default:;
        endcase        
      end
endmodule