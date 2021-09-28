module conflict_free_memory_map(
    input clk,rst,
    input [9:0] old_address_0,
    input [9:0] old_address_1,
    input [9:0] old_address_2,
    input [9:0] old_address_3,
    output wire [7:0] new_address_0,
    output wire [7:0] new_address_1,
    output wire [7:0] new_address_2,
    output wire [7:0] new_address_3,
    output wire [1:0] bank_number_0,
    output wire [1:0] bank_number_1,
    output wire [1:0] bank_number_2,
    output wire [1:0] bank_number_3);
   
   wire sel0,sel1,sel2,sel3;
   wire [7:0] new_address_0_tmp,new_address_1_tmp,new_address_2_tmp,new_address_3_tmp;
   wire [1:0] bank_number_0_tmp,bank_number_1_tmp,bank_number_2_tmp,bank_number_3_tmp;
    
   assign sel0 = old_address_0[9] ^ old_address_0[8] ^ old_address_0[7] ^ old_address_0[6]^ old_address_0[5] ^ old_address_0[4] ^ old_address_0[3] ^ old_address_0[2];
   assign bank_number_0_tmp = sel0 == 1'b0 ? old_address_0[1:0] : {~old_address_0[1],old_address_0[0]}; 
   assign new_address_0_tmp = old_address_0 >> 2;
   
   assign sel1 = old_address_1[9] ^ old_address_1[8] ^ old_address_1[7] ^ old_address_1[6]^ old_address_1[5] ^ old_address_1[4] ^ old_address_1[3] ^ old_address_0[2];
   assign bank_number_1_tmp = sel1 == 1'b0 ? old_address_1[1:0] : {~old_address_1[1],old_address_1[0]}; 
   assign new_address_1_tmp = old_address_1 >> 2;
   
   assign sel2 = old_address_2[9] ^ old_address_2[8] ^ old_address_2[7] ^ old_address_2[6]^ old_address_2[5] ^ old_address_2[4] ^ old_address_2[3] ^ old_address_0[2];
   assign bank_number_2_tmp = sel2 == 1'b0 ? old_address_2[1:0] : {~old_address_2[1],old_address_2[0]}; 
   assign new_address_2_tmp = old_address_2 >> 2;
   
   assign sel3 = old_address_3[9] ^ old_address_3[8] ^ old_address_3[7] ^ old_address_3[6]^ old_address_3[5] ^ old_address_3[4] ^ old_address_3[3] ^ old_address_0[2];
   assign bank_number_3_tmp = sel3 == 1'b0 ? old_address_3[1:0] : {~old_address_3[1],old_address_3[0]};
   assign new_address_3_tmp = old_address_3 >> 2; 
   
   DFF #(.data_width(2)) m0(.clk(clk),.rst(rst),.d(bank_number_0_tmp),.q(bank_number_0));
   DFF #(.data_width(2)) m1(.clk(clk),.rst(rst),.d(bank_number_1_tmp),.q(bank_number_1));
   DFF #(.data_width(2)) m2(.clk(clk),.rst(rst),.d(bank_number_2_tmp),.q(bank_number_2));
   DFF #(.data_width(2)) m3(.clk(clk),.rst(rst),.d(bank_number_3_tmp),.q(bank_number_3));
   
   DFF #(.data_width(8)) n0(.clk(clk),.rst(rst),.d(new_address_0_tmp),.q(new_address_0));
   DFF #(.data_width(8)) n1(.clk(clk),.rst(rst),.d(new_address_1_tmp),.q(new_address_1));
   DFF #(.data_width(8)) n2(.clk(clk),.rst(rst),.d(new_address_2_tmp),.q(new_address_2));
   DFF #(.data_width(8)) n3(.clk(clk),.rst(rst),.d(new_address_3_tmp),.q(new_address_3));

endmodule