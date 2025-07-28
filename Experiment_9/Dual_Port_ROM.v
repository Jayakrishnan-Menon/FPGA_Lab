module Dual_Port_ROM (
  input [3:0] addr_a, addr_b, // Two 4-bit address inputs
  output reg [7:0] data_a, data_b // Two 8-bit data outputs
);

  // ROM Memory Initialization (Preloaded values)
  reg [7:0] rom [15:0];
  initial begin
    rom[0] = 8'h12; rom[1] = 8'h34; rom[2] = 8'h56; rom[3] = 8'h78;
    rom[4] = 8'h9A; rom[5] = 8'hBC; rom[6] = 8'hDE; rom[7] = 8'hF0;
    rom[8] = 8'h11; rom[9] = 8'h22; rom[10] = 8'h33; rom[11] = 8'h44;
    rom[12] = 8'h55; rom[13] = 8'h66; rom[14] = 8'h77; rom[15] = 8'h88;
  end

  always @(*) begin
    data_a = rom[addr_a]; // Read data from address A
    data_b = rom[addr_b]; // Read data from address B
  end

endmodule
