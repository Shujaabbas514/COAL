
module comparator(A, B, greater, less, equal);
input [1:0] A;
input [1:0] B;
output reg greater;
output reg less;
output reg equal;
always @*
begin
    if (A > B)
    begin
        greater = 1;
        less = 0;
        equal = 0;
    end

    else if (A < B)
    begin
        greater = 0;
        less = 1;
        equal = 0;
    end

    else
    begin
        greater = 0;
        less = 0;
        equal = 1;
  end
end
endmodule
module testbench();
reg [1:0] A;
reg [1:0] B;
wire greater;
wire less;
wire equal;
comparator c(A, B, greater, less, equal);
initial
begin
A = 2'b11;
B = 2'b01;
#50;
A = 2'b01;
B = 2'b10;
#50;
A = 2'b10;
B = 2'b10;
#50;
end

endmodule
```

