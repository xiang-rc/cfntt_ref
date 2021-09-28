module address_generator(
    input [5:0] k,//max = 63
    input [5:0] i,//max = 63
    input [3:0] p,//max = 9
    output wire [9:0] old_address_0,old_address_1,old_address_2,
    output wire [9:0] old_address_3,old_address_4,old_address_5,
    output wire [9:0] old_address_6,old_address_7,old_address_8,
    output wire [9:0] old_address_9,old_address_10,old_address_11,
    output wire [9:0] old_address_12,old_address_13,old_address_14,
    output wire [9:0] old_address_15);

    reg [9:0] old_address_0_reg,old_address_1_reg,old_address_2_reg;
    reg [9:0] old_address_3_reg,old_address_4_reg,old_address_5_reg;
    reg [9:0] old_address_6_reg,old_address_7_reg,old_address_8_reg;
    reg [9:0] old_address_9_reg,old_address_10_reg,old_address_11_reg;
    reg [9:0] old_address_12_reg,old_address_13_reg,old_address_14_reg;
    reg [9:0] old_address_15_reg;
    
    wire [9:0] k_ext;
    wire [9:0] J;
    wire [9:0] base_addr;
    
    assign old_address_0 = old_address_0_reg;
    assign old_address_1 = old_address_1_reg;
    assign old_address_2 = old_address_2_reg;
    assign old_address_3 = old_address_3_reg;
    assign old_address_4 = old_address_4_reg;
    assign old_address_5 = old_address_5_reg;
    assign old_address_6 = old_address_6_reg;
    assign old_address_7 = old_address_7_reg;
    assign old_address_8 = old_address_8_reg;
    assign old_address_9 = old_address_9_reg;
    assign old_address_10 = old_address_10_reg;
    assign old_address_11 = old_address_11_reg;
    assign old_address_12 = old_address_12_reg;
    assign old_address_13 = old_address_13_reg;
    assign old_address_14 = old_address_14_reg;
    assign old_address_15 = old_address_15_reg;
    
    assign k_ext = k << 4; //16k
    assign J = 1 << p; 
    assign base_addr = ((k << 1) << p) + (i << 3); //2kJ+8i
    
    always@(*)
    begin
      if(p > 2)
        old_address_0_reg = base_addr;  //2kJ+8i
      else
        old_address_0_reg = k_ext;  //16k
    end
    
    always@(*)
    begin
      if(p == 0)
        old_address_2_reg = k_ext + 2;  //16k+2
      else if(p == 1)
        old_address_2_reg = k_ext + 1;  //16k+1
      else if(p == 2)
        old_address_2_reg = k_ext + 1; //16k+1
      else
        old_address_2_reg = base_addr + 1; //2kJ+8i+1
    end
    
    always@(*)
    begin
      if(p == 0)
        old_address_4_reg = k_ext + 4;
      else if(p == 1)
        old_address_4_reg = k_ext + 4;
      else if(p == 2)
        old_address_4_reg = k_ext + 2;
      else
        old_address_4_reg = base_addr + 2;
    end
    
    always@(*)
    begin
      if(p == 0)
        old_address_6_reg = k_ext + 6;
      else if(p == 1)
        old_address_6_reg = k_ext + 5;
      else if(p == 2)
        old_address_6_reg = k_ext + 3;
      else
        old_address_6_reg = base_addr + 3;
    end
    
    always@(*)
    begin
      if(p < 3)
        old_address_8_reg = k_ext + 8;
      else
        old_address_8_reg = base_addr + 4;
    end
    
    always@(*)
    begin
      if(p == 0)
        old_address_10_reg = k_ext + 10;
      else if(p == 1)
        old_address_10_reg = k_ext + 9;
      else if(p == 2)
        old_address_10_reg = k_ext + 9;
      else
        old_address_10_reg = base_addr + 5;
    end
    
    always@(*)
    begin
      if(p == 0)
        old_address_12_reg = k_ext + 12;
      else if(p == 1)
        old_address_12_reg = k_ext + 12;
      else if(p == 2)
        old_address_12_reg = k_ext + 10;
      else
        old_address_12_reg = base_addr + 6;
    end
    
    always@(*)
    begin
      if(p == 0)
        old_address_14_reg = k_ext + 14;
      else if(p == 1)
        old_address_14_reg = k_ext + 13;
      else if(p == 2)
        old_address_14_reg = k_ext + 11;
      else
        old_address_14_reg = base_addr + 7;
    end
    
    always@(*)
    begin
      case(p)
      0: old_address_1_reg = k_ext + 1;
      1: old_address_1_reg = k_ext + 2;
      2: old_address_1_reg = k_ext + 4;
      3: old_address_1_reg = {old_address_0_reg[9:4],1'b1,old_address_0_reg[2:0]};//J=2^3
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
      2: old_address_3_reg = k_ext + 5;
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
      2: old_address_5_reg = k_ext + 6;
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
      2: old_address_7_reg = k_ext + 7;
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
    
    always@(*)
      begin
      case(p)
      0: old_address_9_reg = k_ext + 9;
      1: old_address_9_reg = k_ext + 10;
      2: old_address_9_reg = k_ext + 12;
      3: old_address_9_reg = {old_address_8_reg[9:4],1'b1,old_address_8_reg[2:0]};
      4: old_address_9_reg = {old_address_8_reg[9:5],1'b1,old_address_8_reg[3:0]};
      5: old_address_9_reg = {old_address_8_reg[9:6],1'b1,old_address_8_reg[4:0]};
      6: old_address_9_reg = {old_address_8_reg[9:7],1'b1,old_address_8_reg[5:0]};
      7: old_address_9_reg = {old_address_8_reg[9:8],1'b1,old_address_8_reg[6:0]};
      8: old_address_9_reg = {old_address_8_reg[9],1'b1,old_address_8_reg[7:0]};
      9: old_address_9_reg = {1'b1,old_address_8_reg[8:0]};
      default: old_address_9_reg = 0;
      endcase
    end
    
      always@(*)
      begin
      case(p)
      0: old_address_11_reg = k_ext + 9;
      1: old_address_11_reg = k_ext + 10;
      2: old_address_11_reg = k_ext + 12;
      3: old_address_11_reg = {old_address_10_reg[9:4],1'b1,old_address_10_reg[2:0]};
      4: old_address_11_reg = {old_address_10_reg[9:5],1'b1,old_address_10_reg[3:0]};
      5: old_address_11_reg = {old_address_10_reg[9:6],1'b1,old_address_10_reg[4:0]};
      6: old_address_11_reg = {old_address_10_reg[9:7],1'b1,old_address_10_reg[5:0]};
      7: old_address_11_reg = {old_address_10_reg[9:8],1'b1,old_address_10_reg[6:0]};
      8: old_address_11_reg = {old_address_10_reg[9],1'b1,old_address_10_reg[7:0]};
      9: old_address_11_reg = {1'b1,old_address_10_reg[8:0]};
      default: old_address_11_reg = 0;
      endcase
    end
    
      always@(*)
      begin
      case(p)
      0: old_address_13_reg = k_ext + 13;
      1: old_address_13_reg = k_ext + 14;
      2: old_address_13_reg = k_ext + 14;
      3: old_address_13_reg = {old_address_12_reg[9:4],1'b1,old_address_12_reg[2:0]};
      4: old_address_13_reg = {old_address_12_reg[9:5],1'b1,old_address_12_reg[3:0]};
      5: old_address_13_reg = {old_address_12_reg[9:6],1'b1,old_address_12_reg[4:0]};
      6: old_address_13_reg = {old_address_12_reg[9:7],1'b1,old_address_12_reg[5:0]};
      7: old_address_13_reg = {old_address_12_reg[9:8],1'b1,old_address_12_reg[6:0]};
      8: old_address_13_reg = {old_address_12_reg[9],1'b1,old_address_12_reg[7:0]};
      9: old_address_13_reg = {1'b1,old_address_12_reg[8:0]};
      default: old_address_13_reg = 0;
      endcase
    end 
    
    always@(*)
      begin
      case(p)
      0: old_address_15_reg = k_ext + 15;
      1: old_address_15_reg = k_ext + 15;
      2: old_address_15_reg = k_ext + 15;
      3: old_address_15_reg = {old_address_14_reg[9:4],1'b1,old_address_14_reg[2:0]};
      4: old_address_15_reg = {old_address_14_reg[9:5],1'b1,old_address_14_reg[3:0]};
      5: old_address_15_reg = {old_address_14_reg[9:6],1'b1,old_address_14_reg[4:0]};
      6: old_address_15_reg = {old_address_14_reg[9:7],1'b1,old_address_14_reg[5:0]};
      7: old_address_15_reg = {old_address_14_reg[9:8],1'b1,old_address_14_reg[6:0]};
      8: old_address_15_reg = {old_address_14_reg[9],1'b1,old_address_14_reg[7:0]};
      9: old_address_15_reg = {1'b1,old_address_14_reg[8:0]};
      default: old_address_15_reg = 0;
      endcase
   end
endmodule
