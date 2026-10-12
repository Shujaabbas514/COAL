
module parameterized_alu #(parameter n = 4)(
    input [n-1:0] a,
    input [n-1:0] b,
    input [2:0] select,
    output reg [n-1:0] result
);

always @(*) begin
    case (select)
        3'b000: result = a + b;
        3'b001: result = a - b;
        3'b010: result = a & b;
        3'b011: result = a | b;
        3'b100: result = ~a;
        3'b101: result = a ^ b;
        default: result = 0;
    endcase
end

endmodule

module tb_parameterized_alu;

parameter n = 4;

reg [n-1:0] a;
reg [n-1:0] b;
reg [2:0] select;

wire [n-1:0] result;

parameterized_alu #(n) uut(
    .a(a),
    .b(b),
    .select(select),
    .result(result)
);

initial begin
   
    a = 4'b0101;
    b = 4'b0011;

    select = 3'b000;
    #10;
    select = 3'b001; 
    #10;
    select = 3'b010;
    #10;
    select = 3'b011;
    #10;
    select = 3'b100; 
    #10;
    select = 3'b101;
    #10;

end

endmodule