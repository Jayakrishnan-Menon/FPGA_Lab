module parallelmultiplier(input [3:0]a,b, output reg [7:0]o);
  
  reg [3:0]ands[3:0];
  reg [3:0]sums[2:0];
  reg [4:0]cars[2:0];
  integer i,j;
  
  always @(*) begin  
    
    for(i=0; i<4; i=i+1) begin
      for(j=0; j<4; j=j+1) begin
        ands[i][j]=a[i]&b[j];
      end
    end
    
    for(i=0; i<3; i=i+1) begin
      cars[i][0]=0;
    end
    
    for(i=0; i<3; i=i+1)begin
      sums[0][i]=(ands[0][i+1])^(ands[1][i])^(cars[0][i]);
      cars[0][i+1]=(ands[0][i+1]&ands[1][i])|(ands[1][i]&cars[0][i])|(cars[0][i]&ands[0][i+1]);
    end
      
    sums[0][3]=(ands[1][3])^(cars[0][3]^1'b0);
    cars[0][4]=(ands[1][3]&cars[0][3])|(cars[0][3]&1'b0)|(1'b0&ands[1][3]);
    
    for(j=1; j<3; j=j+1)begin
      for(i=0; i<3; i=i+1)begin
        sums[j][i]=(sums[j-1][i+1])^(ands[j+1][i])^(cars[j][i]);
        cars[j][i+1]=(sums[j-1][i+1]&ands[j+1][i])|(ands[j+1][i]&cars[j][i])|(cars[j][i]&sums[j1][i+1]);
      end
      sums[j][3]=(ands[j+1][3])^(cars[j][3])^(cars[j-1][4]);
      cars[j][4]=(ands[j+1][3]&cars[j][3])|(cars[j][3]&cars[j-1][4])|(cars[j-1][4]&ands[j+1][3]);
    end
    o[7:0]={cars[2][4],sums[2][3:0],sums[1][0],sums[0][0],ands[0][0]};
  
  end
  
endmodule
