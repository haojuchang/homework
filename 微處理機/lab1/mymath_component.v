module abs(y, x)

	output reg[31:0] y;
	input [31:0] x;
	
	always @ (x)
	begin
		y = (x[31] == 0) ? x : -x;
	end
	
endmodule

module is_odd(y, x);

	output reg [31:0] y;
	input [31:0] x;
	
	always @ (x)
	begin
		y = x & 1'b1;
	end
	
endmodule
