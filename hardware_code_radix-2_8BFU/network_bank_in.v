module network_bank_in #(parameter addr_width = 6)(
    input [addr_width-1:0] b0,b1,b2,b3,b4,b5,b6,b7,
    input [addr_width-1:0] b8,b9,b10,b11,b12,b13,b14,b15,
    input [3:0] sel_a_0,sel_a_1,sel_a_2,sel_a_3,sel_a_4,sel_a_5,sel_a_6,sel_a_7,
    input [3:0] sel_a_8,sel_a_9,sel_a_10,sel_a_11,sel_a_12,sel_a_13,sel_a_14,sel_a_15,
    output reg [addr_width-1:0] new_address_0,new_address_1,new_address_2,new_address_3,new_address_4,
    output reg [addr_width-1:0] new_address_5,new_address_6,new_address_7,
    output reg [addr_width-1:0] new_address_8,new_address_9,new_address_10,new_address_11,
    output reg [addr_width-1:0] new_address_12,new_address_13,new_address_14,new_address_15);
    
    always@(*)
        begin
        case(sel_a_0)
         4'd0:new_address_0 = b0;
         4'd1:new_address_0 = b1;
         4'd2:new_address_0 = b2;
         4'd3:new_address_0 = b3;
         4'd4:new_address_0 = b4;
         4'd5:new_address_0 = b5;
         4'd6:new_address_0 = b6;
         4'd7:new_address_0 = b7;
         4'd8:new_address_0 = b8;
         4'd9:new_address_0 = b9;
         4'd10:new_address_0 = b10;
         4'd11:new_address_0 = b11;
         4'd12:new_address_0 = b12;
         4'd13:new_address_0 = b13;
         4'd14:new_address_0 = b14;
         4'd15:new_address_0 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_1)
         4'd0:new_address_1 = b0;
         4'd1:new_address_1 = b1;
         4'd2:new_address_1 = b2;
         4'd3:new_address_1 = b3;
         4'd4:new_address_1 = b4;
         4'd5:new_address_1 = b5;
         4'd6:new_address_1 = b6;
         4'd7:new_address_1 = b7;
         4'd8:new_address_1 = b8;
         4'd9:new_address_1 = b9;
         4'd10:new_address_1 = b10;
         4'd11:new_address_1 = b11;
         4'd12:new_address_1 = b12;
         4'd13:new_address_1 = b13;
         4'd14:new_address_1 = b14;
         4'd15:new_address_1 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_2)
         4'd0:new_address_2 = b0;
         4'd1:new_address_2 = b1;
         4'd2:new_address_2 = b2;
         4'd3:new_address_2 = b3;
         4'd4:new_address_2 = b4;
         4'd5:new_address_2 = b5;
         4'd6:new_address_2 = b6;
         4'd7:new_address_2 = b7;
         4'd8:new_address_2 = b8;
         4'd9:new_address_2 = b9;
         4'd10:new_address_2 = b10;
         4'd11:new_address_2 = b11;
         4'd12:new_address_2 = b12;
         4'd13:new_address_2 = b13;
         4'd14:new_address_2 = b14;
         4'd15:new_address_2 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_3)
         4'd0:new_address_3 = b0;
         4'd1:new_address_3 = b1;
         4'd2:new_address_3 = b2;
         4'd3:new_address_3 = b3;
         4'd4:new_address_3 = b4;
         4'd5:new_address_3 = b5;
         4'd6:new_address_3 = b6;
         4'd7:new_address_3 = b7;
         4'd8:new_address_3 = b8;
         4'd9:new_address_3 = b9;
         4'd10:new_address_3 = b10;
         4'd11:new_address_3 = b11;
         4'd12:new_address_3 = b12;
         4'd13:new_address_3 = b13;
         4'd14:new_address_3 = b14;
         4'd15:new_address_3 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_4)
         4'd0:new_address_4 = b0;
         4'd1:new_address_4 = b1;
         4'd2:new_address_4 = b2;
         4'd3:new_address_4 = b3;
         4'd4:new_address_4 = b4;
         4'd5:new_address_4 = b5;
         4'd6:new_address_4 = b6;
         4'd7:new_address_4 = b7;
         4'd8:new_address_4 = b8;
         4'd9:new_address_4 = b9;
         4'd10:new_address_4 = b10;
         4'd11:new_address_4 = b11;
         4'd12:new_address_4 = b12;
         4'd13:new_address_4 = b13;
         4'd14:new_address_4 = b14;
         4'd15:new_address_4 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_5)
         4'd0:new_address_5 = b0;
         4'd1:new_address_5 = b1;
         4'd2:new_address_5 = b2;
         4'd3:new_address_5 = b3;
         4'd4:new_address_5 = b4;
         4'd5:new_address_5 = b5;
         4'd6:new_address_5 = b6;
         4'd7:new_address_5 = b7;
         4'd8:new_address_5 = b8;
         4'd9:new_address_5 = b9;
         4'd10:new_address_5 = b10;
         4'd11:new_address_5 = b11;
         4'd12:new_address_5 = b12;
         4'd13:new_address_5 = b13;
         4'd14:new_address_5 = b14;
         4'd15:new_address_5 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_6)
         4'd0:new_address_6 = b0;
         4'd1:new_address_6 = b1;
         4'd2:new_address_6 = b2;
         4'd3:new_address_6 = b3;
         4'd4:new_address_6 = b4;
         4'd5:new_address_6 = b5;
         4'd6:new_address_6 = b6;
         4'd7:new_address_6 = b7;
         4'd8:new_address_6 = b8;
         4'd9:new_address_6 = b9;
         4'd10:new_address_6 = b10;
         4'd11:new_address_6 = b11;
         4'd12:new_address_6 = b12;
         4'd13:new_address_6 = b13;
         4'd14:new_address_6 = b14;
         4'd15:new_address_6 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_7)
         4'd0:new_address_7 = b0;
         4'd1:new_address_7 = b1;
         4'd2:new_address_7 = b2;
         4'd3:new_address_7 = b3;
         4'd4:new_address_7 = b4;
         4'd5:new_address_7 = b5;
         4'd6:new_address_7 = b6;
         4'd7:new_address_7 = b7;
         4'd8:new_address_7 = b8;
         4'd9:new_address_7 = b9;
         4'd10:new_address_7 = b10;
         4'd11:new_address_7 = b11;
         4'd12:new_address_7 = b12;
         4'd13:new_address_7 = b13;
         4'd14:new_address_7 = b14;
         4'd15:new_address_7 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_8)
         4'd0:new_address_8 = b0;
         4'd1:new_address_8 = b1;
         4'd2:new_address_8 = b2;
         4'd3:new_address_8 = b3;
         4'd4:new_address_8 = b4;
         4'd5:new_address_8 = b5;
         4'd6:new_address_8 = b6;
         4'd7:new_address_8 = b7;
         4'd8:new_address_8 = b8;
         4'd9:new_address_8 = b9;
         4'd10:new_address_8 = b10;
         4'd11:new_address_8 = b11;
         4'd12:new_address_8 = b12;
         4'd13:new_address_8 = b13;
         4'd14:new_address_8 = b14;
         4'd15:new_address_8 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_9)
         4'd0:new_address_9 = b0;
         4'd1:new_address_9 = b1;
         4'd2:new_address_9 = b2;
         4'd3:new_address_9 = b3;
         4'd4:new_address_9 = b4;
         4'd5:new_address_9 = b5;
         4'd6:new_address_9 = b6;
         4'd7:new_address_9 = b7;
         4'd8:new_address_9 = b8;
         4'd9:new_address_9 = b9;
         4'd10:new_address_9 = b10;
         4'd11:new_address_9 = b11;
         4'd12:new_address_9 = b12;
         4'd13:new_address_9 = b13;
         4'd14:new_address_9 = b14;
         4'd15:new_address_9 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_10)
         4'd0:new_address_10 = b0;
         4'd1:new_address_10 = b1;
         4'd2:new_address_10 = b2;
         4'd3:new_address_10 = b3;
         4'd4:new_address_10 = b4;
         4'd5:new_address_10 = b5;
         4'd6:new_address_10 = b6;
         4'd7:new_address_10 = b7;
         4'd8:new_address_10 = b8;
         4'd9:new_address_10 = b9;
         4'd10:new_address_10 = b10;
         4'd11:new_address_10 = b11;
         4'd12:new_address_10 = b12;
         4'd13:new_address_10 = b13;
         4'd14:new_address_10 = b14;
         4'd15:new_address_10 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_11)
         4'd0:new_address_11 = b0;
         4'd1:new_address_11 = b1;
         4'd2:new_address_11 = b2;
         4'd3:new_address_11 = b3;
         4'd4:new_address_11 = b4;
         4'd5:new_address_11 = b5;
         4'd6:new_address_11 = b6;
         4'd7:new_address_11 = b7;
         4'd8:new_address_11 = b8;
         4'd9:new_address_11 = b9;
         4'd10:new_address_11 = b10;
         4'd11:new_address_11 = b11;
         4'd12:new_address_11 = b12;
         4'd13:new_address_11 = b13;
         4'd14:new_address_11 = b14;
         4'd15:new_address_11 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_12)
         4'd0:new_address_12 = b0;
         4'd1:new_address_12 = b1;
         4'd2:new_address_12 = b2;
         4'd3:new_address_12 = b3;
         4'd4:new_address_12 = b4;
         4'd5:new_address_12 = b5;
         4'd6:new_address_12 = b6;
         4'd7:new_address_12 = b7;
         4'd8:new_address_12 = b8;
         4'd9:new_address_12 = b9;
         4'd10:new_address_12 = b10;
         4'd11:new_address_12 = b11;
         4'd12:new_address_12 = b12;
         4'd13:new_address_12 = b13;
         4'd14:new_address_12 = b14;
         4'd15:new_address_12 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_13)
         4'd0:new_address_13 = b0;
         4'd1:new_address_13 = b1;
         4'd2:new_address_13 = b2;
         4'd3:new_address_13 = b3;
         4'd4:new_address_13 = b4;
         4'd5:new_address_13 = b5;
         4'd6:new_address_13 = b6;
         4'd7:new_address_13 = b7;
         4'd8:new_address_13 = b8;
         4'd9:new_address_13 = b9;
         4'd10:new_address_13 = b10;
         4'd11:new_address_13 = b11;
         4'd12:new_address_13 = b12;
         4'd13:new_address_13 = b13;
         4'd14:new_address_13 = b14;
         4'd15:new_address_13 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_14)
         4'd0:new_address_14 = b0;
         4'd1:new_address_14 = b1;
         4'd2:new_address_14 = b2;
         4'd3:new_address_14 = b3;
         4'd4:new_address_14 = b4;
         4'd5:new_address_14 = b5;
         4'd6:new_address_14 = b6;
         4'd7:new_address_14 = b7;
         4'd8:new_address_14 = b8;
         4'd9:new_address_14 = b9;
         4'd10:new_address_14 = b10;
         4'd11:new_address_14 = b11;
         4'd12:new_address_14 = b12;
         4'd13:new_address_14 = b13;
         4'd14:new_address_14 = b14;
         4'd15:new_address_14 = b15;
        default:;
        endcase
        end
        
    
        always@(*)
        begin
        case(sel_a_15)
         4'd0:new_address_15 = b0;
         4'd1:new_address_15 = b1;
         4'd2:new_address_15 = b2;
         4'd3:new_address_15 = b3;
         4'd4:new_address_15 = b4;
         4'd5:new_address_15 = b5;
         4'd6:new_address_15 = b6;
         4'd7:new_address_15 = b7;
         4'd8:new_address_15 = b8;
         4'd9:new_address_15 = b9;
         4'd10:new_address_15 = b10;
         4'd11:new_address_15 = b11;
         4'd12:new_address_15 = b12;
         4'd13:new_address_15 = b13;
         4'd14:new_address_15 = b14;
         4'd15:new_address_15 = b15;
        default:;
        endcase
        end
endmodule