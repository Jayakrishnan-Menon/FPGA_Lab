module mealyofive(input clk, rst, ip, output reg op);
  
  reg [2:0]y,Y,A,B,C,D,E,F,G,H;
  initial begin
    A=4'b000; B=4'b001; C=4'b010; D=4'b011;
    E=4'b100; F=4'b101; G=4'b110; H=4'b111;
    y=A; Y=3'bxxx; op=1'b0;
    //y=currentstate Y=nextstate op=currentoutput HEX1=op HEX0=st
  end

  always@(y,ip)begin //COMBINATIONAL LOGIC
    case(y)
      A: if(ip==0) begin Y=B; op=1'b0; end
         else      begin Y=A; op=1'b0; end
      B: if(ip==0) begin Y=C; op=1'b0; end
         else      begin Y=A; op=1'b0; end
      C: if(ip==0) begin Y=D; op=1'b0; end
         else      begin Y=A; op=1'b0; end
      D: if(ip==0) begin Y=E; op=1'b0; end
         else      begin Y=A; op=1'b0; end
      E: if(ip==0) begin Y=F; op=1'b0; end
         else      begin Y=A; op=1'b0; end
      F: if(ip==1) begin Y=G; op=1'b0; end
         else      begin Y=F; op=1'b0; end
      G: if(ip==0) begin Y=H; op=1'b0; end
         else      begin Y=A; op=1'b0; end
      H: if(ip==1) begin Y=G; op=1'b1; end
         else      begin Y=A; op=1'b0; end
      default:     begin Y=3'bxxx; op=1'bx; end
    endcase    
  end

  always@(posedge clk)begin //SEQUENTIAL PART
    if(rst==1) begin y<=A; end
    else       begin y<=Y; end
  end

endmodule
