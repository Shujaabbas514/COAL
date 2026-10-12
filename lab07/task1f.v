/*GATE:

module alu_1bit(
    input A,
    input B,
    input carry_in,
    input [1:0] Select,
    input b_inv,
    output Result,
    output carry_out
);

wire b_new;
wire xor1;
wire sum;
wire and1;
wire and2;
wire carry;
wire and_result;
wire or_result;

xor(b_new, B, b_inv);

xor(xor1, A, b_new);
xor(sum, xor1, carry_in);

and(and1, A, b_new);
and(and2, xor1, carry_in);
or(carry, and1, and2);

and(and_result, A, B);
or(or_result, A, B);

assign Result = (Select == 2'b00) ? and_result :
                (Select == 2'b01) ? or_result :
                (Select == 2'b10) ? sum : 1'b0;

assign carry_out = (Select == 2'b10) ? carry : 1'b0;

endmodule
STRUCTURAL LEVEL:

module xor_gate(
    input A,
    input B,
    output Y
);
    assign Y = A ^ B;
endmodule

module and_gate(
    input A,
    input B,
    output Y
);
    assign Y = A & B;
endmodule

module or_gate(
    input A,
    input B,
    output Y
);
    assign Y = A | B;
endmodule

module alu_1bit(
    input A,
    input B,
    input carry_in,
    input [1:0] Select,
    input b_inv,
    output Result,
    output carry_out
);

wire b_new;
wire xor1;
wire sum;
wire and1;
wire and2;
wire carry;
wire and_result;
wire or_result;

xor_gate X0(B, b_inv, b_new);

xor_gate X1(A, b_new, xor1);
xor_gate X2(xor1, carry_in, sum);

and_gate A1(A, b_new, and1);
and_gate A2(xor1, carry_in, and2);
or_gate O1(and1, and2, carry);

and_gate A3(A, B, and_result);
or_gate O2(A, B, or_result);

assign Result = (Select == 2'b00) ? and_result :
                (Select == 2'b01) ? or_result :
                (Select == 2'b10) ? sum : 1'b0;

assign carry_out = (Select == 2'b10) ? carry : 1'b0;

endmodule

DATAFLOW:
*/

module alu_1bit(
    input A,
    input B,
    input carry_in,
    input [1:0] Select,
    input b_inv,
    output reg Result,
    output reg carry_out
);

wire b_new;
wire [1:0] arithmetic_result;

assign b_new = B ^ b_inv;
assign arithmetic_result = A + b_new + carry_in;

always @(*) begin
    carry_out = 1'b0;

    case (Select)
        2'b00: Result = A & B;
        2'b01: Result = A | B;
        2'b10: begin
            Result = arithmetic_result[0];
            carry_out = arithmetic_result[1];
        end
        default: Result = 1'b0;
    endcase
end

endmodule


module tb_alu_1bit;

reg A;
reg B;
reg carry_in;
reg [1:0] Select;
reg b_inv;

wire Result;
wire carry_out;

alu_1bit dut (
    .A(A),
    .B(B),
    .carry_in(carry_in),
    .Select(Select),
    .b_inv(b_inv),
    .Result(Result),
    .carry_out(carry_out)
);

initial begin
 
      A, B, carry_in, Select, b_inv, Result, carry_out);

 
    Select = 2'b00;
    b_inv = 0;
    carry_in = 0;
    A = 0; B = 0; 
   #10;
    A = 0; B = 1; 
   #10;
    A = 1; B = 0; 
   #10;
    A = 1; B = 1;
    #10;

    
    Select = 2'b01;
    A = 0; B = 0; 
   #10;
    A = 0; B = 1;
    #10;
    A = 1; B = 0; 
    #10;
    A = 1; B = 1; 
    #10;

    Select = 2'b10;
    b_inv = 0;
    A = 0; B = 0; carry_in = 0;
    #10;
    A = 0; B = 1; carry_in = 0;
    #10;
    A = 1; B = 0; carry_in = 0;
    #10;
    A = 1; B = 1; carry_in = 0; 
    #10;
    A = 1; B = 1; carry_in = 1;
    #10;

    
    b_inv = 1;
    carry_in = 1;
    A = 0; B = 0; 
    #10;
    A = 0; B = 1; 
    #10;
    A = 1; B = 0;
    #10;
    A = 1; B = 1;
    #10;

end

endmodule


