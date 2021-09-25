module arbiter(
    input a0,a1,
    output reg  sel_a_0,sel_a_1);
    
   always@(*)
    begin
      if(a0 == 0) 
        sel_a_0 = 0;
      else
         sel_a_0 = 1;
    end
    
    always@(*)
    begin
      if(a0 == 1) 
        sel_a_1 = 0;
      else
         sel_a_1 = 1;
    end
    
endmodule