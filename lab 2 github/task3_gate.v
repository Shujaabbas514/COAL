
module mux8to1(Y,I,S);

input [7:0] I;
input [2:0] S;
output Y;

wire nS2,nS1,nS0;
wire w0,w1,w2,w3,w4,w5,w6,w7;

not(nS2,S[2]);
not(nS1,S[1]);
not(nS0,S[0]);

and(w0,I[0],nS2,nS1,nS0);
and(w1,I[1],nS2,nS1,S[0]);
and(w2,I[2],nS2,S[1],nS0);
and(w3,I[3],nS2,S[1],S[0]);
and(w4,I[4],S[2],nS1,nS0);
and(w5,I[5],S[2],nS1,S[0]);
and(w6,I[6],S[2],S[1],nS0);
and(w7,I[7],S[2],S[1],S[0]);

or(Y,w0,w1,w2,w3,w4,w5,w6,w7);

endmodule


module testbench;

reg [7:0] I;
reg [2:0] S;

wire Y;

mux8to1 MUX(Y,I,S);

initial
begin

    I = 8'b10101010;

    S = 3'b000;
    #50;

    S = 3'b001;
    #50;

    S = 3'b010;
    #50;

    S = 3'b011;
    #50;

    S = 3'b100;
    #50;

    S = 3'b101;
    #50;

    S = 3'b110;
    #50;

    S = 3'b111;
    #50;

end

endmodule