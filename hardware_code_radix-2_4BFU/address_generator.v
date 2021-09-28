module address_generator(
    input [6:0] k,//max = 127
    input [6:0] i,//max = 127
    input [3:0] p,//max = 9
    output wire [9:0] old_address_0,old_address_1,old_address_2,
    output wire [9:0] old_address_3,old_address_4,old_address_5,
    output wire [9:0] old_address_6,old_address_7);

    reg [9:0] old_address_0_reg,old_address_1_reg,old_address_2_reg;
    reg [9:0] old_address_3_reg,old_address_4_reg,old_address_5_reg;
    reg [9:0] old_address_6_reg,old_address_7_reg;
    
    wire [9:0] k_ext;
    wire [9:0] J;
    wire [9:0] base_addr;
    
    assign k_ext = k << 3;
    assign J = 1 << p;
    assign base_addr = ((k << 1) << p) + (i << 2);
    
    always@(*)
    begin
      if(p > 1)
        old_address_0_reg = base_addr;
      else
        old_address_0_reg = k_ext;
    end
    
    always@(*)
    begin
      if(p == 0)
        old_address_2_reg = k_ext + 2;
      else if(p == 1)
        old_address_2_reg = k_ext + 1;
      else
        old_address_2_reg = base_addr + 1;
    end
    
    always@(*)
    begin
      if(p > 1)
        old_address_4_reg = base_addr + 2;
      else
        old_address_4_reg = k_ext + 4;
    end
    
    always@(*)
    begin
      if(p == 0)
        old_address_6_reg = k_ext + 6;
      else if(p == 1)
        old_address_6_reg = k_ext + 5;
      else
        old_address_6_reg = base_addr + 3;
    end
    
    always@(*)
    begin
      case(p)
      0: old_address_1_reg = k_ext + 1;
      1: old_address_1_reg = k_ext + 2;
      2: old_address_1_reg = {old_address_0_reg[9:3],1'b1,old_address_0_reg[1:0]};
      3: old_address_1_reg = {old_address_0_reg[9:4],1'b1,old_address_0_reg[2:0]};
      4: old_address_1_reg = {old_address_0_reg[9:5],1'b1,old_address_0_reg[3:0]};
      5: old_address_1_reg = {old_address_0_reg[9:6],1'b1,old_address_0_reg[4:0]};
      6: old_address_1_reg = {old_address_0_reg[9:7],1'b1,old_address_0_reg[5:0]};
      7: old_address_1_reg = {old_address_0_reg[9:8],1'b1,old_address_0_reg[6:0]};
      8: old_address_1_reg = {old_address_0_reg[9],1'b1,old_address_0_reg[7:0]};
      9: old_address_1_reg = {1'b1,old_address_0_reg[8:0]};
      default: old_address_1_reg = 0;
      endcase
    end
    
    always@(*)
    begin
      case(p)
      0: old_address_3_reg = k_ext + 3;
      1: old_address_3_reg = k_ext + 3;
      2: old_address_3_reg = {old_address_2_reg[9:3],1'b1,old_address_2_reg[1:0]};
      3: old_address_3_reg = {old_address_2_reg[9:4],1'b1,old_address_2_reg[2:0]};
      4: old_address_3_reg = {old_address_2_reg[9:5],1'b1,old_address_2_reg[3:0]};
      5: old_address_3_reg = {old_address_2_reg[9:6],1'b1,old_address_2_reg[4:0]};
      6: old_address_3_reg = {old_address_2_reg[9:7],1'b1,old_address_2_reg[5:0]};
      7: old_address_3_reg = {old_address_2_reg[9:8],1'b1,old_address_2_reg[6:0]};
      8: old_address_3_reg = {old_address_2_reg[9],1'b1,old_address_2_reg[7:0]};
      9: old_address_3_reg = {1'b1,old_address_2_reg[8:0]};
      default: old_address_3_reg = 0;
      endcase
    end
    
    always@(*)
    begin
      case(p)
      0: old_address_5_reg = k_ext + 5;
      1: old_address_5_reg = k_ext + 6;
      2: old_address_5_reg = {old_address_4_reg[9:3],1'b1,old_address_4_reg[1:0]};
      3: old_address_5_reg = {old_address_4_reg[9:4],1'b1,old_address_4_reg[2:0]};
      4: old_address_5_reg = {old_address_4_reg[9:5],1'b1,old_address_4_reg[3:0]};
      5: old_address_5_reg = {old_address_4_reg[9:6],1'b1,old_address_4_reg[4:0]};
      6: old_address_5_reg = {old_address_4_reg[9:7],1'b1,old_address_4_reg[5:0]};
      7: old_address_5_reg = {old_address_4_reg[9:8],1'b1,old_address_4_reg[6:0]};
      8: old_address_5_reg = {old_address_4_reg[9],1'b1,old_address_4_reg[7:0]};
      9: old_address_5_reg = {1'b1,old_address_4_reg[8:0]};
      default: old_address_5_reg = 0;
      endcase
    end
    
    always@(*)
    begin
      case(p)
      0: old_address_7_reg = k_ext + 7;
      1: old_address_7_reg = k_ext + 7;
      2: old_address_7_reg = {old_address_6_reg[9:3],1'b1,old_address_6_reg[1:0]};
      3: old_address_7_reg = {old_address_6_reg[9:4],1'b1,old_address_6_reg[2:0]};
      4: old_address_7_reg = {old_address_6_reg[9:5],1'b1,old_address_6_reg[3:0]};
      5: old_address_7_reg = {old_address_6_reg[9:6],1'b1,old_address_6_reg[4:0]};
      6: old_address_7_reg = {old_address_6_reg[9:7],1'b1,old_address_6_reg[5:0]};
      7: old_address_7_reg = {old_address_6_reg[9:8],1'b1,old_address_6_reg[6:0]};
      8: old_address_7_reg = {old_address_6_reg[9],1'b1,old_address_6_reg[7:0]};
      9: old_address_7_reg = {1'b1,old_address_6_reg[8:0]};
      default: old_address_7_reg = 0;
      endcase
    end
endmodule
