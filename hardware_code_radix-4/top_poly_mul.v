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
    #(parameter addr_rom_width = 9,
                 addr_width = 8,
                 data_width = 14)
   (
    input clk,rst,
    input [2:0] conf,
    output [3:0] done_flag
    );
    
    //fsm port signal
    wire sel;
    wire [7:0] k;
    wire [7:0] j;
    wire [2:0] p;
    wire wen,ren,en;
    
    //address_generator port signal
    wire [9:0] old_address_0,old_address_1,old_address_2,old_address_3;
    
    //memory map port signal
    wire [addr_width-1:0] new_address_0,new_address_1,new_address_2,new_address_3;

    wire [1:0] bank_number_0,bank_number_1,bank_number_2,bank_number_3;
    
    //arbiter port signal
    wire [1:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3;
    
    wire [addr_width-1:0] bank_address_0,bank_address_1,bank_address_2,bank_address_3;
    wire [addr_width-1:0] bank_address_0_dy,bank_address_1_dy;
    wire [addr_width-1:0] bank_address_2_dy,bank_address_3_dy;
    
    //data from banks
    wire [data_width-1:0] q0,q1,q2,q3;
    
    //data into bfu
    wire [data_width-1:0] u0,v0,u1,v1;
    //data from bfu
    wire [data_width-1:0] bf_0_upper,bf_0_lower,bf_1_upper,bf_1_lower;

    //data into banks
    wire [data_width-1:0] d0,d1,d2,d3;
   
    //twiddle factors into banks
    wire [data_width*3-1:0] w;  
    wire [data_width-1:0] win1,win2,win3;
    
    //twiddle factor address
    wire [addr_rom_width-1:0] tf_address;
  
   (*DONT_TOUCH = "true"*)
   fsm m1 (.clk(clk),
      .rst(rst),
      .conf(conf),
      .sel(sel),
      .p(p),
      .k(k),
      .j(j),
      .wen(wen),
      .ren(ren),
      .en(en),
      .done_flag(done_flag));  
      
  (*DONT_TOUCH = "true"*)
  address_generator m2(
          .p(p),
          .k(k),
          .j(j),
          .old_address_0(old_address_0),.old_address_1(old_address_1),
          .old_address_2(old_address_2),.old_address_3(old_address_3));  
    
   (*DONT_TOUCH = "true"*)       
   conflict_free_memory_map map(
              .clk(clk),
              .rst(rst),
              .old_address_0(old_address_0),
              .old_address_1(old_address_1),
              .old_address_2(old_address_2),
              .old_address_3(old_address_3),
              .new_address_0(new_address_0),
              .new_address_1(new_address_1),
              .new_address_2(new_address_2),
              .new_address_3(new_address_3),
              .bank_number_0(bank_number_0),
              .bank_number_1(bank_number_1),
              .bank_number_2(bank_number_2),
              .bank_number_3(bank_number_3));
              
  (*DONT_TOUCH = "true"*)                                      
  arbiter m3(
             .a0(bank_number_0),.a1(bank_number_1),
             .a2(bank_number_2),.a3(bank_number_3),
             .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),
             .sel_a_2(sel_a_2),.sel_a_3(sel_a_3)); 
  
  (*DONT_TOUCH = "true"*)                  
  network_bank_in mux1(
                 .b0(new_address_0),.b1(new_address_1),
                 .b2(new_address_2),.b3(new_address_3),
                 .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),
                 .sel_a_2(sel_a_2),.sel_a_3(sel_a_3),
                 .new_address_0(bank_address_0),.new_address_1(bank_address_1),
                 .new_address_2(bank_address_2),.new_address_3(bank_address_3)
                 );    
                 
  shift_13 #(.data_width(8)) shf1 (.clk(clk),.rst(rst),.din(bank_address_0),.dout(bank_address_0_dy));   
  shift_13 #(.data_width(8)) shf2 (.clk(clk),.rst(rst),.din(bank_address_1),.dout(bank_address_1_dy)); 
  shift_13 #(.data_width(8)) shf3 (.clk(clk),.rst(rst),.din(bank_address_2),.dout(bank_address_2_dy)); 
  shift_13 #(.data_width(8)) shf4 (.clk(clk),.rst(rst),.din(bank_address_3),.dout(bank_address_3_dy));                 
  
  (*DONT_TOUCH = "true"*)                           
  data_bank bank_0(
                   .clk(clk),
                   .A1(bank_address_0_dy),
                   .A2(bank_address_0),
                   .D(d0),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q0));
         
  data_bank bank_1(
                   .clk(clk),
                   .A1(bank_address_1_dy),
                   .A2(bank_address_1),
                   .D(d1),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q1));
             
  data_bank bank_2(
                   .clk(clk),
                   .A1(bank_address_2_dy),
                   .A2(bank_address_2),
                   .D(d2),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q2));  
           
  data_bank bank_3(
                   .clk(clk),
                   .A1(bank_address_3_dy),
                   .A2(bank_address_3),
                   .D(d3),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q3)); 
           
   network_bf_in mux2(
                      .clk(clk),.rst(rst),
                      .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),.sel_a_2(sel_a_2),
                      .sel_a_3(sel_a_3),
                      .q0(q0),.q1(q1),.q2(q2),.q3(q3),
                      .u0(u0),.v0(v0),.u1(u1),.v1(v1)); 
                      
   (*DONT_TOUCH = "true"*)                                                                  
   compact_bf bf_0(
           .clk(clk),
           .rst(rst),
           .u0(u0),.v0(u1),.u1(v0),.v1(v1),
           .wa1(win1),.wa2(win2),.wa3(win3),
           .sel(sel),
           .bf_0_upper(bf_0_upper),.bf_0_lower(bf_0_lower),
           .bf_1_upper(bf_1_upper),.bf_1_lower(bf_1_lower)); 
  
  (*DONT_TOUCH = "true"*)             
  network_bf_out mux3(
                       .clk(clk),.rst(rst),
                       .bf_0_upper(bf_0_upper),.bf_0_lower(bf_0_lower),
                       .bf_1_upper(bf_1_upper),.bf_1_lower(bf_1_lower),
                       .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),
                       .sel_a_2(sel_a_2),
                       .sel_a_3(sel_a_3),
                       .d0(d0),.d1(d1),.d2(d2),.d3(d3));  
                                 
  tf_address_generator m_tf(.clk(clk),.rst(rst),.conf(conf),.k(k),.p(p),.tf_address(tf_address));  
  
  assign win1 = w[3*data_width-1:2*data_width];
  assign win2 = w[2*data_width-1:data_width];
  assign win3 = w[data_width-1:0];
           
  (*DONT_TOUCH = "true"*)              
  tf_ROM rom0(
              .clk(clk),
              .A(tf_address),
              .REN(ren),
              .Q(w));
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
endmodule
