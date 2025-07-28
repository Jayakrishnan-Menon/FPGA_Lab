module singpram(
  input [2:0] data,
  input [5:0] addr,
  input we, clk,
  output [2:0] q
);
  
  reg [2:0] ram[63:0];
  reg [5:0] addr_reg;
  
  always @ (posedge clk) begin
    // Write
    if (we) ram[addr] <= data;
  addr_reg <= addr;
  end
  
  assign q = ram[addr_reg];

endmodule
