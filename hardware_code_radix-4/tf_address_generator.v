module tf_address_generator(
    input clk,rst,
    input [2:0] conf,
    input [7:0] k,
    input [2:0] p,
    output wire [8:0] tf_address
    );
    
    reg [8:0] tf_address_reg_0,tf_address_reg_1;
    wire [8:0] tf_address_tmp;
    //sel = 0 NTT mode; sel = 1 INTT mode
    assign tf_address_tmp = ((conf == 3'b001) || (conf == 3'b100)) ? tf_address_reg_0 : tf_address_reg_1;//sel¸Ä³Éconf
    
    DFF #(.data_width(9)) dff_tf(.clk(clk),.rst(rst),.d(tf_address_tmp),.q(tf_address));
    
    always@(*)
    begin
      case(p)
      4:begin tf_address_reg_0 = k; tf_address_reg_1 = k; end
      3:begin tf_address_reg_0 = k + 1; tf_address_reg_1 = 4 - k; end
      2:begin tf_address_reg_0 = k + 5; tf_address_reg_1 = 20 - k; end
      1:begin tf_address_reg_0 = k + 21; tf_address_reg_1 = 84 - k; end
      0:begin tf_address_reg_0 = k + 85; tf_address_reg_1 = 340 - k; end
      default:begin tf_address_reg_0 = 0; tf_address_reg_1 = 0; end
      endcase
    end
endmodule