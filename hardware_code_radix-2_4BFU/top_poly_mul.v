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
                 addr_width = 7,
                 data_width = 14)
   (
    input clk,rst,
    input [2:0] conf,
    output wire [3:0] done_flag
    );
    
    //fsm port signal
    wire [6:0] k;
    wire [6:0] i;
	wire [3:0] p;
    wire sel;
    wire wen,ren,en,en_tf_rom;
    
    //address_generator port signal
    wire [9:0] old_address_0,old_address_1,old_address_2,old_address_3;
    wire [9:0] old_address_4,old_address_5,old_address_6,old_address_7;
    
    //memory map port signal
    wire [addr_width-1:0] b0,b1,b2,b3,b4,b5,b6,b7;
    wire [2:0] a0,a1,a2,a3,a4,a5,a6,a7;
    
    wire [2:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3,sel_a_4,sel_a_5,sel_a_6,sel_a_7;
    
    reg [addr_width-1:0] new_address_0_reg,new_address_1_reg,new_address_2_reg,new_address_3_reg;
    reg [addr_width-1:0] new_address_4_reg,new_address_5_reg,new_address_6_reg,new_address_7_reg;  
         
    wire [addr_width-1:0] new_address_0,new_address_1,new_address_2,new_address_3;
    wire [addr_width-1:0] new_address_4,new_address_5,new_address_6,new_address_7;

    wire [data_width-1:0] q0,q1,q2,q3,q4,q5,q6,q7;
    
    wire [data_width-1:0] u0,v0,u1,v1,u2,v2,u3,v3;

    wire [data_width-1:0] bf_0_upper,bf_0_lower,bf_1_upper,bf_1_lower;
    wire [data_width-1:0] bf_2_upper,bf_2_lower,bf_3_upper,bf_3_lower;

    wire [data_width-1:0] d0,d1,d2,d3,d4,d5,d6,d7;
   
    wire [data_width-1:0] win0,win1,win2,win3;
    wire [data_width*4-1:0] w;
    
    wire [addr_rom_width-1:0] tf_address;

    wire [data_width-1:0] bf_0_upper_in,bf_0_lower_in,bf_1_upper_in,bf_1_lower_in;
    wire [data_width-1:0] bf_2_upper_in,bf_2_lower_in,bf_3_upper_in,bf_3_lower_in;

  
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
          .old_address_6(old_address_6),.old_address_7(old_address_7)
          );  
   
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
              .new_address_0(b0),
              .new_address_1(b1),
              .new_address_2(b2),
              .new_address_3(b3),
              .new_address_4(b4),
              .new_address_5(b5),
              .new_address_6(b6),
              .new_address_7(b7),
              .bank_number_0(a0),
              .bank_number_1(a1),
              .bank_number_2(a2),
              .bank_number_3(a3),
              .bank_number_4(a4),
              .bank_number_5(a5),
              .bank_number_6(a6),
              .bank_number_7(a7)
              );
          
  (*DONT_TOUCH = "true"*)                                     
  arbiter m3(
                          .a0(a0),.a1(a1),.a2(a2),.a3(a3),
                          .a4(a4),.a5(a5),.a6(a6),.a7(a7),
                          .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),
                          .sel_a_2(sel_a_2),.sel_a_3(sel_a_3),
                          .sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                          .sel_a_6(sel_a_6),.sel_a_7(sel_a_7)
                          ); 
  (*DONT_TOUCH = "true"*)                        
  network_bank_in mux1(
                 .b0(b0),.b1(b1),.b2(b2),.b3(b3),.b4(b4),.b5(b5),.b6(b6),.b7(b7),
                 .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),.sel_a_2(sel_a_2),
                 .sel_a_3(sel_a_3),.sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                 .sel_a_6(sel_a_6),.sel_a_7(sel_a_7),
                 .new_address_0(new_address_0),.new_address_1(new_address_1),
                 .new_address_2(new_address_2),.new_address_3(new_address_3),
                 .new_address_4(new_address_4),.new_address_5(new_address_5),
                 .new_address_6(new_address_6),.new_address_7(new_address_7)
                 );    
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
                    .Q(q6)
                    );   
   (*DONT_TOUCH = "true"*)                 
   data_bank bank_7(
                    .clk(clk),
                    .A1(new_address_7_reg),
                    .A2(new_address_7),
                    .D(d7),
                    .WEN(wen),
                    .REN(ren),
                    .EN(en),
                    .Q(q7)
                    );
   
   (*DONT_TOUCH = "true"*)                 
   network_bf_in mux2(
                      .clk(clk),.rst(rst),
                      .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),.sel_a_2(sel_a_2),
                      .sel_a_3(sel_a_3),.sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                      .sel_a_6(sel_a_6),.sel_a_7(sel_a_7),
                      .q0(q0),.q1(q1),.q2(q2),.q3(q3),.q4(q4),.q5(q5),.q6(q6),.q7(q7),
                      .u0(u0),.v0(v0),.u1(u1),.v1(v1),.u2(u2),.v2(v2),.u3(u3),.v3(v3)
                        ); 

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
  network_bf_out mux3(
                       .clk(clk),.rst(rst),
                       .bf_0_upper(bf_0_upper),.bf_0_lower(bf_0_lower),
                       .bf_1_upper(bf_1_upper),.bf_1_lower(bf_1_lower),
                       .bf_2_upper(bf_2_upper),.bf_2_lower(bf_2_lower),
                       .bf_3_upper(bf_3_upper),.bf_3_lower(bf_3_lower),
                       .sel_a_0(sel_a_0),.sel_a_1(sel_a_1),.sel_a_2(sel_a_2),
                       .sel_a_3(sel_a_3),.sel_a_4(sel_a_4),.sel_a_5(sel_a_5),
                       .sel_a_6(sel_a_6),.sel_a_7(sel_a_7),
                       .d0(d0),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7)
                       );  
   
  (*DONT_TOUCH = "true"*)                     
  tf_address_generator m6(
                          .clk(clk),.rst(rst),
                          .conf(conf),
                          .p(p),
                          .k(k),
                          .tf_address(tf_address)               
                           );  
  
   assign win0 = w[4*data_width-1:3*data_width];
   assign win1 = w[3*data_width-1:2*data_width];
   assign win2 = w[2*data_width-1:data_width];
   assign win3 = w[data_width-1:0];
  
  (*DONT_TOUCH = "true"*)                   
  tf_ROM rom0(
              .clk(clk),
              .A(tf_address),
              .D(0),
              .REN(ren),
              .EN(en_tf_rom),
              .Q(w)
              );
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
endmodule
