module vendmach(input clk, rst, input [1:0]ip, output reg op);
  
  reg [1:0]y,Y,A,B,C,D;
  initial begin
    A=2'b00; B=2'b01; C=2'b10; D=2'b11;
    y=A; Y=2'bxx; op=1'b0;
    //y=currentstate Y=nextstate op=currentoutput HEX1=op HEX0=st
  end

  always@(y,ip)begin //COMBINATIONAL LOGIC
    case(y)
      A: if      (ip==2'b01) begin Y=B; op=1'b0; end
         else if (ip==2'b10) begin Y=C; op=1'b0; end
         else if (ip==2'b00) begin Y=A; op=1'b0; end
      B: if      (ip==2'b01) begin Y=C; op=1'b0; end
         else if (ip==2'b10) begin Y=D; op=1'b1; end
         else if (ip==2'b00) begin Y=B; op=1'b0; end
      C: if      (ip==2'b01) begin Y=D; op=1'b1; end
         else if (ip==2'b10) begin Y=C; op=1'b0; end
         else if (ip==2'b00) begin Y=C; op=1'b0; end
      D: if      (ip==2'b01) begin Y=B; op=1'b0; end
         else if (ip==2'b10) begin Y=C; op=1'b0; end
         else if (ip==2'b00) begin Y=D; op=1'b0; end
         else if (ip==2'b11) begin Y=A; op=1'b0; end //jump to start after transaction
      default: begin Y=2'bxx; op=1'bx; end    
    endcase    
  end
  
  always@(posedge clk)begin //SEQUENTIAL PART
    if(rst==1) begin y<=A; end
    else       begin y<=Y; end
  end
 
endmodule
