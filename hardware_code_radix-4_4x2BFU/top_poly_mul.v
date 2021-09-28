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
    #(parameter addr_rom_width = 8,
                 addr_width = 7,
                 data_width = 14)
   (
    input clk,rst,
    input [2:0] conf,
    output [3:0] done_flag
    );
    
    //fsm port signal
    wire sel;
    wire [6:0] k;
    wire [6:0] j;
    wire [2:0] p;
    wire wen,ren,en;
    
    //address_generator port signal
    wire [9:0] old_address_0,old_address_1,old_address_2,old_address_3;
    wire [9:0] old_address_4,old_address_5,old_address_6,old_address_7;
    
    //memory map port signal
    wire [addr_width-1:0] new_address_0,new_address_1,new_address_2,new_address_3;
    wire [addr_width-1:0] new_address_4,new_address_5,new_address_6,new_address_7;

    wire [2:0] bank_number_0,bank_number_1,bank_number_2,bank_number_3;
    wire [2:0] bank_number_4,bank_number_5,bank_number_6,bank_number_7;
    
    //arbiter port signal
    wire [2:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3;
    wire [2:0] sel_a_4,sel_a_5,sel_a_6,sel_a_7;
    
    wire [addr_width-1:0] bank_address_0,bank_address_1,bank_address_2,bank_address_3;
    wire [addr_width-1:0] bank_address_4,bank_address_5,bank_address_6,bank_address_7;
    wire [addr_width-1:0] bank_address_0_dy,bank_address_1_dy;
    wire [addr_width-1:0] bank_address_2_dy,bank_address_3_dy;
    wire [addr_width-1:0] bank_address_4_dy,bank_address_5_dy;
    wire [addr_width-1:0] bank_address_6_dy,bank_address_7_dy;
    
    wire [data_width-1:0] q0,q1,q2,q3;
    wire [data_width-1:0] q4,q5,q6,q7;
    
    wire [data_width-1:0] u0,v0,u1,v1;
    wire [data_width-1:0] u2,v2,u3,v3;

    wire [data_width-1:0] bf_0_upper,bf_0_lower,bf_1_upper,bf_1_lower;
    wire [data_width-1:0] bf_2_upper,bf_2_lower,bf_3_upper,bf_3_lower;

    wire [data_width-1:0] d0,d1,d2,d3;
    wire [data_width-1:0] d4,d5,d6,d7;
   
    wire [data_width*6-1:0] w;  
    wire [data_width-1:0] win1,win2,win3;
    wire [data_width-1:0] win4,win5,win6;
    
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
          .old_address_2(old_address_2),.old_address_3(old_address_3),
          .old_address_4(old_address_4),.old_address_5(old_address_5),
          .old_address_6(old_address_6),.old_address_7(old_address_7));  
    
   (*DONT_TOUCH = "true"*)       
   conflict_free_memory_map map(
              .clk(clk),
              .rst(rst),
              .old_address_0(old_address_0),
              .old_address_1(old_address_1),
              .old_address_2(old_address_2),
              .old_address_3(old_address_3),
              .old_address_4(old_address_4),
              .old_address_5(old_address_5),
              .old_address_6(old_address_6),
              .old_address_7(old_address_7),
              .new_address_0(new_address_0),
              .new_address_1(new_address_1),
              .new_address_2(new_address_2),
              .new_address_3(new_address_3),
              .new_address_4(new_address_4),
              .new_address_5(new_address_5),
              .new_address_6(new_address_6),
              .new_address_7(new_address_7),
              .bank_number_0(bank_number_0),
              .bank_number_1(bank_number_1),
              .bank_number_2(bank_number_2),
              .bank_number_3(bank_number_3),
              .bank_number_4(bank_number_4),
              .bank_number_5(bank_number_5),
              .bank_number_6(bank_number_6),
              .bank_number_7(bank_number_7));
              
  (*DONT_TOUCH = "true"*)                                      
  arbiter m3(
             .a0(bank_number_0),.a1(bank_number_1),
             .a2(bank_number_2),.a3(bank_number_3),
             .a4(bank_number_4),.a5(bank_number_5),
             .a6(bank_number_6),.a7(bank_number_7),
             .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),
             .sel_a_2(sel_a_2),.sel_a_3(sel_a_3),
             .sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
             .sel_a_6(sel_a_6),.sel_a_7(sel_a_7)); 
  
  (*DONT_TOUCH = "true"*)                  
  network_bank_in mux1(
                 .b0(new_address_0),.b1(new_address_1),
                 .b2(new_address_2),.b3(new_address_3),
                 .b4(new_address_4),.b5(new_address_5),
                 .b6(new_address_6),.b7(new_address_7),
                 .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),
                 .sel_a_2(sel_a_2),.sel_a_3(sel_a_3),
                 .sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                 .sel_a_6(sel_a_6),.sel_a_7(sel_a_7),
                 .new_address_0(bank_address_0),.new_address_1(bank_address_1),
                 .new_address_2(bank_address_2),.new_address_3(bank_address_3),
                 .new_address_4(bank_address_4),.new_address_5(bank_address_5),
                 .new_address_6(bank_address_6),.new_address_7(bank_address_7));    
                 
  shift_13 #(.data_width(7)) shf1 (.clk(clk),.rst(rst),.din(bank_address_0),.dout(bank_address_0_dy));   
  shift_13 #(.data_width(7)) shf2 (.clk(clk),.rst(rst),.din(bank_address_1),.dout(bank_address_1_dy)); 
  shift_13 #(.data_width(7)) shf3 (.clk(clk),.rst(rst),.din(bank_address_2),.dout(bank_address_2_dy)); 
  shift_13 #(.data_width(7)) shf4 (.clk(clk),.rst(rst),.din(bank_address_3),.dout(bank_address_3_dy));                 
  shift_13 #(.data_width(7)) shf5 (.clk(clk),.rst(rst),.din(bank_address_4),.dout(bank_address_4_dy));   
  shift_13 #(.data_width(7)) shf6 (.clk(clk),.rst(rst),.din(bank_address_5),.dout(bank_address_5_dy)); 
  shift_13 #(.data_width(7)) shf7 (.clk(clk),.rst(rst),.din(bank_address_6),.dout(bank_address_6_dy)); 
  shift_13 #(.data_width(7)) shf8 (.clk(clk),.rst(rst),.din(bank_address_7),.dout(bank_address_7_dy));
  
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
  data_bank bank_4(
                   .clk(clk),
                   .A1(bank_address_4_dy),
                   .A2(bank_address_4),
                   .D(d4),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q4));     
  data_bank bank_5(
                   .clk(clk),
                   .A1(bank_address_5_dy),
                   .A2(bank_address_5),
                   .D(d5),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q5));      
  data_bank bank_6(
                   .clk(clk),
                   .A1(bank_address_6_dy),
                   .A2(bank_address_6),
                   .D(d6),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q6));                                        
  data_bank bank_7(
                   .clk(clk),
                   .A1(bank_address_7_dy),
                   .A2(bank_address_7),
                   .D(d7),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q7));          
           
           
   network_bf_in mux2(
                      .clk(clk),.rst(rst),
                      .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),.sel_a_2(sel_a_2),
                      .sel_a_3(sel_a_3),
                      .sel_a_4(sel_a_4),.sel_a_5(sel_a_5),.sel_a_6(sel_a_6),
                      .sel_a_7(sel_a_7),
                      .q0(q0),.q1(q1),.q2(q2),.q3(q3),
                      .q4(q4),.q5(q5),.q6(q6),.q7(q7),
                      .u0(u0),.v0(v0),.u1(u1),.v1(v1),
                      .u2(u2),.v2(v2),.u3(u3),.v3(v3)); 
                      
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
   compact_bf bf_1(
           .clk(clk),
           .rst(rst),
           .u0(u2),.v0(u3),.u1(v2),.v1(v3),
           .wa1(win4),.wa2(win5),.wa3(win6),
           .sel(sel),
           .bf_0_upper(bf_2_upper),.bf_0_lower(bf_2_lower),
           .bf_1_upper(bf_3_upper),.bf_1_lower(bf_3_lower));          
  
  (*DONT_TOUCH = "true"*)             
  network_bf_out mux3(
                       .clk(clk),.rst(rst),
                       .bf_0_upper(bf_0_upper),.bf_0_lower(bf_0_lower),
                       .bf_1_upper(bf_1_upper),.bf_1_lower(bf_1_lower),
                       .bf_2_upper(bf_2_upper),.bf_2_lower(bf_2_lower),
                       .bf_3_upper(bf_3_upper),.bf_3_lower(bf_3_lower),
                       .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),
                       .sel_a_2(sel_a_2),
                       .sel_a_3(sel_a_3),
                       .sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                       .sel_a_6(sel_a_6),
                       .sel_a_7(sel_a_7),
                       .d0(d0),.d1(d1),.d2(d2),.d3(d3),
                       .d4(d4),.d5(d5),.d6(d6),.d7(d7));  
                                 
  tf_address_generator m_tf(.clk(clk),.rst(rst),.conf(conf),.k(k),.p(p),.tf_address(tf_address));  
  
  assign win1 = conf == 1 ? w[6*data_width-1:5*data_width] : w[4*data_width-1:3*data_width];
  assign win2 = conf == 1 ? w[5*data_width-1:4*data_width] : w[5*data_width-1:4*data_width];
  assign win3 = conf == 1 ? w[4*data_width-1:3*data_width] : w[6*data_width-1:5*data_width];
  assign win4 = conf == 1 ? w[3*data_width-1:2*data_width] : w[data_width-1:0];
  assign win5 = conf == 1 ? w[2*data_width-1:data_width] : w[2*data_width-1:data_width];
  assign win6 = conf == 1 ? w[data_width-1:0] : w[3*data_width-1:2*data_width];
           
  (*DONT_TOUCH = "true"*)              
  tf_ROM rom0(
              .clk(clk),
              .D(d),
              .A(tf_address),
              .REN(ren),
              .EN(ren),
              .Q(w));
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
endmodule
