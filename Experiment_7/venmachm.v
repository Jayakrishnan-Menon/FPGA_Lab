module venmachm(
  input clk,
  input rst, 
  input [1:0] coin,
  output reg chocolate,
  output reg chips,
  output reg biscuit
);
  
  parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011 ,S4= 3'b100;
  reg[2:0] state,next_state;
  
  always @(posedge clk or posedge rst) begin
    if (rst) state <= S0;
    else     state <= next_state;
  end

  always @(*) begin
    next_state = state;
    chocolate = 0;
    chips=0;
    biscuit=0;
    case (state)
      S0: begin
        if      (coin == 2'b01) next_state = S1;
        else if (coin == 2'b10) next_state = S2;
      end
      S1: begin
        if      (coin == 2'b01) next_state = S2;
        else if (coin == 2'b10) next_state = S3;
      end
      S2: begin
        biscuit =1;
        if      (coin == 2'b01) next_state = S3;
        else if (coin == 2'b10) next_state = S4;
      end
      S3: begin
        chocolate =1;
        if(coin==2'b01) next_state=S4;
      end
      S4: begin
        chips =1;
        next_state=S0;
      end    
    endcase
  end

endmodule
