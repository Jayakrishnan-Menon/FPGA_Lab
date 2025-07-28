module mooreofive(input clk, rst, ip, output reg [3:0]y, output reg op);
  
  reg [3:0]Y,A,B,C,D,E,F,G,H,I;
  reg ph;
  
  initial begin
    A=4'b0000; B=4'b0001; C=4'b0010; D=4'b0011;
    E=4'b0100; F=4'b0101; G=4'b0110; H=4'b0111;
    I=4'b1000;
    y=A; Y=4'bxxxx; op=1'bx;
    //y=currentstate Y=nextstate op=currentoutput ph=placeholder HEX1=op HEX0=st
  end

  always@(y,ip) begin //COMBINATIONAL LOGIC
    case(y)
      A: if(ip==0) begin Y=B; ph=1'b0; end
         else      begin Y=A; ph=1'b0; end
      B: if(ip==0) begin Y=C; ph=1'b0; end
         else      begin Y=A; ph=1'b0; end
      C: if(ip==0) begin Y=D; ph=1'b0; end
         else      begin Y=A; ph=1'b0; end
      D: if(ip==0) begin Y=E; ph=1'b0; end
         else      begin Y=A; ph=1'b0; end
      E: if(ip==0) begin Y=F; ph=1'b0; end
         else      begin Y=A; ph=1'b0; end
      F: if(ip==1) begin Y=G; ph=1'b0; end
         else      begin Y=F; ph=1'b0; end
      G: if(ip==0) begin Y=H; ph=1'b0; end
         else      begin Y=A; ph=1'b0; end
      H: if(ip==1) begin Y=I; ph=1'b1; end
         else      begin Y=A; ph=1'b0; end
      I: if(ip==0) begin Y=H; ph=1'b0; end
         else      begin Y=A; ph=1'b0; end
      default: begin Y=4'bxxxx; ph=1'bx; end
    endcase    
  end
  
  always@(posedge clk) begin //SEQUENTIAL PART
    if(rst==1) begin y<=A; op=1'b0; end
    else       begin y<=Y; op<=ph; end
  end

endmodule
