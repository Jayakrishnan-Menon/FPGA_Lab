module arrarmultiplier(input [3:0]a,b, output reg [7:0]o);
  
  reg [3:0]ands[3:0];
  reg [2:0]sums[3:0];
  reg [2:0]cars[3:0];
  integer i,j;
  
  always @(*) begin
    
    for(i=0; i<4; i=i+1)begin
      for(j=0; j<4; j=j+1)begin
        ands[i][j]=a[i]&b[j];
      end  
    end
      
    for(i=0; i<3; i=i+1)begin //initial stage
      sums[0][i]=ands[0][i+1]^ands[1][i];
      cars[0][i]=ands[0][i+1]&ands[1][i];
    end
    
    for(i=1; i<3; i=i+1)begin //intermediate stages
      for(j=0; j<2; j=j+1)begin
        sums[i][j]=ands[i+1][j]^cars[i-1][j]^sums[i-1][j+1];
        cars[i][j]=(ands[i+1][j]&cars[i-1][j])|(cars[i-1][j]&sums[i-1][j+1])|(sums[i1][j+1]&ands[i+1][j]);
      end
      sums[i][2]=ands[i+1][2]^cars[i-1][2]^ands[i][3];
      cars[i][2]=(ands[i+1][2]&cars[i-1][2])|(cars[i-1][2]&ands[i][3])|(ands[i][3]&ands[i+1][2]);
    end
    
    //final stage
    sums[3][0]=sums[2][1]^cars[2][0];
    cars[3][0]=sums[2][1]&cars[2][0];
    sums[3][1]=cars[3][0]^cars[2][1]^sums[2][2];
    cars[3][1]=(cars[3][0]&cars[2][1])|(cars[2][1]&sums[2][2])|(sums[2][2]&cars[3][0]);
    sums[3][2]=cars[3][1]^cars[2][2]^ands[3][3];
    cars[3][2]=(cars[3][1]&cars[2][2])|(cars[2][2]&ands[3][3])|(ands[3][3]&cars[3][1]);
    o[7:0]={cars[3][2],sums[3][2:0],sums[2][0],sums[1][0],sums[0][0],ands[0][0]};
  end
  
endmodule
