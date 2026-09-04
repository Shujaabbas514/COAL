module mux8to1(Y,I,S);

input [7:0] I;
input [2:0] S;
output Y;

assign Y = (~S[2] & ~S[1] & ~S[0] & I[0]) |
           (~S[2] & ~S[1] & S[0] & I[1]) |
           (~S[2] & S[1] & ~S[0] & I[2]) |
           (~S[2] & S[1] & S[0] & I[3]) |
           (S[2] & ~S[1] & ~S[0] & I[4]) |
           (S[2] & ~S[1] & S[0] & I[5]) |
           (S[2] & S[1] & ~S[0] & I[6]) |
           (S[2] & S[1] & S[0] & I[7]);

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
