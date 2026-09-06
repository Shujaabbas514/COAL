module addsub(inputA,inputB,ctrl,out);
input [3:0] inputA;
input [3:0] inputB;
input ctrl;
output reg [3:0] out;
always @*
begin
if (ctrl==1)
out=inputA-inputB;
else
out=inputA+inputB;
end

endmodule

module testbench();
reg [3:0] A;
reg [3:0] B;
reg control;
wire [3:0] result;
addsub uut(A,B,control,result);
initial
begin
A=4'b0011;
B=4'b1100;
control=0;
#50;
A = 4'b0110;
B = 4'b0010;
control = 1;
#50;
end
endmodule


