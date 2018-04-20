module mymath_custom_inst(result, dataa, n);
	output reg [31:0] result;
	input [31:0] dataa;
	input n;
	
	wire[31:0] result_abs;
	wire[31:0] result_is_odd;
	
	abs abs_inst(result_abs, dataa);
	is_odd is_odd_inst(result_is_odd, dataa);
	
	always @(n)
	begin
		case(n)
			0: result = result_abs;
			1: result = result_is_odd;
			endcase
		end
endmodule
