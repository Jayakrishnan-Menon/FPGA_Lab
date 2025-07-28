module Dual_Port_RAM(
  input clk,
  input we_a,
  input we_b,
  input [3:0] addr_a,
  input [3:0] addr_b,
  input [7:0] din_a,
  input [7:0] din_b,
  output reg [7:0] dout_a,
  output reg [7:0] dout_b
);

  reg [7:0] ram [15:0];
  always @(posedge clk) begin
    // Port A operations
    if (we_a) ram[addr_a] <= din_a;
    dout_a <= ram[addr_a]; // Ensure read after write is handled correctly
    // Port B operations
    if (we_b) ram[addr_b] <= din_b;
    dout_b <= ram[addr_b]; // Ensure read after write is handled correctly
  end
    
endmodule 
