
module alu_1bit(
    input A,
    input B,
    input carry_in,
    input [1:0] Select,
    input b_inv,
    input Less,
    output reg Result,
    output carry_out
);

wire B_new;
wire Sum;
wire Carry;

assign B_new = B ^ b_inv;
assign {Carry, Sum} = A + B_new + carry_in;
assign carry_out = Carry;

always @(*) begin
    case (Select)
        2'b00: Result = A & B;
        2'b01: Result = A | B;
        2'b10: Result = Sum;
        2'b11: Result = Less;
        default: Result = 1'b0;
    endcase
end

endmodule

module alu_4bit(
    input [3:0] A,
    input [3:0] B,
    input [1:0] Select,
    input b_inv,
    output [3:0] Result,
    output CF,
    output SF,
    output ZF,
    output OF
);

wire [4:0] C;
wire [3:0] Less;
wire [3:0] Sub_Result;
assign C[0] = b_inv;
assign Sub_Result = A + (~B) + 1'b1;
assign Less[0] = ($signed(A) < $signed(B));
assign Less[1] = 1'b0;
assign Less[2] = 1'b0;
assign Less[3] = 1'b0;

alu_1bit bit0(
    A[0], B[0], C[0], Select, b_inv,
    Less[0], Result[0], C[1]
);

alu_1bit bit1(
    A[1], B[1], C[1], Select, b_inv,
    Less[1], Result[1], C[2]
);

alu_1bit bit2(
    A[2], B[2], C[2], Select, b_inv,
    Less[2], Result[2], C[3]
);

alu_1bit bit3(
    A[3], B[3], C[3], Select, b_inv,
    Less[3], Result[3], C[4]
);

assign CF = C[4];
assign SF = Result[3];
assign ZF = (Result == 4'b0000);
assign OF = C[3] ^ C[4];

endmodule

module tb_alu_4bit;

reg [3:0] A;
reg [3:0] B;
reg [1:0] Select;
reg b_inv;

wire [3:0] Result;
wire CF, SF, ZF, OF;

alu_4bit uut(
    .A(A),
    .B(B),
    .Select(Select),
    .b_inv(b_inv),
    .Result(Result),
    .CF(CF),
    .SF(SF),
    .ZF(ZF),
    .OF(OF)
);

initial begin
    
    A=4'b1010; B=4'b1100;
    Select=2'b00; b_inv=0; #10;

    A=4'b1010; B=4'b1100;
    Select=2'b01; b_inv=0; #10;

    A=4'b0011; B=4'b0010;
    Select=2'b10; b_inv=0; #10;

    A=4'b0101; B=4'b0011;
    Select=2'b10; b_inv=1; #10;

    A=4'b1101; B=4'b0010;
    Select=2'b11; b_inv=1; #10;

    A=4'b0101; B=4'b0101;
    Select=2'b10; b_inv=1; #10;

    
end

endmodule