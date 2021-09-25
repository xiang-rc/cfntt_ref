module fsm (
  input clk,rst,
  input wire [2:0] conf,
  output wire sel,
  output wire [8:0] k, //max = 511
  output wire [8:0] i, //max = 511
  output wire [3:0] p, //max = 9
  output wire wen,
  output wire ren,
  output wire en,
  //output wire en_tf_rom,
  output wire [3:0] done_flag);
  
  parameter IDLE = 3'b000;
  parameter NTT = 3'b001;
  parameter PWM = 3'b010;
  parameter INTT = 3'b011;
  parameter DONE_NTT = 3'b100;
  parameter DONE_INTT = 3'b101;

  reg wen_reg,ren_reg,en_reg,sel_reg;
  wire en_reg_q;
  //en_reg_q_tmp;
  reg [2:0] conf_state;
  reg [8:0] k_reg,i_reg;
  reg [3:0] p_reg;
  reg [3:0] done_reg;
  wire [3:0] end_stage,begin_stage;
  
  assign i = i_reg;
  assign k = k_reg;
  assign p = p_reg;
  assign done_flag = done_reg;
   
  assign en = ((conf == DONE_NTT) || (conf == DONE_INTT)) ? en_reg_q : en_reg_q_tmp;
  //assign en_tf_rom = en_reg_q_tmp;

  shift_8 #(.data_width(1)) shif_wen(.clk(clk),.rst(rst),.din(wen_reg),.dout(wen));
  shift_7 #(.data_width(1)) shif_en(.clk(clk),.rst(rst),.din(en_reg_q_tmp),.dout(en_reg_q));
  
  DFF #(.data_width(1)) dff_en(.clk(clk),.rst(rst),.d(en_reg),.q(en_reg_q_tmp));
  DFF #(.data_width(1)) dff_ren(.clk(clk),.rst(rst),.d(ren_reg),.q(ren));
  DFF #(.data_width(1)) dff_sel(.clk(clk),.rst(rst),.d(sel_reg),.q(sel));
  
  always@(posedge clk or posedge rst)
  begin
    if(rst)
      conf_state <= IDLE;
    else
      conf_state <= conf;
  end
  
  always@(*)
  begin
    sel_reg = 0;
    en_reg = 0; wen_reg = 0;
    ren_reg = 0; done_reg = 4'b0;
    case(conf_state)
    IDLE:begin 
         sel_reg = 0;
         en_reg = 0; wen_reg = 0;
         ren_reg = 0; done_reg = 4'b0;
         end
    NTT:begin 
         sel_reg = 0;
         en_reg = 1; 
         wen_reg = 1;
         ren_reg = 1;
         if((p_reg == 0)&&(k_reg == 511)&&(i_reg == 0))begin
           done_reg = 4'b0001; end
         else begin
           done_reg = 4'b0; end
         end
    PWM:begin 
         sel_reg = 0;
         en_reg = 1;
         wen_reg = 1;
         ren_reg = 1;
         if((p_reg == 0)&&(k_reg == 511)&&(i_reg == 0))begin
           done_reg = 4'b0010; end
         else begin
           done_reg = 4'b0; end
         end
    INTT:begin 
         sel_reg = 1;
         en_reg = 1;
         wen_reg = 1;
         ren_reg = 1;
         if((p_reg == 9)&&(k_reg == 0)&&(i_reg == 511))begin
           done_reg = 4'b0100; end
         else begin
           done_reg = 4'b0; end
         end
    //NTT emptying pipeline phase
    DONE_NTT:begin 
         sel_reg = 0; //NTT = 0
         en_reg = 0;
         wen_reg = 0;
         ren_reg = 0; 
         end
    DONE_INTT:begin 
         sel_reg = 1;//INTT = 1
         en_reg = 0;
         wen_reg = 0;
         ren_reg = 0; 
         done_reg = 4'b1;
         end
    default:begin 
         sel_reg = 0;
         done_reg = 4'b1;
         en_reg = 0;
         wen_reg = 0;
         ren_reg = 0; 
         end
     endcase
  end
 
 assign end_stage = conf == NTT ? 0 : 9;
 assign begin_stage = conf == NTT ? 9 : 0;

  always@(posedge clk or posedge rst)
  begin 
     if(rst)
     begin
         p_reg <= begin_stage;
         i_reg <= 0;
         k_reg <= 0;
     end
     else if((conf_state == NTT) || (conf_state == PWM) || (conf_state == INTT))
     begin
        if(i_reg == (1 << p_reg) - 1)
        begin
           i_reg <= 0;
           if(k_reg == (512 >> p_reg) - 1)
           begin
              k_reg <= 0;
              if(p_reg == end_stage)
                 p_reg <= begin_stage;
              else
              begin
                 if(conf_state == INTT)
                   p_reg <= p_reg + 1;
                 else
                   p_reg <= p_reg - 1;
              end
           end
           else
              k_reg <= k_reg + 1;
         end
         else
            i_reg <= i_reg + 1;
     end
     else
     begin
       p_reg <= begin_stage;
       i_reg <= 0;
       k_reg <= 0;
     end
   end
  
endmodule