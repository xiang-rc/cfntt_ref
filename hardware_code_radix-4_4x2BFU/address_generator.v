module address_generator(
    input [6:0] k,
    input [6:0] j,
    input [2:0] p,
    output wire [9:0] old_address_0,old_address_1,old_address_2,
    output wire [9:0] old_address_3,
    output wire [9:0] old_address_4,old_address_5,old_address_6,
    output wire [9:0] old_address_7
    );
    
    reg [9:0] old_address_0_reg;
    reg [9:0] old_address_1_reg;
    reg [9:0] old_address_2_reg;
    reg [9:0] old_address_3_reg;
    reg [9:0] old_address_4_reg;
    reg [9:0] old_address_5_reg;
    reg [9:0] old_address_6_reg;
    reg [9:0] old_address_7_reg;
    
    assign old_address_0 = old_address_0_reg;
    assign old_address_1 = old_address_1_reg;
    assign old_address_2 = old_address_2_reg;
    assign old_address_3 = old_address_3_reg;
    assign old_address_4 = old_address_4_reg;
    assign old_address_5 = old_address_5_reg;
    assign old_address_6 = old_address_6_reg;
    assign old_address_7 = old_address_7_reg;
    
    always@(*)
    begin
      if(p == 0)
        old_address_0_reg = k << 3;
      else
        old_address_0_reg = ((k << 2) << (p << 1)) + j;
    end
    
    always@(*)
    begin
      if(p == 0)
        old_address_4_reg = (k << 3) + 4;
      else
        old_address_4_reg = ((k << 2) << (p << 1)) + j + 1;
    end
    
    always@(*)
    begin
      case(p)
      3'b100: old_address_1_reg = {old_address_0[9],1'b1,old_address_0[7:0]};
      3'b011: old_address_1_reg = {old_address_0[9:7],1'b1,old_address_0[5:0]};
      3'b010: old_address_1_reg = {old_address_0[9:5],1'b1,old_address_0[3:0]};
      3'b001: old_address_1_reg = {old_address_0[9:3],1'b1,old_address_0[1:0]};
      3'b000: old_address_1_reg = (k << 3) + 1;
      default: old_address_1_reg = 0;
      endcase
    end
    
    always@(*)
    begin
      case(p)
      3'b100: old_address_2_reg = {1'b1,old_address_0[8:0]};
      3'b011: old_address_2_reg = {old_address_0[9:8],1'b1,old_address_0[6:0]};
      3'b010: old_address_2_reg = {old_address_0[9:6],1'b1,old_address_0[4:0]};
      3'b001: old_address_2_reg = {old_address_0[9:4],1'b1,old_address_0[2:0]};
      3'b000: old_address_2_reg = (k << 3) + 2;
      default: old_address_2_reg = 0;
      endcase
    end
    
    always@(*)
    begin
      case(p)
      3'b100: old_address_3_reg = {2'b11,old_address_0[7:0]};
      3'b011: old_address_3_reg = {old_address_0[9:8],2'b11,old_address_0[5:0]};
      3'b010: old_address_3_reg = {old_address_0[9:6],2'b11,old_address_0[3:0]};
      3'b001: old_address_3_reg = {old_address_0[9:4],2'b11,old_address_0[1:0]};
      3'b000: old_address_3_reg = (k << 3) + 3;
      default: old_address_3_reg = 0;
      endcase
    end
    
    always@(*)
    begin
      case(p)
      3'b100: old_address_5_reg = {old_address_4[9],1'b1,old_address_4[7:0]};
      3'b011: old_address_5_reg = {old_address_4[9:7],1'b1,old_address_4[5:0]};
      3'b010: old_address_5_reg = {old_address_4[9:5],1'b1,old_address_4[3:0]};
      3'b001: old_address_5_reg = {old_address_4[9:3],1'b1,old_address_4[1:0]};
      3'b000: old_address_5_reg = (k << 3) + 5;
      default: old_address_5_reg = 0;
      endcase
    end
    
    always@(*)
    begin
      case(p)
      3'b100: old_address_6_reg = {1'b1,old_address_4[8:0]};
      3'b011: old_address_6_reg = {old_address_4[9:8],1'b1,old_address_4[6:0]};
      3'b010: old_address_6_reg = {old_address_4[9:6],1'b1,old_address_4[4:0]};
      3'b001: old_address_6_reg = {old_address_4[9:4],1'b1,old_address_4[2:0]};
      3'b000: old_address_6_reg = (k << 3) + 6;
      default: old_address_6_reg = 0;
      endcase
    end
    
    always@(*)
    begin
      case(p)
      3'b100: old_address_7_reg = {2'b11,old_address_4[7:0]};
      3'b011: old_address_7_reg = {old_address_4[9:8],2'b11,old_address_4[5:0]};
      3'b010: old_address_7_reg = {old_address_4[9:6],2'b11,old_address_4[3:0]};
      3'b001: old_address_7_reg = {old_address_4[9:4],2'b11,old_address_4[1:0]};
      3'b000: old_address_7_reg = (k << 3) + 7;
      default: old_address_7_reg = 0;
      endcase
    end
endmodule