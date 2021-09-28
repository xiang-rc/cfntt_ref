module arbiter(
    input [1:0] a0,a1,a2,a3,
    output reg [1:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3
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
       else
         sel_a_3 = 0;  
    end
    
endmodule