module singprom(
  input [5:0] addr,
  input clk,
  output [3:0] q
);
  
  reg [3:0] rom[63:0];
  reg [5:0] addr_reg;
  
  initial begin
    rom[0]=4'b0000;
    rom[1]=4'b0001;
    rom[2]=4'b0010;
    rom[3]=4'b0011;
    rom[4]=4'b0100;
    rom[5]=4'b0101;
    rom[6]=4'b0110;
    rom[7]=4'b0111;
    rom[8]=4'b1000;
    rom[9]=4'b1001;
    rom[10]=4'b1010;
    rom[11]=4'b1011;
    rom[12]=4'b1100;
    rom[13]=4'b1101;
    rom[14]=4'b1110;
    rom[15]=4'b1111;
  end

  always @ (posedge clk) begin
    addr_reg <= addr;
  end

  assign q = rom[addr_reg];

endmodule
