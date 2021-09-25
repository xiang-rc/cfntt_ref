module network_bf_out #(parameter data_width = 14)(
    input clk,rst,
    input [data_width-1:0] bf_0_upper,bf_0_lower,
    input sel_a_0,sel_a_1,
    output reg [data_width-1:0] d0,d1
    );
    
    wire sel_a_0_reg,sel_a_1_reg;
    
    
    shift_7 #(.data_width(1)) shift0 (.clk(clk),.rst(rst),.din(sel_a_0),.dout(sel_a_0_reg));
    shift_7 #(.data_width(1)) shift1 (.clk(clk),.rst(rst),.din(sel_a_1),.dout(sel_a_1_reg));

    always@(*)
    begin
      case(sel_a_0_reg)
      1'b0:d0 = bf_0_lower;
      1'b1:d0 = bf_0_upper;
      default:;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_1_reg)
      1'b0:d1 = bf_0_lower;
      1'b1:d1 = bf_0_upper;
      default:;
      endcase
    end
endmodule