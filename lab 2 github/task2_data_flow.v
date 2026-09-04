module decoder3to8(Y,A,B,C);

input A,B,C;
output [7:0] Y;

assign Y[0] = ~A & ~B & ~C;
assign Y[1] = ~A & ~B & C;
assign Y[2] = ~A & B & ~C;
assign Y[3] = ~A & B & C;
assign Y[4] = A & ~B & ~C;
assign Y[5] = A & ~B & C;
assign Y[6] = A & B & ~C;
assign Y[7] = A & B & C;

endmodule


module testbench;

reg A,B,C;
wire [7:0] Y;

decoder3to8 D(Y,A,B,C);

initial
begin

    A = 0;
    B = 0;
    C = 0;
    #50;

    A = 0;
    B = 0;
    C = 1;
    #50;

    A = 0;
    B = 1;
    C = 0;
    #50;

    A = 0;
    B = 1;
    C = 1;
    #50;

    A = 1;
    B = 0;
    C = 0;
    #50;

    A = 1;
    B = 0;
    C = 1;
    #50;

    A = 1;
    B = 1;
    C = 0;
    #50;

    A = 1;
    B = 1;
    C = 1;
    #50;

end

endmodule
