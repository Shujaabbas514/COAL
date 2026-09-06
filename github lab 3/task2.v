module mux(inputA,inputB,sel,out);
input inputA;
input inputB;
input sel;
output reg out;
always @*
begin
if(sel==0)
out=inputA & inputB;
else
out=inputB | inputA;
end
endmodule

module testbench();
reg A;
reg B;
reg s;
wire out;
mux m(A,B,s,out);
initial
begin
A=1;
B=0;
s=0;
#50;
A=1;
B=0;
s=1;
#50;
end
endmodule


