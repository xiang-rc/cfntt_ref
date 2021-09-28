module conflict_free_memory_map(
    input clk,rst,
    input [9:0] old_address_0,
    input [9:0] old_address_1,
    input [9:0] old_address_2,
    input [9:0] old_address_3,
    input [9:0] old_address_4,
    input [9:0] old_address_5,
    input [9:0] old_address_6,
    input [9:0] old_address_7,
    input [9:0] old_address_8,
    input [9:0] old_address_9,
    input [9:0] old_address_10,
    input [9:0] old_address_11,
    input [9:0] old_address_12,
    input [9:0] old_address_13,
    input [9:0] old_address_14,
    input [9:0] old_address_15,
    
    output wire [5:0] new_address_0,
    output wire [5:0] new_address_1,
    output wire [5:0] new_address_2,
    output wire [5:0] new_address_3,
    output wire [5:0] new_address_4,
    output wire [5:0] new_address_5,
    output wire [5:0] new_address_6,
    output wire [5:0] new_address_7,
    output wire [5:0] new_address_8,
    output wire [5:0] new_address_9,
    output wire [5:0] new_address_10,
    output wire [5:0] new_address_11,
    output wire [5:0] new_address_12,
    output wire [5:0] new_address_13,
    output wire [5:0] new_address_14,
    output wire [5:0] new_address_15,
    
    output wire [3:0] bank_number_0,
    output wire [3:0] bank_number_1,
    output wire [3:0] bank_number_2,
    output wire [3:0] bank_number_3,
    output wire [3:0] bank_number_4,
    output wire [3:0] bank_number_5,
    output wire [3:0] bank_number_6,
    output wire [3:0] bank_number_7,
    output wire [3:0] bank_number_8,
    output wire [3:0] bank_number_9,
    output wire [3:0] bank_number_10,
    output wire [3:0] bank_number_11,
    output wire [3:0] bank_number_12,
    output wire [3:0] bank_number_13,
    output wire [3:0] bank_number_14,
    output wire [3:0] bank_number_15);
   
   wire sel0,sel1,sel2,sel3,sel4,sel5,sel6,sel7;
   wire sel8,sel9,sel10,sel11,sel12,sel13,sel14,sel15;
   
   wire [5:0] new_address_0_tmp,new_address_1_tmp,new_address_2_tmp,new_address_3_tmp;
   wire [5:0] new_address_4_tmp,new_address_5_tmp,new_address_6_tmp,new_address_7_tmp;
   wire [5:0] new_address_8_tmp,new_address_9_tmp,new_address_10_tmp,new_address_11_tmp;
   wire [5:0] new_address_12_tmp,new_address_13_tmp,new_address_14_tmp,new_address_15_tmp;
   
   wire [3:0] bank_number_0_tmp,bank_number_1_tmp,bank_number_2_tmp,bank_number_3_tmp;
   wire [3:0] bank_number_4_tmp,bank_number_5_tmp,bank_number_6_tmp,bank_number_7_tmp;
   wire [3:0] bank_number_8_tmp,bank_number_9_tmp,bank_number_10_tmp,bank_number_11_tmp;
   wire [3:0] bank_number_12_tmp,bank_number_13_tmp,bank_number_14_tmp,bank_number_15_tmp;
    
   assign sel0 = old_address_0[9] ^ old_address_0[8] ^ old_address_0[7] ^ old_address_0[6]^ old_address_0[5] ^ old_address_0[4];
   assign bank_number_0_tmp = sel0 == 1'b0 ? old_address_0[3:0] : {~old_address_0[3],old_address_0[2:0]}; 
   assign new_address_0_tmp = old_address_0 >> 4;
   
   assign sel1 = old_address_1[9] ^ old_address_1[8] ^ old_address_1[7] ^ old_address_1[6]^ old_address_1[5] ^ old_address_1[4];
   assign bank_number_1_tmp = sel1 == 1'b0 ? old_address_1[3:0] : {~old_address_1[3],old_address_1[2:0]}; 
   assign new_address_1_tmp = old_address_1 >> 4;
   
   assign sel2 = old_address_2[9] ^ old_address_2[8] ^ old_address_2[7] ^ old_address_2[6]^ old_address_2[5] ^ old_address_2[4];
   assign bank_number_2_tmp = sel2 == 1'b0 ? old_address_2[3:0] : {~old_address_2[3],old_address_2[2:0]}; 
   assign new_address_2_tmp = old_address_2 >> 4;
   
   assign sel3 = old_address_3[9] ^ old_address_3[8] ^ old_address_3[7] ^ old_address_3[6]^ old_address_3[5] ^ old_address_3[4];
   assign bank_number_3_tmp = sel3 == 1'b0 ? old_address_3[3:0] : {~old_address_3[3],old_address_3[2:0]};
   assign new_address_3_tmp = old_address_3 >> 4; 
                      
   assign sel4 = old_address_4[9] ^ old_address_4[8] ^ old_address_4[7] ^ old_address_4[6]^ old_address_4[5] ^ old_address_4[4];
   assign bank_number_4_tmp = sel4 == 1'b0 ? old_address_4[3:0] : {~old_address_4[3],old_address_4[2:0]};  
   assign new_address_4_tmp = old_address_4 >> 4;  
   
   assign sel5 = old_address_5[9] ^ old_address_5[8] ^ old_address_5[7] ^ old_address_5[6]^ old_address_5[5] ^ old_address_5[4];
   assign bank_number_5_tmp = sel5 == 1'b0 ? old_address_5[3:0] : {~old_address_5[3],old_address_5[2:0]};  
   assign new_address_5_tmp = old_address_5 >> 4;  
   
   assign sel6 = old_address_6[9] ^ old_address_6[8] ^ old_address_6[7] ^ old_address_6[6]^ old_address_6[5] ^ old_address_6[4];
   assign bank_number_6_tmp = sel6 == 1'b0 ? old_address_6[3:0] : {~old_address_6[3],old_address_6[2:0]};   
   assign new_address_6_tmp = old_address_6 >> 4;           
   
   assign sel7 = old_address_7[9] ^ old_address_7[8] ^ old_address_7[7] ^ old_address_7[6]^ old_address_7[5] ^ old_address_7[4];
   assign bank_number_7_tmp = sel7 == 1'b0 ? old_address_7[3:0] : {~old_address_7[3],old_address_7[2:0]}; 
   assign new_address_7_tmp = old_address_7 >> 4;
   
   assign sel8 = old_address_8[9] ^ old_address_8[8] ^ old_address_8[7] ^ old_address_8[6]^ old_address_8[5] ^ old_address_8[4];
   assign bank_number_8_tmp = sel8 == 1'b0 ? old_address_8[3:0] : {~old_address_8[3],old_address_8[2:0]}; 
   assign new_address_8_tmp = old_address_8 >> 4;
   
   assign sel9 = old_address_9[9] ^ old_address_9[8] ^ old_address_9[7] ^ old_address_9[6]^ old_address_9[5] ^ old_address_9[4];
   assign bank_number_9_tmp = sel9 == 1'b0 ? old_address_9[3:0] : {~old_address_9[3],old_address_9[2:0]}; 
   assign new_address_9_tmp = old_address_9 >> 4;
   
   assign sel10 = old_address_10[9] ^ old_address_10[8] ^ old_address_10[7] ^ old_address_10[6]^ old_address_10[5] ^ old_address_10[4];
   assign bank_number_10_tmp = sel10 == 1'b0 ? old_address_10[3:0] : {~old_address_10[3],old_address_10[2:0]}; 
   assign new_address_10_tmp = old_address_10 >> 4;
   
   assign sel11 = old_address_11[9] ^ old_address_11[8] ^ old_address_11[7] ^ old_address_11[6]^ old_address_11[5] ^ old_address_11[4];
   assign bank_number_11_tmp = sel11 == 1'b0 ? old_address_11[3:0] : {~old_address_11[3],old_address_11[2:0]}; 
   assign new_address_11_tmp = old_address_11 >> 4;
   
   assign sel12 = old_address_12[9] ^ old_address_12[8] ^ old_address_12[7] ^ old_address_12[6]^ old_address_12[5] ^ old_address_12[4];
   assign bank_number_12_tmp = sel12 == 1'b0 ? old_address_12[3:0] : {~old_address_12[3],old_address_12[2:0]}; 
   assign new_address_12_tmp = old_address_12 >> 4;
   
   assign sel13 = old_address_13[9] ^ old_address_13[8] ^ old_address_13[7] ^ old_address_13[6]^ old_address_13[5] ^ old_address_13[4];
   assign bank_number_13_tmp = sel13 == 1'b0 ? old_address_13[3:0] : {~old_address_13[3],old_address_13[2:0]}; 
   assign new_address_13_tmp = old_address_13 >> 4;
   
   assign sel14 = old_address_14[9] ^ old_address_14[8] ^ old_address_14[7] ^ old_address_14[6]^ old_address_14[5] ^ old_address_14[4];
   assign bank_number_14_tmp = sel14 == 1'b0 ? old_address_14[3:0] : {~old_address_14[3],old_address_14[2:0]}; 
   assign new_address_14_tmp = old_address_14 >> 4;
   
   assign sel15 = old_address_15[9] ^ old_address_15[8] ^ old_address_15[7] ^ old_address_15[6]^ old_address_15[5] ^ old_address_15[4];
   assign bank_number_15_tmp = sel15 == 1'b0 ? old_address_15[3:0] : {~old_address_15[3],old_address_15[2:0]}; 
   assign new_address_15_tmp = old_address_15 >> 4;
   
   DFF #(.data_width(4)) m0(.clk(clk),.rst(rst),.d(bank_number_0_tmp),.q(bank_number_0));
   DFF #(.data_width(4)) m1(.clk(clk),.rst(rst),.d(bank_number_1_tmp),.q(bank_number_1));
   DFF #(.data_width(4)) m2(.clk(clk),.rst(rst),.d(bank_number_2_tmp),.q(bank_number_2));
   DFF #(.data_width(4)) m3(.clk(clk),.rst(rst),.d(bank_number_3_tmp),.q(bank_number_3));
   DFF #(.data_width(4)) m4(.clk(clk),.rst(rst),.d(bank_number_4_tmp),.q(bank_number_4));
   DFF #(.data_width(4)) m5(.clk(clk),.rst(rst),.d(bank_number_5_tmp),.q(bank_number_5));
   DFF #(.data_width(4)) m6(.clk(clk),.rst(rst),.d(bank_number_6_tmp),.q(bank_number_6));
   DFF #(.data_width(4)) m7(.clk(clk),.rst(rst),.d(bank_number_7_tmp),.q(bank_number_7));
   DFF #(.data_width(4)) m8(.clk(clk),.rst(rst),.d(bank_number_8_tmp),.q(bank_number_8));
   DFF #(.data_width(4)) m9(.clk(clk),.rst(rst),.d(bank_number_9_tmp),.q(bank_number_9));
   DFF #(.data_width(4)) m10(.clk(clk),.rst(rst),.d(bank_number_10_tmp),.q(bank_number_10));
   DFF #(.data_width(4)) m11(.clk(clk),.rst(rst),.d(bank_number_11_tmp),.q(bank_number_11));
   DFF #(.data_width(4)) m12(.clk(clk),.rst(rst),.d(bank_number_12_tmp),.q(bank_number_12));
   DFF #(.data_width(4)) m13(.clk(clk),.rst(rst),.d(bank_number_13_tmp),.q(bank_number_13));
   DFF #(.data_width(4)) m14(.clk(clk),.rst(rst),.d(bank_number_14_tmp),.q(bank_number_14));
   DFF #(.data_width(4)) m15(.clk(clk),.rst(rst),.d(bank_number_15_tmp),.q(bank_number_15));
   
   DFF #(.data_width(6)) n0(.clk(clk),.rst(rst),.d(new_address_0_tmp),.q(new_address_0));
   DFF #(.data_width(6)) n1(.clk(clk),.rst(rst),.d(new_address_1_tmp),.q(new_address_1));
   DFF #(.data_width(6)) n2(.clk(clk),.rst(rst),.d(new_address_2_tmp),.q(new_address_2));
   DFF #(.data_width(6)) n3(.clk(clk),.rst(rst),.d(new_address_3_tmp),.q(new_address_3));
   DFF #(.data_width(6)) n4(.clk(clk),.rst(rst),.d(new_address_4_tmp),.q(new_address_4));
   DFF #(.data_width(6)) n5(.clk(clk),.rst(rst),.d(new_address_5_tmp),.q(new_address_5));
   DFF #(.data_width(6)) n6(.clk(clk),.rst(rst),.d(new_address_6_tmp),.q(new_address_6));
   DFF #(.data_width(6)) n7(.clk(clk),.rst(rst),.d(new_address_7_tmp),.q(new_address_7));
   DFF #(.data_width(6)) n8(.clk(clk),.rst(rst),.d(new_address_8_tmp),.q(new_address_8));
   DFF #(.data_width(6)) n9(.clk(clk),.rst(rst),.d(new_address_9_tmp),.q(new_address_9));
   DFF #(.data_width(6)) n10(.clk(clk),.rst(rst),.d(new_address_10_tmp),.q(new_address_10));
   DFF #(.data_width(6)) n11(.clk(clk),.rst(rst),.d(new_address_11_tmp),.q(new_address_11));
   DFF #(.data_width(6)) n12(.clk(clk),.rst(rst),.d(new_address_12_tmp),.q(new_address_12));
   DFF #(.data_width(6)) n13(.clk(clk),.rst(rst),.d(new_address_13_tmp),.q(new_address_13));
   DFF #(.data_width(6)) n14(.clk(clk),.rst(rst),.d(new_address_14_tmp),.q(new_address_14));
   DFF #(.data_width(6)) n15(.clk(clk),.rst(rst),.d(new_address_15_tmp),.q(new_address_15));
endmodule