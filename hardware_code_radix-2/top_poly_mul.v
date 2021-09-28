`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 16:44:27
// Design Name: 
// Module Name: top_poly_mul
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

(*DONT_TOUCH = "true"*)
module top_poly_mul 
    #(parameter addr_rom_width = 10,
                 addr_width = 9,
                 data_width = 14)
   (
    input clk,rst,
    input [2:0] conf,
    output wire [3:0] done_flag
    );
    
    //fsm port signal
    wire [8:0] k;
    wire [8:0] i;
	wire [3:0] p;
    wire sel;
    wire wen,ren,en,en_tf_rom;
    
    //address_generator port signal
    wire [9:0] old_address_0,old_address_1;
    
    //memory map port signal --- new_address
    wire [addr_width-1:0] b0,b1;
    //memory map port signal --- bank_number
    wire a0,a1;
    
    //arbiter port signal
    wire sel_a_0,sel_a_1;
    
    //write address for bank
    wire [addr_width-1:0] new_address_0_reg,new_address_1_reg;
         
    //read address for bank
    wire [addr_width-1:0] new_address_0,new_address_1;

    //data from bank
    wire [data_width-1:0] q0,q1;
    
    //data for bfu
    wire [data_width-1:0] u0,v0;
    //data from bfu
    wire [data_width-1:0] bf_0_upper,bf_0_lower;

    //data for bank
    wire [data_width-1:0] d0,d1;
   
    //twiddle factor from ROM
    wire [data_width-1:0] w;
    
    //tf address for ROM
    wire [addr_rom_width-1:0] tf_address;

  
  (*DONT_TOUCH = "true"*)
  fsm m1 (.clk(clk),
      .rst(rst),
      .conf(conf),
      .sel(sel),
      .k(k),
      .i(i),
	  .p(p),
      .wen(wen),
      .ren(ren),
      .en(en),
      //.en_tf_rom(en_tf_rom),
      .done_flag(done_flag));  
  
  (*DONT_TOUCH = "true"*)
  address_generator m2(
          .k(k),
          .i(i),
		  .p(p),
          .old_address_0(old_address_0),.old_address_1(old_address_1));  
   
   (*DONT_TOUCH = "true"*)
   conflict_free_memory_map map(
              .clk(clk),
              .rst(rst),
              .old_address_0(old_address_0),
              .old_address_1(old_address_1),
              .new_address_0(b0),
              .new_address_1(b1),
              .bank_number_0(a0),
              .bank_number_1(a1));
          
  (*DONT_TOUCH = "true"*)                                     
  arbiter m3(
              .a0(a0),.a1(a1),
              .sel_a_0(sel_a_0),.sel_a_1(sel_a_1)); 
                          
  (*DONT_TOUCH = "true"*)                        
  network_bank_in mux1(
                 .b0(b0),.b1(b1),
                 .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),
                 .new_address_0(new_address_0),.new_address_1(new_address_1));    
   
   shift_7 #(.data_width(9)) dff_n0 (.clk(clk),.rst(rst),.din(new_address_0),.dout(new_address_0_reg));       
   shift_7 #(.data_width(9)) dff_n1 (.clk(clk),.rst(rst),.din(new_address_1),.dout(new_address_1_reg));  
                 
  (*DONT_TOUCH = "true"*)                                   
  data_bank bank_0(
                   .clk(clk),
                   .A1(new_address_0_reg), //write address
                   .A2(new_address_0),
                   .D(d0),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q0));
                   
  (*DONT_TOUCH = "true"*)                 
  data_bank bank_1(
                   .clk(clk),
                   .A1(new_address_1_reg),
                   .A2(new_address_1),
                   .D(d1),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q1));
                   
   (*DONT_TOUCH = "true"*)                 
   network_bf_in mux2(
                      .clk(clk),.rst(rst),
                      .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),
                      .q0(q0),.q1(q1),
                      .u0(u0),.v0(v0)); 

   (*DONT_TOUCH = "true"*)                                                                            
   compact_bf bf_0(
              .clk(clk),.rst(rst),
              .u(u0),.v(v0),
              .w(w),
              .sel(sel),
              .bf_upper(bf_0_upper),.bf_lower(bf_0_lower)); 
   
                  
  (*DONT_TOUCH = "true"*)                 
  network_bf_out mux3(
                       .clk(clk),.rst(rst),
                       .bf_0_upper(bf_0_upper),.bf_0_lower(bf_0_lower),
                       .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),
                       .d0(d0),.d1(d1));  
   
  (*DONT_TOUCH = "true"*)                     
  tf_address_generator m6(
                          .clk(clk),.rst(rst),
                          .conf(conf),
                          .p(p),
                          .k(k),
                          .tf_address(tf_address));  

  
  (*DONT_TOUCH = "true"*)                   
  tf_ROM rom0(
              .clk(clk),
              .A(tf_address),
              .REN(ren),
              .Q(w));
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
endmodule
