module twobitmultiplier(input [1:0]a,b, output [3:0]c);
  
  assign c[0] = (a[0]&b[0]);
  assign c[1] = (a[0]&b[1]) ^ (a[1]&b[0]);
  assign c[2] = (a[1]&b[1]) ^ ((a[0]&b[1]) & (a[1]&b[0]));
  assign c[3] = (a[1]&b[1]) & ((a[0]&b[1]) & (a[1]&b[0]));
  
endmodule
