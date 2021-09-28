module tf_address_generator(
    input clk,rst,
    input [2:0] conf,
    input [5:0] k,
    input [3:0] p,
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
      9:begin tf_address_reg_0 = k; tf_address_reg_1 = k; end
      8:begin tf_address_reg_0 = k + 1; tf_address_reg_1 = 2 - k; end
      7:begin tf_address_reg_0 = k + 3; tf_address_reg_1 = 6 - k ; end
      6:begin tf_address_reg_0 = k + 7; tf_address_reg_1 = 14 - k; end
      5:begin tf_address_reg_0 = k + 15; tf_address_reg_1 = 30 - k; end
      4:begin tf_address_reg_0 = k + 31; tf_address_reg_1 = 62 - k; end
      3:begin tf_address_reg_0 = k + 63; tf_address_reg_1 = 126 - k; end
      2:begin tf_address_reg_0 = k + 127; tf_address_reg_1 = 190 - k; end
      1:begin tf_address_reg_0 = k + 191; tf_address_reg_1 = 254 - k; end
      0:begin tf_address_reg_0 = k + 255; tf_address_reg_1 = 318 - k; end
      default:begin tf_address_reg_0 = 0; tf_address_reg_1 = 0; end
      endcase
    end
endmodule