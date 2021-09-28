module network_bf_out #(parameter data_width = 14)(
    input clk,rst,
    input [data_width-1:0] bf_0_upper,bf_0_lower,bf_1_upper,bf_1_lower,bf_2_upper,bf_2_lower,bf_3_upper,bf_3_lower,
    input [data_width-1:0] bf_4_upper,bf_4_lower,bf_5_upper,bf_5_lower,bf_6_upper,bf_6_lower,bf_7_upper,bf_7_lower,
    input [3:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3,sel_a_4,sel_a_5,sel_a_6,sel_a_7,
    input [3:0] sel_a_8,sel_a_9,sel_a_10,sel_a_11,sel_a_12,sel_a_13,sel_a_14,sel_a_15,
    output reg [data_width-1:0] d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15
    );
    
    wire [3:0] sel_a_0_reg,sel_a_1_reg,sel_a_2_reg,sel_a_3_reg;
    wire [3:0] sel_a_4_reg,sel_a_5_reg,sel_a_6_reg,sel_a_7_reg;
    wire [3:0] sel_a_8_reg,sel_a_9_reg,sel_a_10_reg,sel_a_11_reg;
    wire [3:0] sel_a_12_reg,sel_a_13_reg,sel_a_14_reg,sel_a_15_reg;
    
    shift_7 #(.data_width(4)) shift0 (.clk(clk),.rst(rst),.din(sel_a_0),.dout(sel_a_0_reg));
    shift_7 #(.data_width(4)) shift1 (.clk(clk),.rst(rst),.din(sel_a_1),.dout(sel_a_1_reg));
    shift_7 #(.data_width(4)) shift2 (.clk(clk),.rst(rst),.din(sel_a_2),.dout(sel_a_2_reg));
    shift_7 #(.data_width(4)) shift3 (.clk(clk),.rst(rst),.din(sel_a_3),.dout(sel_a_3_reg));
    shift_7 #(.data_width(4)) shift4 (.clk(clk),.rst(rst),.din(sel_a_4),.dout(sel_a_4_reg));
    shift_7 #(.data_width(4)) shift5 (.clk(clk),.rst(rst),.din(sel_a_5),.dout(sel_a_5_reg));
    shift_7 #(.data_width(4)) shift6 (.clk(clk),.rst(rst),.din(sel_a_6),.dout(sel_a_6_reg));
    shift_7 #(.data_width(4)) shift7 (.clk(clk),.rst(rst),.din(sel_a_7),.dout(sel_a_7_reg));
    shift_7 #(.data_width(4)) shift8 (.clk(clk),.rst(rst),.din(sel_a_8),.dout(sel_a_8_reg));
    shift_7 #(.data_width(4)) shift9 (.clk(clk),.rst(rst),.din(sel_a_9),.dout(sel_a_9_reg));
    shift_7 #(.data_width(4)) shift10 (.clk(clk),.rst(rst),.din(sel_a_10),.dout(sel_a_10_reg));
    shift_7 #(.data_width(4)) shift11 (.clk(clk),.rst(rst),.din(sel_a_11),.dout(sel_a_11_reg));
    shift_7 #(.data_width(4)) shift12 (.clk(clk),.rst(rst),.din(sel_a_12),.dout(sel_a_12_reg));
    shift_7 #(.data_width(4)) shift13 (.clk(clk),.rst(rst),.din(sel_a_13),.dout(sel_a_13_reg));
    shift_7 #(.data_width(4)) shift14 (.clk(clk),.rst(rst),.din(sel_a_14),.dout(sel_a_14_reg));
    shift_7 #(.data_width(4)) shift15 (.clk(clk),.rst(rst),.din(sel_a_15),.dout(sel_a_15_reg));

    always@(*)
    begin
       case(sel_a_0_reg)
       4'd0:d0 = bf_0_lower;
       4'd1:d0 = bf_0_upper;
       4'd2:d0 = bf_1_lower;
       4'd3:d0 = bf_1_upper;
       4'd4:d0 = bf_2_lower;
       4'd5:d0 = bf_2_upper;
       4'd6:d0 = bf_3_lower;
       4'd7:d0 = bf_3_upper;
       4'd8:d0 = bf_4_lower;
       4'd9:d0 = bf_4_upper;
       4'd10:d0 = bf_5_lower;
       4'd11:d0 = bf_5_upper;
       4'd12:d0 = bf_6_lower;
       4'd13:d0 = bf_6_upper;
       4'd14:d0 = bf_7_lower;
       4'd15:d0 = bf_7_upper;
       default:;
       endcase
    end
                 
    always@(*)
    begin
      case(sel_a_1_reg)
      4'd0:d1 = bf_0_lower;
      4'd1:d1 = bf_0_upper;
      4'd2:d1 = bf_1_lower;
      4'd3:d1 = bf_1_upper;
      4'd4:d1 = bf_2_lower;
      4'd5:d1 = bf_2_upper;
      4'd6:d1 = bf_3_lower;
      4'd7:d1 = bf_3_upper;
      4'd8:d1 = bf_4_lower;
      4'd9:d1 = bf_4_upper;
      4'd10:d1 = bf_5_lower;
      4'd11:d1 = bf_5_upper;
      4'd12:d1 = bf_6_lower;
      4'd13:d1 = bf_6_upper;
      4'd14:d1 = bf_7_lower;
      4'd15:d1 = bf_7_upper;
      default:;
      endcase
    end
                 
                             always@(*)
                             begin
                               case(sel_a_2_reg)
                               // add generated file here
                                4'd0:d2 = bf_0_lower;
                                4'd1:d2 = bf_0_upper;
                                4'd2:d2 = bf_1_lower;
                                4'd3:d2 = bf_1_upper;
                                4'd4:d2 = bf_2_lower;
                                4'd5:d2 = bf_2_upper;
                                4'd6:d2 = bf_3_lower;
                                4'd7:d2 = bf_3_upper;
                                4'd8:d2 = bf_4_lower;
                                4'd9:d2 = bf_4_upper;
                                4'd10:d2 = bf_5_lower;
                                4'd11:d2 = bf_5_upper;
                                4'd12:d2 = bf_6_lower;
                                4'd13:d2 = bf_6_upper;
                                4'd14:d2 = bf_7_lower;
                                4'd15:d2 = bf_7_upper;
                               default:;
                               endcase
                             end
                 
                             always@(*)
                             begin
                               case(sel_a_3_reg)
                               // add generated file here
                                4'd0:d3 = bf_0_lower;
                                4'd1:d3 = bf_0_upper;
                                4'd2:d3 = bf_1_lower;
                                4'd3:d3 = bf_1_upper;
                                4'd4:d3 = bf_2_lower;
                                4'd5:d3 = bf_2_upper;
                                4'd6:d3 = bf_3_lower;
                                4'd7:d3 = bf_3_upper;
                                4'd8:d3 = bf_4_lower;
                                4'd9:d3 = bf_4_upper;
                                4'd10:d3 = bf_5_lower;
                                4'd11:d3 = bf_5_upper;
                                4'd12:d3 = bf_6_lower;
                                4'd13:d3 = bf_6_upper;
                                4'd14:d3 = bf_7_lower;
                                4'd15:d3 = bf_7_upper;
                               default:;
                               endcase
                             end
                 
                             always@(*)
                             begin
                               case(sel_a_4_reg)
                               // add generated file here
                                4'd0:d4 = bf_0_lower;
                                4'd1:d4 = bf_0_upper;
                                4'd2:d4 = bf_1_lower;
                                4'd3:d4 = bf_1_upper;
                                4'd4:d4 = bf_2_lower;
                                4'd5:d4 = bf_2_upper;
                                4'd6:d4 = bf_3_lower;
                                4'd7:d4 = bf_3_upper;
                                4'd8:d4 = bf_4_lower;
                                4'd9:d4 = bf_4_upper;
                                4'd10:d4 = bf_5_lower;
                                4'd11:d4 = bf_5_upper;
                                4'd12:d4 = bf_6_lower;
                                4'd13:d4 = bf_6_upper;
                                4'd14:d4 = bf_7_lower;
                                4'd15:d4 = bf_7_upper;
                               default:;
                               endcase
                             end
                 
                             always@(*)
                             begin
                               case(sel_a_5_reg)
                               // add generated file here
                                4'd0:d5 = bf_0_lower;
                                4'd1:d5 = bf_0_upper;
                                4'd2:d5 = bf_1_lower;
                                4'd3:d5 = bf_1_upper;
                                4'd4:d5 = bf_2_lower;
                                4'd5:d5 = bf_2_upper;
                                4'd6:d5 = bf_3_lower;
                                4'd7:d5 = bf_3_upper;
                                4'd8:d5 = bf_4_lower;
                                4'd9:d5 = bf_4_upper;
                                4'd10:d5 = bf_5_lower;
                                4'd11:d5 = bf_5_upper;
                                4'd12:d5 = bf_6_lower;
                                4'd13:d5 = bf_6_upper;
                                4'd14:d5 = bf_7_lower;
                                4'd15:d5 = bf_7_upper;
                               default:;
                               endcase
                             end
                 
                             always@(*)
                             begin
                               case(sel_a_6_reg)
                               // add generated file here
                                4'd0:d6 = bf_0_lower;
                                4'd1:d6 = bf_0_upper;
                                4'd2:d6 = bf_1_lower;
                                4'd3:d6 = bf_1_upper;
                                4'd4:d6 = bf_2_lower;
                                4'd5:d6 = bf_2_upper;
                                4'd6:d6 = bf_3_lower;
                                4'd7:d6 = bf_3_upper;
                                4'd8:d6 = bf_4_lower;
                                4'd9:d6 = bf_4_upper;
                                4'd10:d6 = bf_5_lower;
                                4'd11:d6 = bf_5_upper;
                                4'd12:d6 = bf_6_lower;
                                4'd13:d6 = bf_6_upper;
                                4'd14:d6 = bf_7_lower;
                                4'd15:d6 = bf_7_upper;
                               default:;
                               endcase
                             end
                 
                             always@(*)
                             begin
                               case(sel_a_7_reg)
                               // add generated file here
                                4'd0:d7 = bf_0_lower;
                                4'd1:d7 = bf_0_upper;
                                4'd2:d7 = bf_1_lower;
                                4'd3:d7 = bf_1_upper;
                                4'd4:d7 = bf_2_lower;
                                4'd5:d7 = bf_2_upper;
                                4'd6:d7 = bf_3_lower;
                                4'd7:d7 = bf_3_upper;
                                4'd8:d7 = bf_4_lower;
                                4'd9:d7 = bf_4_upper;
                                4'd10:d7 = bf_5_lower;
                                4'd11:d7 = bf_5_upper;
                                4'd12:d7 = bf_6_lower;
                                4'd13:d7 = bf_6_upper;
                                4'd14:d7 = bf_7_lower;
                                4'd15:d7 = bf_7_upper;
                               default:;
                               endcase
                             end
                 
                             always@(*)
                             begin
                               case(sel_a_8_reg)
                               // add generated file here
                                4'd0:d8 = bf_0_lower;
                                4'd1:d8 = bf_0_upper;
                                4'd2:d8 = bf_1_lower;
                                4'd3:d8 = bf_1_upper;
                                4'd4:d8 = bf_2_lower;
                                4'd5:d8 = bf_2_upper;
                                4'd6:d8 = bf_3_lower;
                                4'd7:d8 = bf_3_upper;
                                4'd8:d8 = bf_4_lower;
                                4'd9:d8 = bf_4_upper;
                                4'd10:d8 = bf_5_lower;
                                4'd11:d8 = bf_5_upper;
                                4'd12:d8 = bf_6_lower;
                                4'd13:d8 = bf_6_upper;
                                4'd14:d8 = bf_7_lower;
                                4'd15:d8 = bf_7_upper;
                               default:;
                               endcase
                             end
                 
                             always@(*)
                             begin
                               case(sel_a_9_reg)
                               // add generated file here
                                4'd0:d9 = bf_0_lower;
                                4'd1:d9 = bf_0_upper;
                                4'd2:d9 = bf_1_lower;
                                4'd3:d9 = bf_1_upper;
                                4'd4:d9 = bf_2_lower;
                                4'd5:d9 = bf_2_upper;
                                4'd6:d9 = bf_3_lower;
                                4'd7:d9 = bf_3_upper;
                                4'd8:d9 = bf_4_lower;
                                4'd9:d9 = bf_4_upper;
                                4'd10:d9 = bf_5_lower;
                                4'd11:d9 = bf_5_upper;
                                4'd12:d9 = bf_6_lower;
                                4'd13:d9 = bf_6_upper;
                                4'd14:d9 = bf_7_lower;
                                4'd15:d9 = bf_7_upper;
                               default:;
                               endcase
                             end
                 
                             always@(*)
                             begin
                               case(sel_a_10_reg)
                               // add generated file here
                                4'd0:d10 = bf_0_lower;
                                4'd1:d10 = bf_0_upper;
                                4'd2:d10 = bf_1_lower;
                                4'd3:d10 = bf_1_upper;
                                4'd4:d10 = bf_2_lower;
                                4'd5:d10 = bf_2_upper;
                                4'd6:d10 = bf_3_lower;
                                4'd7:d10 = bf_3_upper;
                                4'd8:d10 = bf_4_lower;
                                4'd9:d10 = bf_4_upper;
                                4'd10:d10 = bf_5_lower;
                                4'd11:d10 = bf_5_upper;
                                4'd12:d10 = bf_6_lower;
                                4'd13:d10 = bf_6_upper;
                                4'd14:d10 = bf_7_lower;
                                4'd15:d10 = bf_7_upper;
                               default:;
                               endcase
                             end
                 
                             always@(*)
                             begin
                               case(sel_a_11_reg)
                               // add generated file here
                                4'd0:d11 = bf_0_lower;
                                4'd1:d11 = bf_0_upper;
                                4'd2:d11 = bf_1_lower;
                                4'd3:d11 = bf_1_upper;
                                4'd4:d11 = bf_2_lower;
                                4'd5:d11 = bf_2_upper;
                                4'd6:d11 = bf_3_lower;
                                4'd7:d11 = bf_3_upper;
                                4'd8:d11 = bf_4_lower;
                                4'd9:d11 = bf_4_upper;
                                4'd10:d11 = bf_5_lower;
                                4'd11:d11 = bf_5_upper;
                                4'd12:d11 = bf_6_lower;
                                4'd13:d11 = bf_6_upper;
                                4'd14:d11 = bf_7_lower;
                                4'd15:d11 = bf_7_upper;
                               default:;
                               endcase
                             end
                 
                             always@(*)
                             begin
                               case(sel_a_12_reg)
                               // add generated file here
                                4'd0:d12 = bf_0_lower;
                                4'd1:d12 = bf_0_upper;
                                4'd2:d12 = bf_1_lower;
                                4'd3:d12 = bf_1_upper;
                                4'd4:d12 = bf_2_lower;
                                4'd5:d12 = bf_2_upper;
                                4'd6:d12 = bf_3_lower;
                                4'd7:d12 = bf_3_upper;
                                4'd8:d12 = bf_4_lower;
                                4'd9:d12 = bf_4_upper;
                                4'd10:d12 = bf_5_lower;
                                4'd11:d12 = bf_5_upper;
                                4'd12:d12 = bf_6_lower;
                                4'd13:d12 = bf_6_upper;
                                4'd14:d12 = bf_7_lower;
                                4'd15:d12 = bf_7_upper;
                               default:;
                               endcase
                             end
                 
                             always@(*)
                             begin
                               case(sel_a_13_reg)
                               // add generated file here
                                4'd0:d13 = bf_0_lower;
                                4'd1:d13 = bf_0_upper;
                                4'd2:d13 = bf_1_lower;
                                4'd3:d13 = bf_1_upper;
                                4'd4:d13 = bf_2_lower;
                                4'd5:d13 = bf_2_upper;
                                4'd6:d13 = bf_3_lower;
                                4'd7:d13 = bf_3_upper;
                                4'd8:d13 = bf_4_lower;
                                4'd9:d13 = bf_4_upper;
                                4'd10:d13 = bf_5_lower;
                                4'd11:d13 = bf_5_upper;
                                4'd12:d13 = bf_6_lower;
                                4'd13:d13 = bf_6_upper;
                                4'd14:d13 = bf_7_lower;
                                4'd15:d13 = bf_7_upper;
                               default:;
                               endcase
                             end
                 
                             always@(*)
                             begin
                               case(sel_a_14_reg)
                               // add generated file here
                                4'd0:d14 = bf_0_lower;
                                4'd1:d14 = bf_0_upper;
                                4'd2:d14 = bf_1_lower;
                                4'd3:d14 = bf_1_upper;
                                4'd4:d14 = bf_2_lower;
                                4'd5:d14 = bf_2_upper;
                                4'd6:d14 = bf_3_lower;
                                4'd7:d14 = bf_3_upper;
                                4'd8:d14 = bf_4_lower;
                                4'd9:d14 = bf_4_upper;
                                4'd10:d14 = bf_5_lower;
                                4'd11:d14 = bf_5_upper;
                                4'd12:d14 = bf_6_lower;
                                4'd13:d14 = bf_6_upper;
                                4'd14:d14 = bf_7_lower;
                                4'd15:d14 = bf_7_upper;
                               default:;
                               endcase
                             end
                 
                             always@(*)
                             begin
                               case(sel_a_15_reg)
                               // add generated file here
                                4'd0:d15 = bf_0_lower;
                                4'd1:d15 = bf_0_upper;
                                4'd2:d15 = bf_1_lower;
                                4'd3:d15 = bf_1_upper;
                                4'd4:d15 = bf_2_lower;
                                4'd5:d15 = bf_2_upper;
                                4'd6:d15 = bf_3_lower;
                                4'd7:d15 = bf_3_upper;
                                4'd8:d15 = bf_4_lower;
                                4'd9:d15 = bf_4_upper;
                                4'd10:d15 = bf_5_lower;
                                4'd11:d15 = bf_5_upper;
                                4'd12:d15 = bf_6_lower;
                                4'd13:d15 = bf_6_upper;
                                4'd14:d15 = bf_7_lower;
                                4'd15:d15 = bf_7_upper;
                               default:;
                               endcase
                             end
endmodule