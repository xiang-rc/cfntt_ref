module address_generator(
    input [7:0] k,
    input [7:0] j,
    input [2:0] p,
    output wire [9:0] old_address_0,old_address_1,old_address_2,
    output wire [9:0] old_address_3
    );
    
    reg [9:0] old_address_1_reg;
    reg [9:0] old_address_2_reg,old_address_3_reg;
    
    assign old_address_1 = old_address_1_reg;
    assign old_address_2 = old_address_2_reg;
    assign old_address_3 = old_address_3_reg;
    
    assign old_address_0 = ((k << 2) << (p << 1)) + j;
    
    always@(*)
    begin
      case(p)
      3'b100: old_address_1_reg = {old_address_0[9],1'b1,old_address_0[7:0]};
      3'b011: old_address_1_reg = {old_address_0[9:7],1'b1,old_address_0[5:0]};
      3'b010: old_address_1_reg = {old_address_0[9:5],1'b1,old_address_0[3:0]};
      3'b001: old_address_1_reg = {old_address_0[9:3],1'b1,old_address_0[1:0]};
      3'b000: old_address_1_reg = {old_address_0[9:1],1'b1};
      default: old_address_1_reg = old_address_0;
      endcase
    end
    
    always@(*)
    begin
      case(p)
      3'b100: old_address_2_reg = {1'b1,old_address_0[8:0]};
      3'b011: old_address_2_reg = {old_address_0[9:8],1'b1,old_address_0[6:0]};
      3'b010: old_address_2_reg = {old_address_0[9:6],1'b1,old_address_0[4:0]};
      3'b001: old_address_2_reg = {old_address_0[9:4],1'b1,old_address_0[2:0]};
      3'b000: old_address_2_reg = {old_address_0[9:2],1'b1,old_address_0[0]};
      default: old_address_2_reg = old_address_0;
      endcase
    end
    
    always@(*)
    begin
      case(p)
      3'b100: old_address_3_reg = {2'b11,old_address_0[7:0]};
      3'b011: old_address_3_reg = {old_address_0[9:8],2'b11,old_address_0[5:0]};
      3'b010: old_address_3_reg = {old_address_0[9:6],2'b11,old_address_0[3:0]};
      3'b001: old_address_3_reg = {old_address_0[9:4],2'b11,old_address_0[1:0]};
      3'b000: old_address_3_reg = {old_address_0[9:2],2'b11};
      default: old_address_3_reg = old_address_0;
      endcase
    end
    
    
endmodule