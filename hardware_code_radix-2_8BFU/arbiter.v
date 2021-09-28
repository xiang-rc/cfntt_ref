module arbiter(
    input [3:0] a0,
    input [3:0] a1,
    input [3:0] a2,
    input [3:0] a3,
    input [3:0] a4,
    input [3:0] a5,
    input [3:0] a6,
    input [3:0] a7,
    input [3:0] a8,
    input [3:0] a9,
    input [3:0] a10,
    input [3:0] a11,
    input [3:0] a12,
    input [3:0] a13,
    input [3:0] a14,
    input [3:0] a15,
    output reg [3:0] sel_a_0,
    output reg [3:0] sel_a_1,
    output reg [3:0] sel_a_2,
    output reg [3:0] sel_a_3,
    output reg [3:0] sel_a_4,
    output reg [3:0] sel_a_5,
    output reg [3:0] sel_a_6,
    output reg [3:0] sel_a_7,
    output reg [3:0] sel_a_8,
    output reg [3:0] sel_a_9,
    output reg [3:0] sel_a_10,
    output reg [3:0] sel_a_11,
    output reg [3:0] sel_a_12,
    output reg [3:0] sel_a_13,
    output reg [3:0] sel_a_14,
    output reg [3:0] sel_a_15);
    
        always@(*)
        begin
          if(a0 == 0)
            sel_a_0 = 0;
          else if(a1 == 0)
            sel_a_0 = 1;
          else if(a2 == 0)
            sel_a_0 = 2;
          else if(a3 == 0)
            sel_a_0 = 3;
          else if(a4 == 0)
            sel_a_0 = 4;
          else if(a5 == 0)
            sel_a_0 = 5;
          else if(a6 == 0)
            sel_a_0 = 6;
          else if(a7 == 0)
            sel_a_0 = 7;
          else if(a8 == 0)
            sel_a_0 = 8;
          else if(a9 == 0)
            sel_a_0 = 9;
          else if(a10 == 0)
            sel_a_0 = 10;
          else if(a11 == 0)
            sel_a_0 = 11;
          else if(a12 == 0)
            sel_a_0 = 12;
          else if(a13 == 0)
            sel_a_0 = 13;
          else if(a14 == 0)
            sel_a_0 = 14;
          else if(a15 == 0)
            sel_a_0 = 15;
          else
            sel_a_0 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 1)
            sel_a_1 = 0;
          else if(a1 == 1)
            sel_a_1 = 1;
          else if(a2 == 1)
            sel_a_1 = 2;
          else if(a3 == 1)
            sel_a_1 = 3;
          else if(a4 == 1)
            sel_a_1 = 4;
          else if(a5 == 1)
            sel_a_1 = 5;
          else if(a6 == 1)
            sel_a_1 = 6;
          else if(a7 == 1)
            sel_a_1 = 7;
          else if(a8 == 1)
            sel_a_1 = 8;
          else if(a9 == 1)
            sel_a_1 = 9;
          else if(a10 == 1)
            sel_a_1 = 10;
          else if(a11 == 1)
            sel_a_1 = 11;
          else if(a12 == 1)
            sel_a_1 = 12;
          else if(a13 == 1)
            sel_a_1 = 13;
          else if(a14 == 1)
            sel_a_1 = 14;
          else if(a15 == 1)
            sel_a_1 = 15;
          else
            sel_a_1 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 2)
            sel_a_2 = 0;
          else if(a1 == 2)
            sel_a_2 = 1;
          else if(a2 == 2)
            sel_a_2 = 2;
          else if(a3 == 2)
            sel_a_2 = 3;
          else if(a4 == 2)
            sel_a_2 = 4;
          else if(a5 == 2)
            sel_a_2 = 5;
          else if(a6 == 2)
            sel_a_2 = 6;
          else if(a7 == 2)
            sel_a_2 = 7;
          else if(a8 == 2)
            sel_a_2 = 8;
          else if(a9 == 2)
            sel_a_2 = 9;
          else if(a10 == 2)
            sel_a_2 = 10;
          else if(a11 == 2)
            sel_a_2 = 11;
          else if(a12 == 2)
            sel_a_2 = 12;
          else if(a13 == 2)
            sel_a_2 = 13;
          else if(a14 == 2)
            sel_a_2 = 14;
          else if(a15 == 2)
            sel_a_2 = 15;
          else
            sel_a_2 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 3)
            sel_a_3 = 0;
          else if(a1 == 3)
            sel_a_3 = 1;
          else if(a2 == 3)
            sel_a_3 = 2;
          else if(a3 == 3)
            sel_a_3 = 3;
          else if(a4 == 3)
            sel_a_3 = 4;
          else if(a5 == 3)
            sel_a_3 = 5;
          else if(a6 == 3)
            sel_a_3 = 6;
          else if(a7 == 3)
            sel_a_3 = 7;
          else if(a8 == 3)
            sel_a_3 = 8;
          else if(a9 == 3)
            sel_a_3 = 9;
          else if(a10 == 3)
            sel_a_3 = 10;
          else if(a11 == 3)
            sel_a_3 = 11;
          else if(a12 == 3)
            sel_a_3 = 12;
          else if(a13 == 3)
            sel_a_3 = 13;
          else if(a14 == 3)
            sel_a_3 = 14;
          else if(a15 == 3)
            sel_a_3 = 15;
          else
            sel_a_3 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 4)
            sel_a_4 = 0;
          else if(a1 == 4)
            sel_a_4 = 1;
          else if(a2 == 4)
            sel_a_4 = 2;
          else if(a3 == 4)
            sel_a_4 = 3;
          else if(a4 == 4)
            sel_a_4 = 4;
          else if(a5 == 4)
            sel_a_4 = 5;
          else if(a6 == 4)
            sel_a_4 = 6;
          else if(a7 == 4)
            sel_a_4 = 7;
          else if(a8 == 4)
            sel_a_4 = 8;
          else if(a9 == 4)
            sel_a_4 = 9;
          else if(a10 == 4)
            sel_a_4 = 10;
          else if(a11 == 4)
            sel_a_4 = 11;
          else if(a12 == 4)
            sel_a_4 = 12;
          else if(a13 == 4)
            sel_a_4 = 13;
          else if(a14 == 4)
            sel_a_4 = 14;
          else if(a15 == 4)
            sel_a_4 = 15;
          else
            sel_a_4 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 5)
            sel_a_5 = 0;
          else if(a1 == 5)
            sel_a_5 = 1;
          else if(a2 == 5)
            sel_a_5 = 2;
          else if(a3 == 5)
            sel_a_5 = 3;
          else if(a4 == 5)
            sel_a_5 = 4;
          else if(a5 == 5)
            sel_a_5 = 5;
          else if(a6 == 5)
            sel_a_5 = 6;
          else if(a7 == 5)
            sel_a_5 = 7;
          else if(a8 == 5)
            sel_a_5 = 8;
          else if(a9 == 5)
            sel_a_5 = 9;
          else if(a10 == 5)
            sel_a_5 = 10;
          else if(a11 == 5)
            sel_a_5 = 11;
          else if(a12 == 5)
            sel_a_5 = 12;
          else if(a13 == 5)
            sel_a_5 = 13;
          else if(a14 == 5)
            sel_a_5 = 14;
          else if(a15 == 5)
            sel_a_5 = 15;
          else
            sel_a_5 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 6)
            sel_a_6 = 0;
          else if(a1 == 6)
            sel_a_6 = 1;
          else if(a2 == 6)
            sel_a_6 = 2;
          else if(a3 == 6)
            sel_a_6 = 3;
          else if(a4 == 6)
            sel_a_6 = 4;
          else if(a5 == 6)
            sel_a_6 = 5;
          else if(a6 == 6)
            sel_a_6 = 6;
          else if(a7 == 6)
            sel_a_6 = 7;
          else if(a8 == 6)
            sel_a_6 = 8;
          else if(a9 == 6)
            sel_a_6 = 9;
          else if(a10 == 6)
            sel_a_6 = 10;
          else if(a11 == 6)
            sel_a_6 = 11;
          else if(a12 == 6)
            sel_a_6 = 12;
          else if(a13 == 6)
            sel_a_6 = 13;
          else if(a14 == 6)
            sel_a_6 = 14;
          else if(a15 == 6)
            sel_a_6 = 15;
          else
            sel_a_6 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 7)
            sel_a_7 = 0;
          else if(a1 == 7)
            sel_a_7 = 1;
          else if(a2 == 7)
            sel_a_7 = 2;
          else if(a3 == 7)
            sel_a_7 = 3;
          else if(a4 == 7)
            sel_a_7 = 4;
          else if(a5 == 7)
            sel_a_7 = 5;
          else if(a6 == 7)
            sel_a_7 = 6;
          else if(a7 == 7)
            sel_a_7 = 7;
          else if(a8 == 7)
            sel_a_7 = 8;
          else if(a9 == 7)
            sel_a_7 = 9;
          else if(a10 == 7)
            sel_a_7 = 10;
          else if(a11 == 7)
            sel_a_7 = 11;
          else if(a12 == 7)
            sel_a_7 = 12;
          else if(a13 == 7)
            sel_a_7 = 13;
          else if(a14 == 7)
            sel_a_7 = 14;
          else if(a15 == 7)
            sel_a_7 = 15;
          else
            sel_a_7 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 8)
            sel_a_8 = 0;
          else if(a1 == 8)
            sel_a_8 = 1;
          else if(a2 == 8)
            sel_a_8 = 2;
          else if(a3 == 8)
            sel_a_8 = 3;
          else if(a4 == 8)
            sel_a_8 = 4;
          else if(a5 == 8)
            sel_a_8 = 5;
          else if(a6 == 8)
            sel_a_8 = 6;
          else if(a7 == 8)
            sel_a_8 = 7;
          else if(a8 == 8)
            sel_a_8 = 8;
          else if(a9 == 8)
            sel_a_8 = 9;
          else if(a10 == 8)
            sel_a_8 = 10;
          else if(a11 == 8)
            sel_a_8 = 11;
          else if(a12 == 8)
            sel_a_8 = 12;
          else if(a13 == 8)
            sel_a_8 = 13;
          else if(a14 == 8)
            sel_a_8 = 14;
          else if(a15 == 8)
            sel_a_8 = 15;
          else
            sel_a_8 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 9)
            sel_a_9 = 0;
          else if(a1 == 9)
            sel_a_9 = 1;
          else if(a2 == 9)
            sel_a_9 = 2;
          else if(a3 == 9)
            sel_a_9 = 3;
          else if(a4 == 9)
            sel_a_9 = 4;
          else if(a5 == 9)
            sel_a_9 = 5;
          else if(a6 == 9)
            sel_a_9 = 6;
          else if(a7 == 9)
            sel_a_9 = 7;
          else if(a8 == 9)
            sel_a_9 = 8;
          else if(a9 == 9)
            sel_a_9 = 9;
          else if(a10 == 9)
            sel_a_9 = 10;
          else if(a11 == 9)
            sel_a_9 = 11;
          else if(a12 == 9)
            sel_a_9 = 12;
          else if(a13 == 9)
            sel_a_9 = 13;
          else if(a14 == 9)
            sel_a_9 = 14;
          else if(a15 == 9)
            sel_a_9 = 15;
          else
            sel_a_9 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 10)
            sel_a_10 = 0;
          else if(a1 == 10)
            sel_a_10 = 1;
          else if(a2 == 10)
            sel_a_10 = 2;
          else if(a3 == 10)
            sel_a_10 = 3;
          else if(a4 == 10)
            sel_a_10 = 4;
          else if(a5 == 10)
            sel_a_10 = 5;
          else if(a6 == 10)
            sel_a_10 = 6;
          else if(a7 == 10)
            sel_a_10 = 7;
          else if(a8 == 10)
            sel_a_10 = 8;
          else if(a9 == 10)
            sel_a_10 = 9;
          else if(a10 == 10)
            sel_a_10 = 10;
          else if(a11 == 10)
            sel_a_10 = 11;
          else if(a12 == 10)
            sel_a_10 = 12;
          else if(a13 == 10)
            sel_a_10 = 13;
          else if(a14 == 10)
            sel_a_10 = 14;
          else if(a15 == 10)
            sel_a_10 = 15;
          else
            sel_a_10 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 11)
            sel_a_11 = 0;
          else if(a1 == 11)
            sel_a_11 = 1;
          else if(a2 == 11)
            sel_a_11 = 2;
          else if(a3 == 11)
            sel_a_11 = 3;
          else if(a4 == 11)
            sel_a_11 = 4;
          else if(a5 == 11)
            sel_a_11 = 5;
          else if(a6 == 11)
            sel_a_11 = 6;
          else if(a7 == 11)
            sel_a_11 = 7;
          else if(a8 == 11)
            sel_a_11 = 8;
          else if(a9 == 11)
            sel_a_11 = 9;
          else if(a10 == 11)
            sel_a_11 = 10;
          else if(a11 == 11)
            sel_a_11 = 11;
          else if(a12 == 11)
            sel_a_11 = 12;
          else if(a13 == 11)
            sel_a_11 = 13;
          else if(a14 == 11)
            sel_a_11 = 14;
          else if(a15 == 11)
            sel_a_11 = 15;
          else
            sel_a_11 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 12)
            sel_a_12 = 0;
          else if(a1 == 12)
            sel_a_12 = 1;
          else if(a2 == 12)
            sel_a_12 = 2;
          else if(a3 == 12)
            sel_a_12 = 3;
          else if(a4 == 12)
            sel_a_12 = 4;
          else if(a5 == 12)
            sel_a_12 = 5;
          else if(a6 == 12)
            sel_a_12 = 6;
          else if(a7 == 12)
            sel_a_12 = 7;
          else if(a8 == 12)
            sel_a_12 = 8;
          else if(a9 == 12)
            sel_a_12 = 9;
          else if(a10 == 12)
            sel_a_12 = 10;
          else if(a11 == 12)
            sel_a_12 = 11;
          else if(a12 == 12)
            sel_a_12 = 12;
          else if(a13 == 12)
            sel_a_12 = 13;
          else if(a14 == 12)
            sel_a_12 = 14;
          else if(a15 == 12)
            sel_a_12 = 15;
          else
            sel_a_12 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 13)
            sel_a_13 = 0;
          else if(a1 == 13)
            sel_a_13 = 1;
          else if(a2 == 13)
            sel_a_13 = 2;
          else if(a3 == 13)
            sel_a_13 = 3;
          else if(a4 == 13)
            sel_a_13 = 4;
          else if(a5 == 13)
            sel_a_13 = 5;
          else if(a6 == 13)
            sel_a_13 = 6;
          else if(a7 == 13)
            sel_a_13 = 7;
          else if(a8 == 13)
            sel_a_13 = 8;
          else if(a9 == 13)
            sel_a_13 = 9;
          else if(a10 == 13)
            sel_a_13 = 10;
          else if(a11 == 13)
            sel_a_13 = 11;
          else if(a12 == 13)
            sel_a_13 = 12;
          else if(a13 == 13)
            sel_a_13 = 13;
          else if(a14 == 13)
            sel_a_13 = 14;
          else if(a15 == 13)
            sel_a_13 = 15;
          else
            sel_a_13 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 14)
            sel_a_14 = 0;
          else if(a1 == 14)
            sel_a_14 = 1;
          else if(a2 == 14)
            sel_a_14 = 2;
          else if(a3 == 14)
            sel_a_14 = 3;
          else if(a4 == 14)
            sel_a_14 = 4;
          else if(a5 == 14)
            sel_a_14 = 5;
          else if(a6 == 14)
            sel_a_14 = 6;
          else if(a7 == 14)
            sel_a_14 = 7;
          else if(a8 == 14)
            sel_a_14 = 8;
          else if(a9 == 14)
            sel_a_14 = 9;
          else if(a10 == 14)
            sel_a_14 = 10;
          else if(a11 == 14)
            sel_a_14 = 11;
          else if(a12 == 14)
            sel_a_14 = 12;
          else if(a13 == 14)
            sel_a_14 = 13;
          else if(a14 == 14)
            sel_a_14 = 14;
          else if(a15 == 14)
            sel_a_14 = 15;
          else
            sel_a_14 = 0;  
        end
        
        always@(*)
        begin
          if(a0 == 15)
            sel_a_15 = 0;
          else if(a1 == 15)
            sel_a_15 = 1;
          else if(a2 == 15)
            sel_a_15 = 2;
          else if(a3 == 15)
            sel_a_15 = 3;
          else if(a4 == 15)
            sel_a_15 = 4;
          else if(a5 == 15)
            sel_a_15 = 5;
          else if(a6 == 15)
            sel_a_15 = 6;
          else if(a7 == 15)
            sel_a_15 = 7;
          else if(a8 == 15)
            sel_a_15 = 8;
          else if(a9 == 15)
            sel_a_15 = 9;
          else if(a10 == 15)
            sel_a_15 = 10;
          else if(a11 == 15)
            sel_a_15 = 11;
          else if(a12 == 15)
            sel_a_15 = 12;
          else if(a13 == 15)
            sel_a_15 = 13;
          else if(a14 == 15)
            sel_a_15 = 14;
          else if(a15 == 15)
            sel_a_15 = 15;
          else
            sel_a_15 = 0;  
        end
endmodule