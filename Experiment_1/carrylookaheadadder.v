module carrylookaheadadder(input [3:0]a,b, output reg [3:0]c,s);
  
  reg [3:0]p,g;
  integer i;
  reg cin=1'b0;
  
  always@(*) begin
    s=4'b0000;
    p[0] = a[0]^b[0];
    g[0] = a[0]&b[0];
    s[0] = p[0]^cin;
    c[0] = g[0]|(p[0]&cin);
    for(i=1; i<4; i=i+1) begin
      p[i] = a[i]^b[i];
      g[i] = a[i]&b[i];
      s[i] = p[i]^c[i-1];
      c[i] = g[i]|(p[i]&c[i-1]);
    end
  end

endmodule
