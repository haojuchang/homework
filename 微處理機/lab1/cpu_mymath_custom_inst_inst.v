// cpu_mymath_custom_inst_inst.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module cpu_mymath_custom_inst_inst (
		output wire [31:0] result, // nios_custom_instruction_slave_0.result
		input  wire [31:0] dataa,  //                                .dataa
		input  wire        n       //                                .n
	);

	mymath_custom_inst cpu_mymath_custom_inst_inst (
		.result (result), // nios_custom_instruction_slave_0.result
		.dataa  (dataa),  //                                .dataa
		.n      (n)       //                                .n
	);

endmodule
