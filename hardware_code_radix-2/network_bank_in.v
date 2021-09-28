module network_bank_in #(parameter addr_width = 9)(
    input [addr_width-1:0] b0,b1,
    input sel_a_0,sel_a_1,
    output reg [addr_width-1:0] new_address_0,new_address_1);
    
    always@(*)
    begin
      case(sel_a_0)
        1'b0:new_address_0 = b0;
        1'b1:new_address_0 = b1;
        default:;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_1)
        1'b0:new_address_1 = b0;
        1'b1:new_address_1 = b1;
        default:;
      endcase
    end
    
endmodule