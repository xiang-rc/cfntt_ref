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
    // bank address for read
    output wire [6:0] new_address_0,
    output wire [6:0] new_address_1,
    output wire [6:0] new_address_2,
    output wire [6:0] new_address_3,
    output wire [6:0] new_address_4,
    output wire [6:0] new_address_5,
    output wire [6:0] new_address_6,
    output wire [6:0] new_address_7,

    //bank index
    output wire [2:0] bank_number_0,
    output wire [2:0] bank_number_1,
    output wire [2:0] bank_number_2,
    output wire [2:0] bank_number_3,
    output wire [2:0] bank_number_4,
    output wire [2:0] bank_number_5,
    output wire [2:0] bank_number_6,
    output wire [2:0] bank_number_7);
    
    wire [6:0] new_address_0_tmp;
    wire [6:0] new_address_1_tmp;
    wire [6:0] new_address_2_tmp;
    wire [6:0] new_address_3_tmp;
    wire [6:0] new_address_4_tmp;
    wire [6:0] new_address_5_tmp;
    wire [6:0] new_address_6_tmp;
    wire [6:0] new_address_7_tmp;
     
    assign new_address_0_tmp = old_address_0[9:3];    
    assign new_address_1_tmp = old_address_1[9:3];
    assign new_address_2_tmp = old_address_2[9:3];
    assign new_address_3_tmp = old_address_3[9:3];  
    assign new_address_4_tmp = old_address_4[9:3];    
    assign new_address_5_tmp = old_address_5[9:3];
    assign new_address_6_tmp = old_address_6[9:3];
    assign new_address_7_tmp = old_address_7[9:3];    
    
    reg [2:0] bank_number_0_tmp;
    reg [2:0] bank_number_1_tmp;
    reg [2:0] bank_number_2_tmp;
    reg [2:0] bank_number_3_tmp;
    reg [2:0] bank_number_4_tmp;
    reg [2:0] bank_number_5_tmp;
    reg [2:0] bank_number_6_tmp;
    reg [2:0] bank_number_7_tmp;
    
    wire [1:0] sel0;
    wire [1:0] sel1;
    wire [1:0] sel2;
    wire [1:0] sel3;
    wire [1:0] sel4;
    wire [1:0] sel5;
    wire [1:0] sel6;
    wire [1:0] sel7;          
    
    assign sel0[0] = old_address_0[3] ^ old_address_0[5] ^ old_address_0[7] ^ old_address_0[9];                                               
    assign sel0[1] = old_address_0[4] ^ old_address_0[6] ^ old_address_0[8];
    
    assign sel1[0] = old_address_1[3] ^ old_address_1[5] ^ old_address_1[7] ^ old_address_1[9];                                               
    assign sel1[1] = old_address_1[4] ^ old_address_1[6] ^ old_address_1[8];
    
    assign sel2[0] = old_address_2[3] ^ old_address_2[5] ^ old_address_2[7] ^ old_address_2[9];                                               
    assign sel2[1] = old_address_2[4] ^ old_address_2[6] ^ old_address_2[8];
    
    assign sel3[0] = old_address_3[3] ^ old_address_3[5] ^ old_address_3[7] ^ old_address_3[9];                                               
    assign sel3[1] = old_address_3[4] ^ old_address_3[6] ^ old_address_3[8];
    
    assign sel4[0] = old_address_4[3] ^ old_address_4[5] ^ old_address_4[7] ^ old_address_4[9];                                               
    assign sel4[1] = old_address_4[4] ^ old_address_4[6] ^ old_address_4[8];
    
    assign sel5[0] = old_address_5[3] ^ old_address_5[5] ^ old_address_5[7] ^ old_address_5[9];                                               
    assign sel5[1] = old_address_5[4] ^ old_address_5[6] ^ old_address_5[8];
    
    assign sel6[0] = old_address_6[3] ^ old_address_6[5] ^ old_address_6[7] ^ old_address_6[9];                                               
    assign sel6[1] = old_address_6[4] ^ old_address_6[6] ^ old_address_6[8];
    
    assign sel7[0] = old_address_7[3] ^ old_address_7[5] ^ old_address_7[7] ^ old_address_7[9];                                               
    assign sel7[1] = old_address_7[4] ^ old_address_7[6] ^ old_address_7[8];
    
    always@(*)
    begin
    case(sel0)
    2'b00:bank_number_0_tmp = old_address_0[2:0];
    2'b01:bank_number_0_tmp = {old_address_0[2],~old_address_0[1],old_address_0[0]};
    2'b10:bank_number_0_tmp = {~old_address_0[2],old_address_0[1],old_address_0[0]};
    2'b11:bank_number_0_tmp = {~old_address_0[2],~old_address_0[1],old_address_0[0]};
    default:bank_number_0_tmp = 0;
    endcase    
    end 
    
    always@(*)
    begin
    case(sel1)
    2'b00:bank_number_1_tmp = old_address_1[2:0];
    2'b01:bank_number_1_tmp = {old_address_1[2],~old_address_1[1],old_address_1[0]};
    2'b10:bank_number_1_tmp = {~old_address_1[2],old_address_1[1],old_address_1[0]};
    2'b11:bank_number_1_tmp = {~old_address_1[2],~old_address_1[1],old_address_1[0]};
    default:bank_number_1_tmp = 0;
    endcase    
    end
    
    always@(*)
    begin
    case(sel2)
    2'b00:bank_number_2_tmp = old_address_2[2:0];
    2'b01:bank_number_2_tmp = {old_address_2[2],~old_address_2[1],old_address_2[0]};
    2'b10:bank_number_2_tmp = {~old_address_2[2],old_address_2[1],old_address_2[0]};
    2'b11:bank_number_2_tmp = {~old_address_2[2],~old_address_2[1],old_address_2[0]};
    default:bank_number_2_tmp = 0;
    endcase    
    end
    
    always@(*)
    begin
    case(sel3)
    2'b00:bank_number_3_tmp = old_address_3[2:0];
    2'b01:bank_number_3_tmp = {old_address_3[2],~old_address_3[1],old_address_3[0]};
    2'b10:bank_number_3_tmp = {~old_address_3[2],old_address_3[1],old_address_3[0]};
    2'b11:bank_number_3_tmp = {~old_address_3[2],~old_address_3[1],old_address_3[0]};
    default:bank_number_3_tmp = 0;
    endcase    
    end
    
    always@(*)
    begin
    case(sel4)
    2'b00:bank_number_4_tmp = old_address_4[2:0];
    2'b01:bank_number_4_tmp = {old_address_4[2],~old_address_4[1],old_address_4[0]};
    2'b10:bank_number_4_tmp = {~old_address_4[2],old_address_4[1],old_address_4[0]};
    2'b11:bank_number_4_tmp = {~old_address_4[2],~old_address_4[1],old_address_4[0]};
    default:bank_number_4_tmp = 0;
    endcase    
    end
    
    always@(*)
    begin
    case(sel5)
    2'b00:bank_number_5_tmp = old_address_5[2:0];
    2'b01:bank_number_5_tmp = {old_address_5[2],~old_address_5[1],old_address_5[0]};
    2'b10:bank_number_5_tmp = {~old_address_5[2],old_address_5[1],old_address_5[0]};
    2'b11:bank_number_5_tmp = {~old_address_5[2],~old_address_5[1],old_address_5[0]};
    default:bank_number_5_tmp = 0;
    endcase    
    end
    
    always@(*)
    begin
    case(sel6)
    2'b00:bank_number_6_tmp = old_address_6[2:0];
    2'b01:bank_number_6_tmp = {old_address_6[2],~old_address_6[1],old_address_6[0]};
    2'b10:bank_number_6_tmp = {~old_address_6[2],old_address_6[1],old_address_6[0]};
    2'b11:bank_number_6_tmp = {~old_address_6[2],~old_address_6[1],old_address_6[0]};
    default:bank_number_6_tmp = 0;
    endcase    
    end
    
    always@(*)
    begin
    case(sel7)
    2'b00:bank_number_7_tmp = old_address_7[2:0];
    2'b01:bank_number_7_tmp = {old_address_7[2],~old_address_7[1],old_address_7[0]};
    2'b10:bank_number_7_tmp = {~old_address_7[2],old_address_7[1],old_address_7[0]};
    2'b11:bank_number_7_tmp = {~old_address_7[2],~old_address_7[1],old_address_7[0]};
    default:bank_number_7_tmp = 0;
    endcase    
    end
    
    DFF #(.data_width(3)) dff_n0(.clk(clk),.rst(rst),.d(bank_number_0_tmp),.q(bank_number_0)); 
    DFF #(.data_width(3)) dff_n1(.clk(clk),.rst(rst),.d(bank_number_1_tmp),.q(bank_number_1));
    DFF #(.data_width(3)) dff_n2(.clk(clk),.rst(rst),.d(bank_number_2_tmp),.q(bank_number_2));
    DFF #(.data_width(3)) dff_n3(.clk(clk),.rst(rst),.d(bank_number_3_tmp),.q(bank_number_3));                                                                                                                                        
    DFF #(.data_width(3)) dff_n4(.clk(clk),.rst(rst),.d(bank_number_4_tmp),.q(bank_number_4)); 
    DFF #(.data_width(3)) dff_n5(.clk(clk),.rst(rst),.d(bank_number_5_tmp),.q(bank_number_5));
    DFF #(.data_width(3)) dff_n6(.clk(clk),.rst(rst),.d(bank_number_6_tmp),.q(bank_number_6));
    DFF #(.data_width(3)) dff_n7(.clk(clk),.rst(rst),.d(bank_number_7_tmp),.q(bank_number_7));
    
    DFF #(.data_width(7)) dff_m0(.clk(clk),.rst(rst),.d(new_address_0_tmp),.q(new_address_0)); 
    DFF #(.data_width(7)) dff_m1(.clk(clk),.rst(rst),.d(new_address_1_tmp),.q(new_address_1));
    DFF #(.data_width(7)) dff_m2(.clk(clk),.rst(rst),.d(new_address_2_tmp),.q(new_address_2));
    DFF #(.data_width(7)) dff_m3(.clk(clk),.rst(rst),.d(new_address_3_tmp),.q(new_address_3));
    DFF #(.data_width(7)) dff_m4(.clk(clk),.rst(rst),.d(new_address_4_tmp),.q(new_address_4)); 
    DFF #(.data_width(7)) dff_m5(.clk(clk),.rst(rst),.d(new_address_5_tmp),.q(new_address_5));
    DFF #(.data_width(7)) dff_m6(.clk(clk),.rst(rst),.d(new_address_6_tmp),.q(new_address_6));
    DFF #(.data_width(7)) dff_m7(.clk(clk),.rst(rst),.d(new_address_7_tmp),.q(new_address_7));
endmodule