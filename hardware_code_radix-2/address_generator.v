module address_generator(
    input [8:0] k,//max = 511
    input [8:0] i,//max = 511
	input [3:0] p,//max = 9
    output wire [9:0] old_address_0,old_address_1);
    
    reg [9:0] old_address_1_reg;
    
    assign old_address_1 = old_address_1_reg;
  
    assign old_address_0 = ((k << 1) << p) + i; 
    
    always@(*)
    begin
      case(p)
      0: old_address_1_reg = {old_address_0[9:1],1'b1};
      1: old_address_1_reg = {old_address_0[9:2],1'b1,old_address_0[0]};
      2: old_address_1_reg = {old_address_0[9:3],1'b1,old_address_0[1:0]};
      3: old_address_1_reg = {old_address_0[9:4],1'b1,old_address_0[2:0]};
      4: old_address_1_reg = {old_address_0[9:5],1'b1,old_address_0[3:0]};
      5: old_address_1_reg = {old_address_0[9:6],1'b1,old_address_0[4:0]};
      6: old_address_1_reg = {old_address_0[9:7],1'b1,old_address_0[5:0]};
      7: old_address_1_reg = {old_address_0[9:8],1'b1,old_address_0[6:0]};
      8: old_address_1_reg = {old_address_0[9],1'b1,old_address_0[7:0]};
      9: old_address_1_reg = {1'b1,old_address_0[8:0]};
      default: old_address_1_reg = 0;
      endcase
    end
    
endmodule