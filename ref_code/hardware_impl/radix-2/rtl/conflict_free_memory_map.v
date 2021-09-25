module conflict_free_memory_map(
    input clk,rst,
    input [9:0] old_address_0,
    input [9:0] old_address_1,
    output wire [8:0] new_address_0,
    output wire [8:0] new_address_1,
    output wire bank_number_0,
    output wire bank_number_1);
   
   wire [8:0] new_address_0_tmp,new_address_1_tmp;
   wire bank_number_0_tmp,bank_number_1_tmp;
    
   assign bank_number_0_tmp = old_address_0[9] ^ old_address_0[8] ^ old_address_0[7]
                            ^ old_address_0[6]^ old_address_0[5] ^ old_address_0[4] 
                            ^ old_address_0[3] ^ old_address_0[2] ^ old_address_0[1] ^ old_address_0[0]; 
   assign new_address_0_tmp = old_address_0 >> 1;
   
   assign bank_number_1_tmp = old_address_1[9] ^ old_address_1[8] ^ old_address_1[7] 
                            ^ old_address_1[6]^ old_address_1[5] ^ old_address_1[4] 
                            ^ old_address_1[3] ^ old_address_1[2] ^ old_address_1[1] ^ old_address_1[0]; 
   assign new_address_1_tmp = old_address_1 >> 1;
   
   DFF #(.data_width(1)) m0(.clk(clk),.rst(rst),.d(bank_number_0_tmp),.q(bank_number_0));
   DFF #(.data_width(1)) m1(.clk(clk),.rst(rst),.d(bank_number_1_tmp),.q(bank_number_1));
   
   DFF #(.data_width(9)) n0(.clk(clk),.rst(rst),.d(new_address_0_tmp),.q(new_address_0));
   DFF #(.data_width(9)) n1(.clk(clk),.rst(rst),.d(new_address_1_tmp),.q(new_address_1));

endmodule