
module alu_32bit(
    input [31:0] a,
    input [31:0] b,
    input [3:0] alu_op,
    output reg [31:0] result,
    output zero
);

always @(*) begin
    case (alu_op)

        4'b0000: result = a + b;         
        4'b0001: result = a - b;        
        4'b0010: result = a & b;         
        4'b0011: result = a | b;        
        4'b0100: result = a ^ b;          

        4'b0101: begin                  
            if ($signed(a) < $signed(b))
                result = 32'd1;
            else
                result = 32'd0;
        end

        4'b0110: begin                    
            if (a < b)
                result = 32'd1;
            else
                result = 32'd0;
        end

        4'b0111: result = a << b[4:0];    
        4'b1000: result = a >> b[4:0];    
        4'b1001: result = $signed(a) >>> b[4:0];

        default: result = 32'b0;

    endcase
end

assign zero = (result == 32'b0);

endmodule

module tb_alu_32bit;

reg [31:0] a;
reg [31:0] b;
reg [3:0] alu_op;

wire [31:0] result;
wire zero;

alu_32bit uut(
    .a(a),
    .b(b),
    .alu_op(alu_op),
    .result(result),
    .zero(zero)
);

initial begin
    
    a = 32'd10;
    b = 32'd5;
    alu_op = 4'b0000; 
    #10;

    a = 32'd10;
    b = 32'd10;
    alu_op = 4'b0001; 
    #10;

    a = 32'h0000000F;
    b = 32'h00000003;
    alu_op = 4'b0010;
    #10;


    a = 32'h0000000F;
    b = 32'h00000003;
    alu_op = 4'b0011; 
    #10;

    a = 32'h0000000F;
    b = 32'h00000003;
    alu_op = 4'b0100;
    #10;
    a = -32'sd5;
    b = 32'd3;
    alu_op = 4'b0101; 
    #10;
    a = 32'd3;
    b = 32'd5;
    alu_op = 4'b0110; 
    #10;
    a = 32'd1;
    b = 32'd3;
    alu_op = 4'b0111; 
    #10;
    a = 32'd16;
    b = 32'd2;
    alu_op = 4'b1000;
    #10;
    a = 32'hfffffff8;
    b = 32'd1;
    alu_op = 4'b1001;
    #10;
end

endmodule
