module logicgateAND(inputA,inputB,andout);
input inputA;
input inputB;
output andout;
and(andout,inputA,inputB);
endmodule

module logicgateOR(inputA,inputB,orout);
input inputA;
input inputB;
output orout;
or(orout,inputA,inputB);
endmodule

module logicgateNOT(inputA,notout);
input inputA;
output notout;
not(notout,inputA);
endmodule

module testbench();
reg inputA;
reg inputB;
wire notA;
logicgateNOT G1(inputA,notA);
wire notB;
logicgateNOT G2(inputB,notB);
wire AnotandB;
logicgateAND G3(notA,inputB,AnotandB);
wire BnotandA;
logicgateAND G4(inputA,notB,BnotandA);
wire finalout;
logicgateOR G5(AnotandB,BnotandA,finalout);
initial
begin
inputA=0; inputB=0;
#50 inputA=0; inputB=1;
#50 inputA=1; inputB=0;
#50 inputA=1; inputB=1;
end
endmodule
