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
                 addr_width = 6,
                 data_width = 14)
   (
    input clk,rst,
    input [2:0] conf,
    output wire [3:0] done_flag
    );
    
    //fsm port signal
    wire [5:0] k;
    wire [5:0] i;
	wire [3:0] p;
    wire sel;
    wire wen,ren,en,en_tf_rom;
    
    //address_generator port signal
    wire [9:0] old_address_0,old_address_1,old_address_2,old_address_3;
    wire [9:0] old_address_4,old_address_5,old_address_6,old_address_7;
    wire [9:0] old_address_8,old_address_9,old_address_10,old_address_11;
    wire [9:0] old_address_12,old_address_13,old_address_14,old_address_15;
    
    //memory map port signal
    wire [addr_width-1:0] b0,b1,b2,b3,b4,b5,b6,b7;
    wire [addr_width-1:0] b8,b9,b10,b11,b12,b13,b14,b15;
    wire [3:0] a0,a1,a2,a3,a4,a5,a6,a7;
    wire [3:0] a8,a9,a10,a11,a12,a13,a14,a15;
    
    wire [3:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3,sel_a_4,sel_a_5,sel_a_6,sel_a_7;
    wire [3:0] sel_a_8,sel_a_9,sel_a_10,sel_a_11,sel_a_12,sel_a_13,sel_a_14,sel_a_15;
       
    wire [addr_width-1:0] new_address_0_reg,new_address_1_reg,new_address_2_reg,new_address_3_reg;
    wire [addr_width-1:0] new_address_4_reg,new_address_5_reg,new_address_6_reg,new_address_7_reg; 
    wire [addr_width-1:0] new_address_8_reg,new_address_9_reg,new_address_10_reg,new_address_11_reg;
    wire [addr_width-1:0] new_address_12_reg,new_address_13_reg,new_address_14_reg,new_address_15_reg; 

    wire [addr_width-1:0] new_address_0,new_address_1,new_address_2,new_address_3;
    wire [addr_width-1:0] new_address_4,new_address_5,new_address_6,new_address_7;
    wire [addr_width-1:0] new_address_8,new_address_9,new_address_10,new_address_11;
    wire [addr_width-1:0] new_address_12,new_address_13,new_address_14,new_address_15;
    
    wire [data_width-1:0] q0,q1,q2,q3,q4,q5,q6,q7;
    wire [data_width-1:0] q8,q9,q10,q11,q12,q13,q14,q15;
    
    wire [data_width-1:0] u0,v0,u1,v1,u2,v2,u3,v3;
    wire [data_width-1:0] u4,v4,u5,v5,u6,v6,u7,v7;
    
    wire [data_width-1:0] bf_0_upper,bf_0_lower,bf_1_upper,bf_1_lower;
    wire [data_width-1:0] bf_2_upper,bf_2_lower,bf_3_upper,bf_3_lower;
    wire [data_width-1:0] bf_4_upper,bf_4_lower,bf_5_upper,bf_5_lower;
    wire [data_width-1:0] bf_6_upper,bf_6_lower,bf_7_upper,bf_7_lower;
    
    wire [data_width-1:0] d0,d1,d2,d3,d4,d5,d6,d7;
    wire [data_width-1:0] d8,d9,d10,d11,d12,d13,d14,d15;
   
    wire [data_width-1:0] win0,win1,win2,win3;
    wire [data_width-1:0] win4,win5,win6,win7;
    wire [data_width*8-1:0] w;
    
    wire [addr_rom_width-1:0] tf_address;
    
  shift_8 #(.data_width(6)) shf1 (.clk(clk),.rst(rst),.din(new_address_0),.dout(new_address_0_reg));   
  shift_8 #(.data_width(6)) shf2 (.clk(clk),.rst(rst),.din(new_address_1),.dout(new_address_1_reg)); 
  shift_8 #(.data_width(6)) shf3 (.clk(clk),.rst(rst),.din(new_address_2),.dout(new_address_2_reg));
  shift_8 #(.data_width(6)) shf4 (.clk(clk),.rst(rst),.din(new_address_3),.dout(new_address_3_reg));   
  shift_8 #(.data_width(6)) shf5 (.clk(clk),.rst(rst),.din(new_address_4),.dout(new_address_4_reg)); 
  shift_8 #(.data_width(6)) shf6 (.clk(clk),.rst(rst),.din(new_address_5),.dout(new_address_5_reg)); 
  shift_8 #(.data_width(6)) shf7 (.clk(clk),.rst(rst),.din(new_address_6),.dout(new_address_6_reg));
  shift_8 #(.data_width(6)) shf8 (.clk(clk),.rst(rst),.din(new_address_7),.dout(new_address_7_reg));   
  shift_8 #(.data_width(6)) shf9 (.clk(clk),.rst(rst),.din(new_address_8),.dout(new_address_8_reg)); 
  shift_8 #(.data_width(6)) shf10 (.clk(clk),.rst(rst),.din(new_address_9),.dout(new_address_9_reg)); 
  shift_8 #(.data_width(6)) shf11 (.clk(clk),.rst(rst),.din(new_address_10),.dout(new_address_10_reg));
  shift_8 #(.data_width(6)) shf12 (.clk(clk),.rst(rst),.din(new_address_11),.dout(new_address_11_reg));   
  shift_8 #(.data_width(6)) shf13 (.clk(clk),.rst(rst),.din(new_address_12),.dout(new_address_12_reg)); 
  shift_8 #(.data_width(6)) shf14 (.clk(clk),.rst(rst),.din(new_address_13),.dout(new_address_13_reg)); 
  shift_8 #(.data_width(6)) shf15 (.clk(clk),.rst(rst),.din(new_address_14),.dout(new_address_14_reg));  
  shift_8 #(.data_width(6)) shf16 (.clk(clk),.rst(rst),.din(new_address_15),.dout(new_address_15_reg));
  
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
      .en_tf_rom(en_tf_rom),
      .done_flag(done_flag));  
  
  (*DONT_TOUCH = "true"*)
  address_generator m2(
          .k(k),
          .i(i),
		  .p(p),
          .old_address_0(old_address_0),.old_address_1(old_address_1),
          .old_address_2(old_address_2),.old_address_3(old_address_3),
          .old_address_4(old_address_4),.old_address_5(old_address_5),
          .old_address_6(old_address_6),.old_address_7(old_address_7),
          .old_address_8(old_address_8),.old_address_9(old_address_9),
          .old_address_10(old_address_10),.old_address_11(old_address_11),
          .old_address_12(old_address_12),.old_address_13(old_address_13),
          .old_address_14(old_address_14),.old_address_15(old_address_15));  
   
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
              .old_address_8(old_address_8),
              .old_address_9(old_address_9),
              .old_address_10(old_address_10),
              .old_address_11(old_address_11),
              .old_address_12(old_address_12),
              .old_address_13(old_address_13),
              .old_address_14(old_address_14),
              .old_address_15(old_address_15),
              
              .new_address_0(b0),
              .new_address_1(b1),
              .new_address_2(b2),
              .new_address_3(b3),
              .new_address_4(b4),
              .new_address_5(b5),
              .new_address_6(b6),
              .new_address_7(b7),
              .new_address_8(b8),
              .new_address_9(b9),
              .new_address_10(b10),
              .new_address_11(b11),
              .new_address_12(b12),
              .new_address_13(b13),
              .new_address_14(b14),
              .new_address_15(b15),
              
              .bank_number_0(a0),
              .bank_number_1(a1),
              .bank_number_2(a2),
              .bank_number_3(a3),
              .bank_number_4(a4),
              .bank_number_5(a5),
              .bank_number_6(a6),
              .bank_number_7(a7),
              .bank_number_8(a8),
              .bank_number_9(a9),
              .bank_number_10(a10),
              .bank_number_11(a11),
              .bank_number_12(a12),
              .bank_number_13(a13),
              .bank_number_14(a14),
              .bank_number_15(a15));
          
  (*DONT_TOUCH = "true"*)                                     
  arbiter m3(
                          .a0(a0),.a1(a1),.a2(a2),.a3(a3),
                          .a4(a4),.a5(a5),.a6(a6),.a7(a7),
                          .a8(a8),.a9(a9),.a10(a10),.a11(a11),
                          .a12(a12),.a13(a13),.a14(a14),.a15(a15),
                          .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),
                          .sel_a_2(sel_a_2),.sel_a_3(sel_a_3),
                          .sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                          .sel_a_6(sel_a_6),.sel_a_7(sel_a_7),
                          .sel_a_8(sel_a_8),.sel_a_9(sel_a_9),
                          .sel_a_10(sel_a_10),.sel_a_11(sel_a_11),
                          .sel_a_12(sel_a_12),.sel_a_13(sel_a_13),
                          .sel_a_14(sel_a_14),.sel_a_15(sel_a_15));
                           
  (*DONT_TOUCH = "true"*)                        
  network_bank_in mux1(
                 .b0(b0),.b1(b1),.b2(b2),.b3(b3),.b4(b4),.b5(b5),.b6(b6),.b7(b7),
                 .b8(b8),.b9(b9),.b10(b10),.b11(b11),.b12(b12),.b13(b13),.b14(b14),.b15(b15),
                 .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),.sel_a_2(sel_a_2),
                 .sel_a_3(sel_a_3),.sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                 .sel_a_6(sel_a_6),.sel_a_7(sel_a_7),
                 .sel_a_8(sel_a_8),.sel_a_9(sel_a_9),.sel_a_10(sel_a_10),
                 .sel_a_11(sel_a_11),.sel_a_12(sel_a_12),.sel_a_13(sel_a_13),
                 .sel_a_14(sel_a_14),.sel_a_15(sel_a_15),
                 .new_address_0(new_address_0),.new_address_1(new_address_1),
                 .new_address_2(new_address_2),.new_address_3(new_address_3),
                 .new_address_4(new_address_4),.new_address_5(new_address_5),
                 .new_address_6(new_address_6),.new_address_7(new_address_7),
                 .new_address_8(new_address_8),.new_address_9(new_address_9),
                 .new_address_10(new_address_10),.new_address_11(new_address_11),
                 .new_address_12(new_address_12),.new_address_13(new_address_13),
                 .new_address_14(new_address_14),.new_address_15(new_address_15));    
                 
  (*DONT_TOUCH = "true"*)                                   
  data_bank bank_0(
                   .clk(clk),
	           .A1(new_address_0_reg), // write address
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
                   .Q(q1)
                   );
  (*DONT_TOUCH = "true"*)                   
  data_bank bank_2(
                   .clk(clk),
                   .A1(new_address_2_reg),
                   .A2(new_address_2),
                   .D(d2),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q2)
                   );  
  (*DONT_TOUCH = "true"*)                 
  data_bank bank_3(
                   .clk(clk),
                   .A1(new_address_3_reg),
                   .A2(new_address_3),
                   .D(d3),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q3)
                   ); 
  (*DONT_TOUCH = "true"*)                   
  data_bank bank_4(
                   .clk(clk),
                   .A1(new_address_4_reg),
                   .A2(new_address_4),
                   .D(d4),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q4)
                   ); 
  (*DONT_TOUCH = "true"*)                 
  data_bank bank_5(
                   .clk(clk),
                   .A1(new_address_5_reg),
                   .A2(new_address_5),
                   .D(d5),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q5)
                   );
   (*DONT_TOUCH = "true"*)                
   data_bank bank_6(
                    .clk(clk),
                    .A1(new_address_6_reg),
                    .A2(new_address_6),
                    .D(d6),
                    .WEN(wen),
                    .REN(ren),
                    .EN(en),
                    .Q(q6));   
                    
   (*DONT_TOUCH = "true"*)                 
   data_bank bank_7(
                    .clk(clk),
                    .A1(new_address_7_reg),
                    .A2(new_address_7),
                    .D(d7),
                    .WEN(wen),
                    .REN(ren),
                    .EN(en),
                    .Q(q7));
                    
   (*DONT_TOUCH = "true"*)                 
   data_bank bank_8(
                    .clk(clk),
                    .A1(new_address_8_reg),
                    .A2(new_address_8),
                    .D(d8),
                    .WEN(wen),
                    .REN(ren),
                    .EN(en),
                    .Q(q8));
                    
  (*DONT_TOUCH = "true"*)                 
  data_bank bank_9(
                   .clk(clk),
                   .A1(new_address_9_reg),
                   .A2(new_address_9),
                   .D(d9),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q9));
                   
  (*DONT_TOUCH = "true"*)                   
  data_bank bank_10(
                   .clk(clk),
                   .A1(new_address_10_reg),
                   .A2(new_address_10),
                   .D(d10),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q10));  
                   
  (*DONT_TOUCH = "true"*)                 
  data_bank bank_11(
                   .clk(clk),
                   .A1(new_address_11_reg),
                   .A2(new_address_11),
                   .D(d11),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q11)); 
                   
  (*DONT_TOUCH = "true"*)                   
  data_bank bank_12(
                   .clk(clk),
                   .A1(new_address_12_reg),
                   .A2(new_address_12),
                   .D(d12),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q12)); 
                   
  (*DONT_TOUCH = "true"*)                 
  data_bank bank_13(
                   .clk(clk),
                   .A1(new_address_13_reg),
                   .A2(new_address_13),
                   .D(d13),
                   .WEN(wen),
                   .REN(ren),
                   .EN(en),
                   .Q(q13));
                   
   (*DONT_TOUCH = "true"*)                
   data_bank bank_14(
                    .clk(clk),
                    .A1(new_address_14_reg),
                    .A2(new_address_14),
                    .D(d14),
                    .WEN(wen),
                    .REN(ren),
                    .EN(en),
                    .Q(q14));   
                    
   (*DONT_TOUCH = "true"*)                 
   data_bank bank_15(
                    .clk(clk),
                    .A1(new_address_15_reg),
                    .A2(new_address_15),
                    .D(d15),
                    .WEN(wen),
                    .REN(ren),
                    .EN(en),
                    .Q(q15));                
                                        
   
   (*DONT_TOUCH = "true"*)                 
   network_bf_in mux2(
                      .clk(clk),.rst(rst),
                      .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),.sel_a_2(sel_a_2),
                      .sel_a_3(sel_a_3),.sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                      .sel_a_6(sel_a_6),.sel_a_7(sel_a_7),
                      .sel_a_8(sel_a_8),.sel_a_9(sel_a_9),.sel_a_10(sel_a_10),
                      .sel_a_11(sel_a_11),.sel_a_12(sel_a_12),.sel_a_13(sel_a_13),
                      .sel_a_14(sel_a_14),.sel_a_15(sel_a_15),
                      .q0(q0),.q1(q1),.q2(q2),.q3(q3),.q4(q4),.q5(q5),.q6(q6),.q7(q7),
                      .q8(q8),.q9(q9),.q10(q10),.q11(q11),.q12(q12),.q13(q13),.q14(q14),.q15(q15),
                      .u0(u0),.v0(v0),.u1(u1),.v1(v1),.u2(u2),.v2(v2),.u3(u3),.v3(v3),
                      .u4(u4),.v4(v4),.u5(u5),.v5(v5),.u6(u6),.v6(v6),.u7(u7),.v7(v7)); 

   (*DONT_TOUCH = "true"*)                                                                            
   compact_bf bf_0(
              .clk(clk),.rst(rst),
              .u(u0),.v(v0),
              .w(win0),
              .sel(sel),
              .bf_upper(bf_0_upper),.bf_lower(bf_0_lower)
              ); 
   (*DONT_TOUCH = "true"*)           
   compact_bf bf_1(
                   .clk(clk),.rst(rst),
                   .u(u1),.v(v1),
                   .w(win1),
                   .sel(sel),
                   .bf_upper(bf_1_upper),.bf_lower(bf_1_lower)
                   ); 
   (*DONT_TOUCH = "true"*)                
   compact_bf bf_2(
                   .clk(clk),.rst(rst),
                   .u(u2),.v(v2),
                   .w(win2),
                   .sel(sel),
                   .bf_upper(bf_2_upper),.bf_lower(bf_2_lower)
                   );   
   (*DONT_TOUCH = "true"*)                
   compact_bf bf_3(
                   .clk(clk),.rst(rst),
                   .u(u3),.v(v3),
                   .w(win3),
                   .sel(sel),
                   .bf_upper(bf_3_upper),.bf_lower(bf_3_lower)
                   );
   (*DONT_TOUCH = "true"*)                                                                            
   compact_bf bf_4(
              .clk(clk),.rst(rst),
              .u(u4),.v(v4),
              .w(win4),
              .sel(sel),
              .bf_upper(bf_4_upper),.bf_lower(bf_4_lower)
              ); 
   (*DONT_TOUCH = "true"*)           
   compact_bf bf_5(
                   .clk(clk),.rst(rst),
                   .u(u5),.v(v5),
                   .w(win5),
                   .sel(sel),
                   .bf_upper(bf_5_upper),.bf_lower(bf_5_lower)
                   ); 
   (*DONT_TOUCH = "true"*)                
   compact_bf bf_6(
                   .clk(clk),.rst(rst),
                   .u(u6),.v(v6),
                   .w(win6),
                   .sel(sel),
                   .bf_upper(bf_6_upper),.bf_lower(bf_6_lower)
                   );   
   (*DONT_TOUCH = "true"*)                
   compact_bf bf_7(
                   .clk(clk),.rst(rst),
                   .u(u7),.v(v7),
                   .w(win7),
                   .sel(sel),
                   .bf_upper(bf_7_upper),.bf_lower(bf_7_lower)
                   );           
           
                  
  (*DONT_TOUCH = "true"*)                 
  network_bf_out mux3(
                       .clk(clk),.rst(rst),
                       .bf_0_upper(bf_0_upper),.bf_0_lower(bf_0_lower),
                       .bf_1_upper(bf_1_upper),.bf_1_lower(bf_1_lower),
                       .bf_2_upper(bf_2_upper),.bf_2_lower(bf_2_lower),
                       .bf_3_upper(bf_3_upper),.bf_3_lower(bf_3_lower),
                       .bf_4_upper(bf_4_upper),.bf_4_lower(bf_4_lower),
                       .bf_5_upper(bf_5_upper),.bf_5_lower(bf_5_lower),
                       .bf_6_upper(bf_6_upper),.bf_6_lower(bf_6_lower),
                       .bf_7_upper(bf_7_upper),.bf_7_lower(bf_7_lower),
                       .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),.sel_a_2(sel_a_2),
                       .sel_a_3(sel_a_3),.sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                       .sel_a_6(sel_a_6),.sel_a_7(sel_a_7),
                       .sel_a_8(sel_a_8),.sel_a_9(sel_a_9),.sel_a_10(sel_a_10),
                       .sel_a_11(sel_a_11),.sel_a_12(sel_a_12),.sel_a_13(sel_a_13),
                       .sel_a_14(sel_a_14),.sel_a_15(sel_a_15),
                       .d0(d0),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7),
                       .d8(d8),.d9(d9),.d10(d10),.d11(d11),.d12(d12),.d13(d13),.d14(d14),.d15(d15)
                       );  
   
  (*DONT_TOUCH = "true"*)                     
  tf_address_generator m6(
                          .clk(clk),.rst(rst),
                          .conf(conf),
                          .p(p),
                          .k(k),
                          .tf_address(tf_address)               
                           );  
  
   assign win0 = p > 2 ? w[8*data_width-1:7*data_width] : w[data_width-1:0];
   assign win1 = p > 2 ? w[7*data_width-1:6*data_width] : w[2*data_width-1:data_width];
   assign win2 = p > 2 ? w[6*data_width-1:5*data_width] : w[3*data_width-1:2*data_width];
   assign win3 = p > 2 ? w[5*data_width-1:4*data_width] : w[4*data_width-1:3*data_width];
   assign win4 = p > 2 ? w[4*data_width-1:3*data_width] : w[5*data_width-1:4*data_width];
   assign win5 = p > 2 ? w[3*data_width-1:2*data_width] : w[6*data_width-1:5*data_width];
   assign win6 = p > 2 ? w[2*data_width-1:data_width] : w[7*data_width-1:6*data_width];
   assign win7 = p > 2 ? w[data_width-1:0] : w[8*data_width-1:7*data_width];
  
  (*DONT_TOUCH = "true"*)                   
  tf_ROM rom0(
              .clk(clk),
              .A(tf_address),
              .REN(ren),
              .Q(w)
              );
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
endmodule
