module network_bank_in #(parameter addr_width = 8)(
    input [addr_width-1:0] b0,b1,b2,b3,
    input [1:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3,
    output reg [addr_width-1:0] new_address_0,new_address_1,new_address_2,new_address_3
    );
    
    always@(*)
    begin
      case(sel_a_0)
        2'b00:new_address_0 = b0;
        2'b01:new_address_0 = b1;
        2'b10:new_address_0 = b2;
        2'b11:new_address_0 = b3;
        default:new_address_0 = b0;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_1)
        2'b00:new_address_1 = b0;
        2'b01:new_address_1 = b1;
        2'b10:new_address_1 = b2;
        2'b11:new_address_1 = b3;
        default:new_address_1 = b0;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_2)
        2'b00:new_address_2 = b0;
        2'b01:new_address_2 = b1;
        2'b10:new_address_2 = b2;
        2'b11:new_address_2 = b3;
        default:new_address_2 = b0;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_3)
        2'b00:new_address_3 = b0;
        2'b01:new_address_3 = b1;
        2'b10:new_address_3 = b2;
        2'b11:new_address_3 = b3;
        default:new_address_3 = b0;
      endcase
    end
    
endmodule