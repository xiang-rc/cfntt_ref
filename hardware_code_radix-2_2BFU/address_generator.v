module address_generator(
    input [7:0] k,//max = 255
    input [7:0] i,//max = 255
	input [3:0] p,//max = 9
    output wire [9:0] old_address_0,old_address_1,old_address_2,
    output wire [9:0] old_address_3);

    reg [9:0] old_address_0_reg,old_address_1_reg,old_address_2_reg;
    reg [9:0] old_address_3_reg;
    
    assign old_address_0 = old_address_0_reg;
    assign old_address_1 = old_address_1_reg;
    assign old_address_2 = old_address_2_reg;
    assign old_address_3 = old_address_3_reg;
    
    wire [9:0] k_ext;
    wire [9:0] base_addr;
    
    assign k_ext = k << 2;
    assign base_addr = ((k << 1) << p) + (i << 1);
    
    always@(*)
    begin
      if(p == 0)
        old_address_0_reg = k_ext;
      else
        old_address_0_reg = base_addr;
    end
    
    always@(*)
    begin
      if(p == 0)
        old_address_2_reg = k_ext + 2;
      else
        old_address_2_reg = base_addr + 1;
    end
    
    
    always@(*)
    begin
      case(p)
      0: old_address_1_reg = k_ext + 1;
      1: old_address_1_reg = {old_address_0_reg[9:2],1'b1,old_address_0_reg[0]};
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
      1: old_address_3_reg = {old_address_2_reg[9:2],1'b1,old_address_2_reg[0]};
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
    
endmodule