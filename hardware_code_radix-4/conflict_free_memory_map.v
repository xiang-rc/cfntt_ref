module conflict_free_memory_map(
    input clk,rst,
    input [9:0] old_address_0,
    input [9:0] old_address_1,
    input [9:0] old_address_2,
    input [9:0] old_address_3,
    // bank address for read
    output wire [7:0] new_address_0,
    output wire [7:0] new_address_1,
    output wire [7:0] new_address_2,
    output wire [7:0] new_address_3,

    //bank index
    output wire [1:0] bank_number_0,
    output wire [1:0] bank_number_1,
    output wire [1:0] bank_number_2,
    output wire [1:0] bank_number_3);
    
    wire [7:0] new_address_0_tmp;
    wire [7:0] new_address_1_tmp;
    wire [7:0] new_address_2_tmp;
    wire [7:0] new_address_3_tmp;
     
    assign new_address_0_tmp = old_address_0[9:2];    
    assign new_address_1_tmp = old_address_1[9:2];
    assign new_address_2_tmp = old_address_2[9:2];
    assign new_address_3_tmp = old_address_3[9:2];    
    
    wire [1:0] bank_number_0_tmp;
    wire [1:0] bank_number_1_tmp;
    wire [1:0] bank_number_2_tmp;
    wire [1:0] bank_number_3_tmp;                                                         
    
    assign bank_number_0_tmp = old_address_0[9:8] + old_address_0[7:6] + old_address_0[5:4] +  
                                old_address_0[3:2] + old_address_0[1:0];
    assign bank_number_1_tmp = old_address_1[9:8] + old_address_1[7:6] + old_address_1[5:4] +  
                                old_address_1[3:2] + old_address_1[1:0];        
    assign bank_number_2_tmp = old_address_2[9:8] + old_address_2[7:6] + old_address_2[5:4] +  
                                old_address_2[3:2] + old_address_2[1:0];    
    assign bank_number_3_tmp = old_address_3[9:8] + old_address_3[7:6] + old_address_3[5:4] +  
                                old_address_3[3:2] + old_address_3[1:0];     
    
    DFF #(.data_width(2)) dff_n0(.clk(clk),.rst(rst),.d(bank_number_0_tmp),.q(bank_number_0)); 
    DFF #(.data_width(2)) dff_n1(.clk(clk),.rst(rst),.d(bank_number_1_tmp),.q(bank_number_1));
    DFF #(.data_width(2)) dff_n2(.clk(clk),.rst(rst),.d(bank_number_2_tmp),.q(bank_number_2));
    DFF #(.data_width(2)) dff_n3(.clk(clk),.rst(rst),.d(bank_number_3_tmp),.q(bank_number_3));                                                                                                                                        
    
    DFF #(.data_width(8)) dff_m0(.clk(clk),.rst(rst),.d(new_address_0_tmp),.q(new_address_0)); 
    DFF #(.data_width(8)) dff_m1(.clk(clk),.rst(rst),.d(new_address_1_tmp),.q(new_address_1));
    DFF #(.data_width(8)) dff_m2(.clk(clk),.rst(rst),.d(new_address_2_tmp),.q(new_address_2));
    DFF #(.data_width(8)) dff_m3(.clk(clk),.rst(rst),.d(new_address_3_tmp),.q(new_address_3));
endmodule