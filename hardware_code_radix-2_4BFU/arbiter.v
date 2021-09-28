module arbiter(
    input [2:0] a0,a1,a2,a3,a4,a5,a6,a7,
    output reg [2:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3,sel_a_4,sel_a_5,sel_a_6,sel_a_7
    );
    
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
       else
         sel_a_7 = 0;  
    end
endmodule