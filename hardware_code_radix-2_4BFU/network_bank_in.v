module network_bank_in #(parameter addr_width = 7)(
    input [addr_width-1:0] b0,b1,b2,b3,b4,b5,b6,b7,
    input [2:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3,sel_a_4,sel_a_5,sel_a_6,sel_a_7,
    output reg [addr_width-1:0] new_address_0,new_address_1,new_address_2,new_address_3,new_address_4,
    output reg [addr_width-1:0] new_address_5,new_address_6,new_address_7
    );
    
    always@(*)
    begin
      case(sel_a_0)
        3'b000:new_address_0 = b0;
        3'b001:new_address_0 = b1;
        3'b010:new_address_0 = b2;
        3'b011:new_address_0 = b3;
        3'b100:new_address_0 = b4;
        3'b101:new_address_0 = b5;
        3'b110:new_address_0 = b6;
        3'b111:new_address_0 = b7;
        default:new_address_0 = b0;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_1)
        3'b000:new_address_1 = b0;
        3'b001:new_address_1 = b1;
        3'b010:new_address_1 = b2;
        3'b011:new_address_1 = b3;
        3'b100:new_address_1 = b4;
        3'b101:new_address_1 = b5;
        3'b110:new_address_1 = b6;
        3'b111:new_address_1 = b7;
        default:new_address_1 = b0;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_2)
        3'b000:new_address_2 = b0;
        3'b001:new_address_2 = b1;
        3'b010:new_address_2 = b2;
        3'b011:new_address_2 = b3;
        3'b100:new_address_2 = b4;
        3'b101:new_address_2 = b5;
        3'b110:new_address_2 = b6;
        3'b111:new_address_2 = b7;
        default:new_address_2 = b0;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_3)
        3'b000:new_address_3 = b0;
        3'b001:new_address_3 = b1;
        3'b010:new_address_3 = b2;
        3'b011:new_address_3 = b3;
        3'b100:new_address_3 = b4;
        3'b101:new_address_3 = b5;
        3'b110:new_address_3 = b6;
        3'b111:new_address_3 = b7;
        default:new_address_3 = b0;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_4)
        3'b000:new_address_4 = b0;
        3'b001:new_address_4 = b1;
        3'b010:new_address_4 = b2;
        3'b011:new_address_4 = b3;
        3'b100:new_address_4 = b4;
        3'b101:new_address_4 = b5;
        3'b110:new_address_4 = b6;
        3'b111:new_address_4 = b7;
        default:new_address_4 = b0;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_5)
        3'b000:new_address_5 = b0;
        3'b001:new_address_5 = b1;
        3'b010:new_address_5 = b2;
        3'b011:new_address_5 = b3;
        3'b100:new_address_5 = b4;
        3'b101:new_address_5 = b5;
        3'b110:new_address_5 = b6;
        3'b111:new_address_5 = b7;
        default:new_address_5 = b0;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_6)
        3'b000:new_address_6 = b0;
        3'b001:new_address_6 = b1;
        3'b010:new_address_6 = b2;
        3'b011:new_address_6 = b3;
        3'b100:new_address_6 = b4;
        3'b101:new_address_6 = b5;
        3'b110:new_address_6 = b6;
        3'b111:new_address_6 = b7;
        default:new_address_6 = b0;
      endcase
    end
    
    always@(*)
    begin
      case(sel_a_7)
        3'b000:new_address_7 = b0;
        3'b001:new_address_7 = b1;
        3'b010:new_address_7 = b2;
        3'b011:new_address_7 = b3;
        3'b100:new_address_7 = b4;
        3'b101:new_address_7 = b5;
        3'b110:new_address_7 = b6;
        3'b111:new_address_7 = b7;
        default:new_address_7 = b0;
      endcase
    end
endmodule