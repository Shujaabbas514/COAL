//module compliment(inputA,outputA);
//input [3:0] inputA;
//output [3:0] outputA;
//not(outputA[0],inputA[0]);
//not(outputA[1],inputA[1]);
//not(outputA[2],inputA[2]);
//not(outputA[3],inputA[3]);
//endmodule
module compliment(inputA,outputA);
input [3:0] inputA;
output [3:0] outputA;
assign outputA[0]=~inputA[0];
assign outputA[1]=~inputA[1];
assign outputA[2]=~inputA[2];
assign outputA[3]=~inputA[3];
endmodule

module testbench();
reg [3:0] inputA;
wire [3:0] outputA;
compliment G1(inputA,outputA);

initial
begin
    inputA = 4'b0000;
    #50 inputA = 4'b0001;
    #50 inputA = 4'b1010;
    #50 inputA = 4'b1111;
end

endmodule


