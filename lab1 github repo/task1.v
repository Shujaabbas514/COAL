module logicgateAND(inputA,inputB,andout);
input inputA;
input inputB;
output andout;
and a1(andout,inputA,inputB);
endmodule

module logicgateOR(inputA,inputB,orout);
input inputA;
input inputB;
output orout;
or a1(orout,inputA,inputB);
endmodule

module logicgateNOT(inputA,notout);
input inputA;
output notout;
not a1(notout,inputA);
endmodule

module testbench();
reg inputA;
reg inputB;
wire AND;
logicgateAND uup(inputA,inputB,AND);
wire OR;
logicgateOR uut(inputB,inputB,OR);
wire NOT;
logicgateNOT abc(inputA,NOT);

initial
begin
inputA=0; inputB=0;
#50 inputA=0; inputB=1;
#50 inputA=1; inputB=0;
#50 inputA=1; inputB=1;
end
endmodule
