module seriadd(data_a, data_b, clk, reset, out, cout);
  
  input [3:0] data_a, data_b;
  input clk, rese
  output cout;
  output [3:0] out;
  reg [3:0] out;
  reg [2:0] count;
  reg enable, cout;
  wire wire_a, wire_b, cout_temp, cin, sum;
  
  piso piso_a(clk, enable, reset, data_a, wire_a);
  piso piso_b(clk, enable, reset, data_b, wire_b);
  full_adder adder(wire_a, wire_b, cin, sum, cout_temp);
  d_flipflop dff(cout_temp, clk, enable, reset, cin);
  
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      enable = 1; out = 4'b0000;
    end
    else begin
      cout = cout_temp;
      out = out >> 1;
      out[3] = sum;
    end
  end

endmodule
