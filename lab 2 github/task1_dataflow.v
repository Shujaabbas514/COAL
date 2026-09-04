
module halfadder(sum,carry,inputA,inputB);
input inputA,inputB;
output sum,carry;
assign sum=inputA^inputB;
assign carry=inputA+inputB;
endmodule

module fulladder(SUM,cout,inputA,inputB,Cin);
input inputA,inputB,Cin;
output SUM,cout;

wire sum1,c1,c2;
halfadder h1(sum1,c1,inputA,inputB);
halfadder h2(SUM,c2,sum1,Cin);
assign cout=c1|c2;
endmodule

module testbench;

reg inputA,inputB,Cin;
wire sum,carry;
wire SUM,cout;
halfadder HA(sum,carry,inputA,inputB);
fulladder FA(SUM,cout,inputA,inputB,Cin);
initial
begin

    inputA = 0;
    inputB = 0;
    Cin = 0;
    #50;
    inputA = 0;
    inputB = 0;
    Cin = 1;
    #50;
    inputA = 0;
    inputB = 1;
    Cin = 0;
    #50;
    inputA = 0;
    inputB = 1;
    Cin = 1;
    #50;
    inputA = 1;
    inputB = 0;
    Cin = 0;
    #50;
    inputA = 1;
    inputB = 0;
    Cin = 1;
    #50;
    inputA = 1;
    inputB = 1;
    Cin = 0;
    #50;
    inputA = 1;
    inputB = 1;
    Cin = 1;
    #50;

end
endmodule