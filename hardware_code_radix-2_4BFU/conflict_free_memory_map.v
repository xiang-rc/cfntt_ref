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
    output wire [6:0] new_address_0,
    output wire [6:0] new_address_1,
    output wire [6:0] new_address_2,
    output wire [6:0] new_address_3,
    output wire [6:0] new_address_4,
    output wire [6:0] new_address_5,
    output wire [6:0] new_address_6,
    output wire [6:0] new_address_7,
    output wire [2:0] bank_number_0,
    output wire [2:0] bank_number_1,
    output wire [2:0] bank_number_2,
    output wire [2:0] bank_number_3,
    output wire [2:0] bank_number_4,
    output wire [2:0] bank_number_5,
    output wire [2:0] bank_number_6,
    output wire [2:0] bank_number_7);
   
   wire sel0,sel1,sel2,sel3,sel4,sel5,sel6,sel7;
   wire [6:0] new_address_0_tmp,new_address_1_tmp,new_address_2_tmp,new_address_3_tmp;
   wire [6:0] new_address_4_tmp,new_address_5_tmp,new_address_6_tmp,new_address_7_tmp;
   wire [2:0] bank_number_0_tmp,bank_number_1_tmp,bank_number_2_tmp,bank_number_3_tmp;
   wire [2:0] bank_number_4_tmp,bank_number_5_tmp,bank_number_6_tmp,bank_number_7_tmp;
    
   assign sel0 = old_address_0[9] ^ old_address_0[8] ^ old_address_0[7] ^ old_address_0[6]^ old_address_0[5] ^ old_address_0[4] ^ old_address_0[3];
   assign bank_number_0_tmp = sel0 == 1'b0 ? old_address_0[2:0] : {~old_address_0[2],old_address_0[1:0]}; 
   assign new_address_0_tmp = old_address_0 >> 3;
   
   assign sel1 = old_address_1[9] ^ old_address_1[8] ^ old_address_1[7] ^ old_address_1[6]^ old_address_1[5] ^ old_address_1[4] ^ old_address_1[3];
   assign bank_number_1_tmp = sel1 == 1'b0 ? old_address_1[2:0] : {~old_address_1[2],old_address_1[1:0]}; 
   assign new_address_1_tmp = old_address_1 >> 3;
   
   assign sel2 = old_address_2[9] ^ old_address_2[8] ^ old_address_2[7] ^ old_address_2[6]^ old_address_2[5] ^ old_address_2[4] ^ old_address_2[3];
   assign bank_number_2_tmp = sel2 == 1'b0 ? old_address_2[2:0] : {~old_address_2[2],old_address_2[1:0]}; 
   assign new_address_2_tmp = old_address_2 >> 3;
   
   assign sel3 = old_address_3[9] ^ old_address_3[8] ^ old_address_3[7] ^ old_address_3[6]^ old_address_3[5] ^ old_address_3[4] ^ old_address_3[3];
   assign bank_number_3_tmp = sel3 == 1'b0 ? old_address_3[2:0] : {~old_address_3[2],old_address_3[1:0]};
   assign new_address_3_tmp = old_address_3 >> 3; 
                      
   assign sel4 = old_address_4[9] ^ old_address_4[8] ^ old_address_4[7] ^ old_address_4[6]^ old_address_4[5] ^ old_address_4[4] ^ old_address_4[3];
   assign bank_number_4_tmp = sel4 == 1'b0 ? old_address_4[2:0] : {~old_address_4[2],old_address_4[1:0]};  
   assign new_address_4_tmp = old_address_4 >> 3;  
   
   assign sel5 = old_address_5[9] ^ old_address_5[8] ^ old_address_5[7] ^ old_address_5[6]^ old_address_5[5] ^ old_address_5[4] ^ old_address_5[3];
   assign bank_number_5_tmp = sel5 == 1'b0 ? old_address_5[2:0] : {~old_address_5[2],old_address_5[1:0]};  
   assign new_address_5_tmp = old_address_5 >> 3;  
   
   assign sel6 = old_address_6[9] ^ old_address_6[8] ^ old_address_6[7] ^ old_address_6[6]^ old_address_6[5] ^ old_address_6[4] ^ old_address_6[3];
   assign bank_number_6_tmp = sel6 == 1'b0 ? old_address_6[2:0] : {~old_address_6[2],old_address_6[1:0]};   
   assign new_address_6_tmp = old_address_6 >> 3;           
   
   assign sel7 = old_address_7[9] ^ old_address_7[8] ^ old_address_7[7] ^ old_address_7[6]^ old_address_7[5] ^ old_address_7[4] ^ old_address_7[3];
   assign bank_number_7_tmp = sel7 == 1'b0 ? old_address_7[2:0] : {~old_address_7[2],old_address_7[1:0]}; 
   assign new_address_7_tmp = old_address_7 >> 3;
   
   DFF #(.data_width(3)) m0(.clk(clk),.rst(rst),.d(bank_number_0_tmp),.q(bank_number_0));
   DFF #(.data_width(3)) m1(.clk(clk),.rst(rst),.d(bank_number_1_tmp),.q(bank_number_1));
   DFF #(.data_width(3)) m2(.clk(clk),.rst(rst),.d(bank_number_2_tmp),.q(bank_number_2));
   DFF #(.data_width(3)) m3(.clk(clk),.rst(rst),.d(bank_number_3_tmp),.q(bank_number_3));
   DFF #(.data_width(3)) m4(.clk(clk),.rst(rst),.d(bank_number_4_tmp),.q(bank_number_4));
   DFF #(.data_width(3)) m5(.clk(clk),.rst(rst),.d(bank_number_5_tmp),.q(bank_number_5));
   DFF #(.data_width(3)) m6(.clk(clk),.rst(rst),.d(bank_number_6_tmp),.q(bank_number_6));
   DFF #(.data_width(3)) m7(.clk(clk),.rst(rst),.d(bank_number_7_tmp),.q(bank_number_7));
   
   DFF #(.data_width(7)) n0(.clk(clk),.rst(rst),.d(new_address_0_tmp),.q(new_address_0));
   DFF #(.data_width(7)) n1(.clk(clk),.rst(rst),.d(new_address_1_tmp),.q(new_address_1));
   DFF #(.data_width(7)) n2(.clk(clk),.rst(rst),.d(new_address_2_tmp),.q(new_address_2));
   DFF #(.data_width(7)) n3(.clk(clk),.rst(rst),.d(new_address_3_tmp),.q(new_address_3));
   DFF #(.data_width(7)) n4(.clk(clk),.rst(rst),.d(new_address_4_tmp),.q(new_address_4));
   DFF #(.data_width(7)) n5(.clk(clk),.rst(rst),.d(new_address_5_tmp),.q(new_address_5));
   DFF #(.data_width(7)) n6(.clk(clk),.rst(rst),.d(new_address_6_tmp),.q(new_address_6));
   DFF #(.data_width(7)) n7(.clk(clk),.rst(rst),.d(new_address_7_tmp),.q(new_address_7));
endmodule