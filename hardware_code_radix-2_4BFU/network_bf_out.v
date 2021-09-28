module network_bf_out #(parameter data_width = 14)(
    input clk,rst,
    input [data_width-1:0] bf_0_upper,bf_0_lower,bf_1_upper,bf_1_lower,bf_2_upper,bf_2_lower,bf_3_upper,bf_3_lower,
    input [2:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3,sel_a_4,sel_a_5,sel_a_6,sel_a_7,
    output reg [data_width-1:0] d0,d1,d2,d3,d4,d5,d6,d7
    );
    
    reg [2:0] sel_a_0_reg,sel_a_1_reg,sel_a_2_reg,sel_a_3_reg;
    reg [2:0] sel_a_4_reg,sel_a_5_reg,sel_a_6_reg,sel_a_7_reg;
    
    shift_7 #(.data_width(3)) shift0 (.clk(clk),.rst(rst),.din(sel_a_0),.dout(sel_a_0_reg));
    shift_7 #(.data_width(3)) shift1 (.clk(clk),.rst(rst),.din(sel_a_1),.dout(sel_a_1_reg));
    shift_7 #(.data_width(3)) shift2 (.clk(clk),.rst(rst),.din(sel_a_2),.dout(sel_a_2_reg));
    shift_7 #(.data_width(3)) shift3 (.clk(clk),.rst(rst),.din(sel_a_3),.dout(sel_a_3_reg));
    shift_7 #(.data_width(3)) shift4 (.clk(clk),.rst(rst),.din(sel_a_4),.dout(sel_a_4_reg));
    shift_7 #(.data_width(3)) shift5 (.clk(clk),.rst(rst),.din(sel_a_5),.dout(sel_a_5_reg));
    shift_7 #(.data_width(3)) shift6 (.clk(clk),.rst(rst),.din(sel_a_6),.dout(sel_a_6_reg));
    shift_7 #(.data_width(3)) shift7 (.clk(clk),.rst(rst),.din(sel_a_7),.dout(sel_a_7_reg));

    always@(*)
    begin
      case(sel_a_0_reg)
      3'b000:d0 = bf_0_lower;
      3'b001:d0 = bf_0_upper;
      3'b010:d0 = bf_1_lower;
      3'b011:d0 = bf_1_upper;
      3'b100:d0 = bf_2_lower;
      3'b101:d0 = bf_2_upper;
      3'b110:d0 = bf_3_lower;
      3'b111:d0 = bf_3_upper;
      default:;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_1_reg)
      3'b000:d1 = bf_0_lower;
      3'b001:d1 = bf_0_upper;
      3'b010:d1 = bf_1_lower;
      3'b011:d1 = bf_1_upper;
      3'b100:d1 = bf_2_lower;
      3'b101:d1 = bf_2_upper;
      3'b110:d1 = bf_3_lower;
      3'b111:d1 = bf_3_upper;
      default:;
      endcase
    end    
    
    always@(*)
    begin
      case(sel_a_2_reg)
      3'b000:d2 = bf_0_lower;
      3'b001:d2 = bf_0_upper;
      3'b010:d2 = bf_1_lower;
      3'b011:d2 = bf_1_upper;
      3'b100:d2 = bf_2_lower;
      3'b101:d2 = bf_2_upper;
      3'b110:d2 = bf_3_lower;
      3'b111:d2 = bf_3_upper;
      default:;
      endcase
    end                       

    always@(*)
    begin
      case(sel_a_3_reg)
      3'b000:d3 = bf_0_lower;
      3'b001:d3 = bf_0_upper;
      3'b010:d3 = bf_1_lower;
      3'b011:d3 = bf_1_upper;
      3'b100:d3 = bf_2_lower;
      3'b101:d3 = bf_2_upper;
      3'b110:d3 = bf_3_lower;
      3'b111:d3 = bf_3_upper;
      default:;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_4_reg)
      3'b000:d4 = bf_0_lower;
      3'b001:d4 = bf_0_upper;
      3'b010:d4 = bf_1_lower;
      3'b011:d4 = bf_1_upper;
      3'b100:d4 = bf_2_lower;
      3'b101:d4 = bf_2_upper;
      3'b110:d4 = bf_3_lower;
      3'b111:d4 = bf_3_upper;
      default:;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_5_reg)
      3'b000:d5 = bf_0_lower;
      3'b001:d5 = bf_0_upper;
      3'b010:d5 = bf_1_lower;
      3'b011:d5 = bf_1_upper;
      3'b100:d5 = bf_2_lower;
      3'b101:d5 = bf_2_upper;
      3'b110:d5 = bf_3_lower;
      3'b111:d5 = bf_3_upper;
      default:;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_6_reg)
      3'b000:d6 = bf_0_lower;
      3'b001:d6 = bf_0_upper;
      3'b010:d6 = bf_1_lower;
      3'b011:d6 = bf_1_upper;
      3'b100:d6 = bf_2_lower;
      3'b101:d6 = bf_2_upper;
      3'b110:d6 = bf_3_lower;
      3'b111:d6 = bf_3_upper;
      default:;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_7_reg)
      3'b000:d7 = bf_0_lower;
      3'b001:d7 = bf_0_upper;
      3'b010:d7 = bf_1_lower;
      3'b011:d7 = bf_1_upper;
      3'b100:d7 = bf_2_lower;
      3'b101:d7 = bf_2_upper;
      3'b110:d7 = bf_3_lower;
      3'b111:d7 = bf_3_upper;
      default:;
      endcase
    end
endmodule