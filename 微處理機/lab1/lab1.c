module DE0_base1{
	CLOCK_50,
	//SDRAM
	DARM_CLK,
	DARM_ADDR,
	DARM_DQ,
	DARM_BA_1,
	DARM_BA_0,
	DARM_CAS_N,
	DARM_CKE,
	DARM_CS_N,
	DARM_UDQM,
	DARM_LDQM,
	DARM_RAS_N,
	DARM_WE_N
	);
	
	input CLOCK_50;
	
	// IO for SDRAM
	output wire [11:0] DRAM_ADDR;
	inout wire [15:0] DRAM_DQ;
	output wire DARM_CLK;
	output wire DARM_BA_1;
	output wire DARM_BA_0;
	output wire DARM_CAS_N;
	output wire DARM_CKE;
	output wire DARM_CS_N;
	output wire DARM_UDQM;
	output wire DARM_LDQM;
	output wire DARM_RAS_N;
	output wire DARM_WE_N;
             
	// Internal Wires
	wire [1:0] SYNTHESIZED_WIRE_0;
	wire [1:0] SYNTHESIZED_WIRE_1;
	assign DRAM_BA_1 = SYSTHESIZED_WIRE_0[1];
	assign DRAM_BA_0 = SYSTHESIZED_WIRE_0[0];
	assign DRAM_UDQM = SYSTHESIZED_WIRE_1[1];
	assign DRAM_LDQM = SYSTHESIZED_WIRE_1[0];
	
	
	DE0_base1_sopc DE0_base1_sopc_inst( .clk_0(CLOCK_50),
										.clk_pllc0(DRAM_CLK),
										.reset_n(1'b1),
										.zs_dq_to_and_from_the_sdram 	{DRAM_DQ},
										.zs_cas_n_from_the_sdram 		{DARM_CAS_N},
										.zs_cas_from_the_sdram 			{DARM_CKE},
										.zs_cke_from_the_sdram 			{DARM_CS_N},
										.zs_cs_n_from_the_sdram 		{DARM_RAS_N},
										.zs_ras_n_from_the_sdram 		{DARM_WE_N},
										.zs_we_n_from_the_sdram 		{DRAM_ADDR},
										.zs_addr_from_the_sdram 		{SYNTHESIZED_WIRE_0},
										.zs_ba_from_the_sdram 			{SYNTHESIZED_WIRE_1},
										);
endmodule
