module sevseg(
  input wire clk,
  output reg [6:0] HEX0,
  output reg [6:0] HEX1,
  output reg [6:0] HEX2,
  output reg [6:0] HEX3,
  output reg [6:0] HEX4,
  output reg [6:0] HEX5
);

  integer i=0,j=0;
  
  // 7-segment encoding (Common Anode: Active LOW)
  function [6:0] seg_decode;
    input [3:0] digit;
    case (digit)
      4'h0: seg_decode = 7'b1000000;
      4'h1: seg_decode = 7'b1111001;
      4'h2: seg_decode = 7'b0100100;
      4'h3: seg_decode = 7'b0110000;
      4'h4: seg_decode = 7'b0011001;
      4'h5: seg_decode = 7'b0010010;
      4'h6: seg_decode = 7'b0000010;
      4'h7: seg_decode = 7'b1111000;
      4'h8: seg_decode = 7'b0000000;
      4'h9: seg_decode = 7'b0010000;
      4'hE: seg_decode = 7'b0000110;
      4'hC: seg_decode = 7'b1000110;
      default: seg_decode = 7'b1111111;
    endcase    
  endfunction
  
  always@(posedge clk) begin
    if(i==0)begin
      HEX0 = seg_decode(4'h7);
      HEX1 = seg_decode(4'h8);
      HEX2 = seg_decode(4'h0);
      HEX3 = seg_decode(4'h1);
      HEX4 = seg_decode(4'hC);
      HEX5 = seg_decode(4'hE);
    end
    if(i==1)begin
      HEX0 = seg_decode(4'h5);
      HEX1 = seg_decode(4'h0);
      HEX2 = seg_decode(4'h2);
      HEX3 = seg_decode(4'h1);
      HEX4 = seg_decode(4'hC);
      HEX5 = seg_decode(4'hE);
    end
    j=j+1;
    i=j%2;
  end

endmodule
