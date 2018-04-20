//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2018 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_base1_sopc_clock_0_in_arbitrator (
                                              // inputs:
                                               DE0_base1_sopc_clock_0_in_endofpacket,
                                               DE0_base1_sopc_clock_0_in_readdata,
                                               DE0_base1_sopc_clock_0_in_waitrequest,
                                               clk,
                                               cpu_instruction_master_address_to_slave,
                                               cpu_instruction_master_latency_counter,
                                               cpu_instruction_master_read,
                                               reset_n,

                                              // outputs:
                                               DE0_base1_sopc_clock_0_in_address,
                                               DE0_base1_sopc_clock_0_in_byteenable,
                                               DE0_base1_sopc_clock_0_in_endofpacket_from_sa,
                                               DE0_base1_sopc_clock_0_in_nativeaddress,
                                               DE0_base1_sopc_clock_0_in_read,
                                               DE0_base1_sopc_clock_0_in_readdata_from_sa,
                                               DE0_base1_sopc_clock_0_in_reset_n,
                                               DE0_base1_sopc_clock_0_in_waitrequest_from_sa,
                                               DE0_base1_sopc_clock_0_in_write,
                                               cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in,
                                               cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in,
                                               cpu_instruction_master_read_data_valid_DE0_base1_sopc_clock_0_in,
                                               cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in,
                                               d1_DE0_base1_sopc_clock_0_in_end_xfer
                                            )
;

  output  [ 23: 0] DE0_base1_sopc_clock_0_in_address;
  output  [  3: 0] DE0_base1_sopc_clock_0_in_byteenable;
  output           DE0_base1_sopc_clock_0_in_endofpacket_from_sa;
  output  [ 21: 0] DE0_base1_sopc_clock_0_in_nativeaddress;
  output           DE0_base1_sopc_clock_0_in_read;
  output  [ 31: 0] DE0_base1_sopc_clock_0_in_readdata_from_sa;
  output           DE0_base1_sopc_clock_0_in_reset_n;
  output           DE0_base1_sopc_clock_0_in_waitrequest_from_sa;
  output           DE0_base1_sopc_clock_0_in_write;
  output           cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in;
  output           cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in;
  output           cpu_instruction_master_read_data_valid_DE0_base1_sopc_clock_0_in;
  output           cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in;
  output           d1_DE0_base1_sopc_clock_0_in_end_xfer;
  input            DE0_base1_sopc_clock_0_in_endofpacket;
  input   [ 31: 0] DE0_base1_sopc_clock_0_in_readdata;
  input            DE0_base1_sopc_clock_0_in_waitrequest;
  input            clk;
  input   [ 25: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            reset_n;

  wire    [ 23: 0] DE0_base1_sopc_clock_0_in_address;
  wire             DE0_base1_sopc_clock_0_in_allgrants;
  wire             DE0_base1_sopc_clock_0_in_allow_new_arb_cycle;
  wire             DE0_base1_sopc_clock_0_in_any_bursting_master_saved_grant;
  wire             DE0_base1_sopc_clock_0_in_any_continuerequest;
  wire             DE0_base1_sopc_clock_0_in_arb_counter_enable;
  reg              DE0_base1_sopc_clock_0_in_arb_share_counter;
  wire             DE0_base1_sopc_clock_0_in_arb_share_counter_next_value;
  wire             DE0_base1_sopc_clock_0_in_arb_share_set_values;
  wire             DE0_base1_sopc_clock_0_in_beginbursttransfer_internal;
  wire             DE0_base1_sopc_clock_0_in_begins_xfer;
  wire    [  3: 0] DE0_base1_sopc_clock_0_in_byteenable;
  wire             DE0_base1_sopc_clock_0_in_end_xfer;
  wire             DE0_base1_sopc_clock_0_in_endofpacket_from_sa;
  wire             DE0_base1_sopc_clock_0_in_firsttransfer;
  wire             DE0_base1_sopc_clock_0_in_grant_vector;
  wire             DE0_base1_sopc_clock_0_in_in_a_read_cycle;
  wire             DE0_base1_sopc_clock_0_in_in_a_write_cycle;
  wire             DE0_base1_sopc_clock_0_in_master_qreq_vector;
  wire    [ 21: 0] DE0_base1_sopc_clock_0_in_nativeaddress;
  wire             DE0_base1_sopc_clock_0_in_non_bursting_master_requests;
  wire             DE0_base1_sopc_clock_0_in_read;
  wire    [ 31: 0] DE0_base1_sopc_clock_0_in_readdata_from_sa;
  reg              DE0_base1_sopc_clock_0_in_reg_firsttransfer;
  wire             DE0_base1_sopc_clock_0_in_reset_n;
  reg              DE0_base1_sopc_clock_0_in_slavearbiterlockenable;
  wire             DE0_base1_sopc_clock_0_in_slavearbiterlockenable2;
  wire             DE0_base1_sopc_clock_0_in_unreg_firsttransfer;
  wire             DE0_base1_sopc_clock_0_in_waitrequest_from_sa;
  wire             DE0_base1_sopc_clock_0_in_waits_for_read;
  wire             DE0_base1_sopc_clock_0_in_waits_for_write;
  wire             DE0_base1_sopc_clock_0_in_write;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in;
  wire             cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in;
  wire             cpu_instruction_master_read_data_valid_DE0_base1_sopc_clock_0_in;
  wire             cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in;
  wire             cpu_instruction_master_saved_grant_DE0_base1_sopc_clock_0_in;
  reg              d1_DE0_base1_sopc_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE0_base1_sopc_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_DE0_base1_sopc_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE0_base1_sopc_clock_0_in_end_xfer;
    end


  assign DE0_base1_sopc_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in));
  //assign DE0_base1_sopc_clock_0_in_readdata_from_sa = DE0_base1_sopc_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_readdata_from_sa = DE0_base1_sopc_clock_0_in_readdata;

  assign cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in = (({cpu_instruction_master_address_to_slave[25 : 24] , 24'b0} == 26'h1000000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //assign DE0_base1_sopc_clock_0_in_waitrequest_from_sa = DE0_base1_sopc_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_waitrequest_from_sa = DE0_base1_sopc_clock_0_in_waitrequest;

  //DE0_base1_sopc_clock_0_in_arb_share_counter set values, which is an e_mux
  assign DE0_base1_sopc_clock_0_in_arb_share_set_values = 1;

  //DE0_base1_sopc_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign DE0_base1_sopc_clock_0_in_non_bursting_master_requests = cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in;

  //DE0_base1_sopc_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE0_base1_sopc_clock_0_in_any_bursting_master_saved_grant = 0;

  //DE0_base1_sopc_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_arb_share_counter_next_value = DE0_base1_sopc_clock_0_in_firsttransfer ? (DE0_base1_sopc_clock_0_in_arb_share_set_values - 1) : |DE0_base1_sopc_clock_0_in_arb_share_counter ? (DE0_base1_sopc_clock_0_in_arb_share_counter - 1) : 0;

  //DE0_base1_sopc_clock_0_in_allgrants all slave grants, which is an e_mux
  assign DE0_base1_sopc_clock_0_in_allgrants = |DE0_base1_sopc_clock_0_in_grant_vector;

  //DE0_base1_sopc_clock_0_in_end_xfer assignment, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_end_xfer = ~(DE0_base1_sopc_clock_0_in_waits_for_read | DE0_base1_sopc_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_DE0_base1_sopc_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE0_base1_sopc_clock_0_in = DE0_base1_sopc_clock_0_in_end_xfer & (~DE0_base1_sopc_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE0_base1_sopc_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_DE0_base1_sopc_clock_0_in & DE0_base1_sopc_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_DE0_base1_sopc_clock_0_in & ~DE0_base1_sopc_clock_0_in_non_bursting_master_requests);

  //DE0_base1_sopc_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_0_in_arb_share_counter <= 0;
      else if (DE0_base1_sopc_clock_0_in_arb_counter_enable)
          DE0_base1_sopc_clock_0_in_arb_share_counter <= DE0_base1_sopc_clock_0_in_arb_share_counter_next_value;
    end


  //DE0_base1_sopc_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|DE0_base1_sopc_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_DE0_base1_sopc_clock_0_in) | (end_xfer_arb_share_counter_term_DE0_base1_sopc_clock_0_in & ~DE0_base1_sopc_clock_0_in_non_bursting_master_requests))
          DE0_base1_sopc_clock_0_in_slavearbiterlockenable <= |DE0_base1_sopc_clock_0_in_arb_share_counter_next_value;
    end


  //cpu/instruction_master DE0_base1_sopc_clock_0/in arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = DE0_base1_sopc_clock_0_in_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //DE0_base1_sopc_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_slavearbiterlockenable2 = |DE0_base1_sopc_clock_0_in_arb_share_counter_next_value;

  //cpu/instruction_master DE0_base1_sopc_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = DE0_base1_sopc_clock_0_in_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //DE0_base1_sopc_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_any_continuerequest = 1;

  //cpu_instruction_master_continuerequest continued request, which is an e_assign
  assign cpu_instruction_master_continuerequest = 1;

  assign cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in = cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0))));
  //local readdatavalid cpu_instruction_master_read_data_valid_DE0_base1_sopc_clock_0_in, which is an e_mux
  assign cpu_instruction_master_read_data_valid_DE0_base1_sopc_clock_0_in = cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in & cpu_instruction_master_read & ~DE0_base1_sopc_clock_0_in_waits_for_read;

  //assign DE0_base1_sopc_clock_0_in_endofpacket_from_sa = DE0_base1_sopc_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_endofpacket_from_sa = DE0_base1_sopc_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in = cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in;

  //cpu/instruction_master saved-grant DE0_base1_sopc_clock_0/in, which is an e_assign
  assign cpu_instruction_master_saved_grant_DE0_base1_sopc_clock_0_in = cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in;

  //allow new arb cycle for DE0_base1_sopc_clock_0/in, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE0_base1_sopc_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE0_base1_sopc_clock_0_in_master_qreq_vector = 1;

  //DE0_base1_sopc_clock_0_in_reset_n assignment, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_reset_n = reset_n;

  //DE0_base1_sopc_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_firsttransfer = DE0_base1_sopc_clock_0_in_begins_xfer ? DE0_base1_sopc_clock_0_in_unreg_firsttransfer : DE0_base1_sopc_clock_0_in_reg_firsttransfer;

  //DE0_base1_sopc_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_unreg_firsttransfer = ~(DE0_base1_sopc_clock_0_in_slavearbiterlockenable & DE0_base1_sopc_clock_0_in_any_continuerequest);

  //DE0_base1_sopc_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (DE0_base1_sopc_clock_0_in_begins_xfer)
          DE0_base1_sopc_clock_0_in_reg_firsttransfer <= DE0_base1_sopc_clock_0_in_unreg_firsttransfer;
    end


  //DE0_base1_sopc_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_beginbursttransfer_internal = DE0_base1_sopc_clock_0_in_begins_xfer;

  //DE0_base1_sopc_clock_0_in_read assignment, which is an e_mux
  assign DE0_base1_sopc_clock_0_in_read = cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in & cpu_instruction_master_read;

  //DE0_base1_sopc_clock_0_in_write assignment, which is an e_mux
  assign DE0_base1_sopc_clock_0_in_write = 0;

  //DE0_base1_sopc_clock_0_in_address mux, which is an e_mux
  assign DE0_base1_sopc_clock_0_in_address = cpu_instruction_master_address_to_slave;

  //slaveid DE0_base1_sopc_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign DE0_base1_sopc_clock_0_in_nativeaddress = cpu_instruction_master_address_to_slave >> 2;

  //d1_DE0_base1_sopc_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE0_base1_sopc_clock_0_in_end_xfer <= 1;
      else 
        d1_DE0_base1_sopc_clock_0_in_end_xfer <= DE0_base1_sopc_clock_0_in_end_xfer;
    end


  //DE0_base1_sopc_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign DE0_base1_sopc_clock_0_in_waits_for_read = DE0_base1_sopc_clock_0_in_in_a_read_cycle & DE0_base1_sopc_clock_0_in_waitrequest_from_sa;

  //DE0_base1_sopc_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_in_a_read_cycle = cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in & cpu_instruction_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE0_base1_sopc_clock_0_in_in_a_read_cycle;

  //DE0_base1_sopc_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign DE0_base1_sopc_clock_0_in_waits_for_write = DE0_base1_sopc_clock_0_in_in_a_write_cycle & DE0_base1_sopc_clock_0_in_waitrequest_from_sa;

  //DE0_base1_sopc_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign DE0_base1_sopc_clock_0_in_in_a_write_cycle = 0;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE0_base1_sopc_clock_0_in_in_a_write_cycle;

  assign wait_for_DE0_base1_sopc_clock_0_in_counter = 0;
  //DE0_base1_sopc_clock_0_in_byteenable byte enable port mux, which is an e_mux
  assign DE0_base1_sopc_clock_0_in_byteenable = -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_base1_sopc_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_base1_sopc_clock_0_out_arbitrator (
                                               // inputs:
                                                DE0_base1_sopc_clock_0_out_address,
                                                DE0_base1_sopc_clock_0_out_byteenable,
                                                DE0_base1_sopc_clock_0_out_granted_sdram_s1,
                                                DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1,
                                                DE0_base1_sopc_clock_0_out_read,
                                                DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1,
                                                DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register,
                                                DE0_base1_sopc_clock_0_out_requests_sdram_s1,
                                                DE0_base1_sopc_clock_0_out_write,
                                                DE0_base1_sopc_clock_0_out_writedata,
                                                clk,
                                                d1_sdram_s1_end_xfer,
                                                reset_n,
                                                sdram_s1_readdata_from_sa,
                                                sdram_s1_waitrequest_from_sa,

                                               // outputs:
                                                DE0_base1_sopc_clock_0_out_address_to_slave,
                                                DE0_base1_sopc_clock_0_out_readdata,
                                                DE0_base1_sopc_clock_0_out_reset_n,
                                                DE0_base1_sopc_clock_0_out_waitrequest
                                             )
;

  output  [ 23: 0] DE0_base1_sopc_clock_0_out_address_to_slave;
  output  [ 31: 0] DE0_base1_sopc_clock_0_out_readdata;
  output           DE0_base1_sopc_clock_0_out_reset_n;
  output           DE0_base1_sopc_clock_0_out_waitrequest;
  input   [ 23: 0] DE0_base1_sopc_clock_0_out_address;
  input   [  3: 0] DE0_base1_sopc_clock_0_out_byteenable;
  input            DE0_base1_sopc_clock_0_out_granted_sdram_s1;
  input            DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1;
  input            DE0_base1_sopc_clock_0_out_read;
  input            DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1;
  input            DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register;
  input            DE0_base1_sopc_clock_0_out_requests_sdram_s1;
  input            DE0_base1_sopc_clock_0_out_write;
  input   [ 31: 0] DE0_base1_sopc_clock_0_out_writedata;
  input            clk;
  input            d1_sdram_s1_end_xfer;
  input            reset_n;
  input   [ 31: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;

  reg     [ 23: 0] DE0_base1_sopc_clock_0_out_address_last_time;
  wire    [ 23: 0] DE0_base1_sopc_clock_0_out_address_to_slave;
  reg     [  3: 0] DE0_base1_sopc_clock_0_out_byteenable_last_time;
  reg              DE0_base1_sopc_clock_0_out_read_last_time;
  wire    [ 31: 0] DE0_base1_sopc_clock_0_out_readdata;
  wire             DE0_base1_sopc_clock_0_out_reset_n;
  wire             DE0_base1_sopc_clock_0_out_run;
  wire             DE0_base1_sopc_clock_0_out_waitrequest;
  reg              DE0_base1_sopc_clock_0_out_write_last_time;
  reg     [ 31: 0] DE0_base1_sopc_clock_0_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1 | DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1 | ~DE0_base1_sopc_clock_0_out_requests_sdram_s1) & (DE0_base1_sopc_clock_0_out_granted_sdram_s1 | ~DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1) & ((~DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1 | ~DE0_base1_sopc_clock_0_out_read | (DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1 & DE0_base1_sopc_clock_0_out_read))) & ((~DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1 | ~(DE0_base1_sopc_clock_0_out_read | DE0_base1_sopc_clock_0_out_write) | (1 & ~sdram_s1_waitrequest_from_sa & (DE0_base1_sopc_clock_0_out_read | DE0_base1_sopc_clock_0_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign DE0_base1_sopc_clock_0_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign DE0_base1_sopc_clock_0_out_address_to_slave = DE0_base1_sopc_clock_0_out_address;

  //DE0_base1_sopc_clock_0/out readdata mux, which is an e_mux
  assign DE0_base1_sopc_clock_0_out_readdata = sdram_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE0_base1_sopc_clock_0_out_waitrequest = ~DE0_base1_sopc_clock_0_out_run;

  //DE0_base1_sopc_clock_0_out_reset_n assignment, which is an e_assign
  assign DE0_base1_sopc_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_base1_sopc_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_0_out_address_last_time <= 0;
      else 
        DE0_base1_sopc_clock_0_out_address_last_time <= DE0_base1_sopc_clock_0_out_address;
    end


  //DE0_base1_sopc_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE0_base1_sopc_clock_0_out_waitrequest & (DE0_base1_sopc_clock_0_out_read | DE0_base1_sopc_clock_0_out_write);
    end


  //DE0_base1_sopc_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_base1_sopc_clock_0_out_address != DE0_base1_sopc_clock_0_out_address_last_time))
        begin
          $write("%0d ns: DE0_base1_sopc_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_base1_sopc_clock_0_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_0_out_byteenable_last_time <= 0;
      else 
        DE0_base1_sopc_clock_0_out_byteenable_last_time <= DE0_base1_sopc_clock_0_out_byteenable;
    end


  //DE0_base1_sopc_clock_0_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_base1_sopc_clock_0_out_byteenable != DE0_base1_sopc_clock_0_out_byteenable_last_time))
        begin
          $write("%0d ns: DE0_base1_sopc_clock_0_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_base1_sopc_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_0_out_read_last_time <= 0;
      else 
        DE0_base1_sopc_clock_0_out_read_last_time <= DE0_base1_sopc_clock_0_out_read;
    end


  //DE0_base1_sopc_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_base1_sopc_clock_0_out_read != DE0_base1_sopc_clock_0_out_read_last_time))
        begin
          $write("%0d ns: DE0_base1_sopc_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_base1_sopc_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_0_out_write_last_time <= 0;
      else 
        DE0_base1_sopc_clock_0_out_write_last_time <= DE0_base1_sopc_clock_0_out_write;
    end


  //DE0_base1_sopc_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_base1_sopc_clock_0_out_write != DE0_base1_sopc_clock_0_out_write_last_time))
        begin
          $write("%0d ns: DE0_base1_sopc_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_base1_sopc_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_0_out_writedata_last_time <= 0;
      else 
        DE0_base1_sopc_clock_0_out_writedata_last_time <= DE0_base1_sopc_clock_0_out_writedata;
    end


  //DE0_base1_sopc_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_base1_sopc_clock_0_out_writedata != DE0_base1_sopc_clock_0_out_writedata_last_time) & DE0_base1_sopc_clock_0_out_write)
        begin
          $write("%0d ns: DE0_base1_sopc_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_base1_sopc_clock_1_in_arbitrator (
                                              // inputs:
                                               DE0_base1_sopc_clock_1_in_endofpacket,
                                               DE0_base1_sopc_clock_1_in_readdata,
                                               DE0_base1_sopc_clock_1_in_waitrequest,
                                               clk,
                                               cpu_data_master_address_to_slave,
                                               cpu_data_master_byteenable,
                                               cpu_data_master_latency_counter,
                                               cpu_data_master_read,
                                               cpu_data_master_write,
                                               cpu_data_master_writedata,
                                               reset_n,

                                              // outputs:
                                               DE0_base1_sopc_clock_1_in_address,
                                               DE0_base1_sopc_clock_1_in_byteenable,
                                               DE0_base1_sopc_clock_1_in_endofpacket_from_sa,
                                               DE0_base1_sopc_clock_1_in_nativeaddress,
                                               DE0_base1_sopc_clock_1_in_read,
                                               DE0_base1_sopc_clock_1_in_readdata_from_sa,
                                               DE0_base1_sopc_clock_1_in_reset_n,
                                               DE0_base1_sopc_clock_1_in_waitrequest_from_sa,
                                               DE0_base1_sopc_clock_1_in_write,
                                               DE0_base1_sopc_clock_1_in_writedata,
                                               cpu_data_master_granted_DE0_base1_sopc_clock_1_in,
                                               cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in,
                                               cpu_data_master_read_data_valid_DE0_base1_sopc_clock_1_in,
                                               cpu_data_master_requests_DE0_base1_sopc_clock_1_in,
                                               d1_DE0_base1_sopc_clock_1_in_end_xfer
                                            )
;

  output  [ 23: 0] DE0_base1_sopc_clock_1_in_address;
  output  [  3: 0] DE0_base1_sopc_clock_1_in_byteenable;
  output           DE0_base1_sopc_clock_1_in_endofpacket_from_sa;
  output  [ 21: 0] DE0_base1_sopc_clock_1_in_nativeaddress;
  output           DE0_base1_sopc_clock_1_in_read;
  output  [ 31: 0] DE0_base1_sopc_clock_1_in_readdata_from_sa;
  output           DE0_base1_sopc_clock_1_in_reset_n;
  output           DE0_base1_sopc_clock_1_in_waitrequest_from_sa;
  output           DE0_base1_sopc_clock_1_in_write;
  output  [ 31: 0] DE0_base1_sopc_clock_1_in_writedata;
  output           cpu_data_master_granted_DE0_base1_sopc_clock_1_in;
  output           cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in;
  output           cpu_data_master_read_data_valid_DE0_base1_sopc_clock_1_in;
  output           cpu_data_master_requests_DE0_base1_sopc_clock_1_in;
  output           d1_DE0_base1_sopc_clock_1_in_end_xfer;
  input            DE0_base1_sopc_clock_1_in_endofpacket;
  input   [ 31: 0] DE0_base1_sopc_clock_1_in_readdata;
  input            DE0_base1_sopc_clock_1_in_waitrequest;
  input            clk;
  input   [ 25: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [ 23: 0] DE0_base1_sopc_clock_1_in_address;
  wire             DE0_base1_sopc_clock_1_in_allgrants;
  wire             DE0_base1_sopc_clock_1_in_allow_new_arb_cycle;
  wire             DE0_base1_sopc_clock_1_in_any_bursting_master_saved_grant;
  wire             DE0_base1_sopc_clock_1_in_any_continuerequest;
  wire             DE0_base1_sopc_clock_1_in_arb_counter_enable;
  reg              DE0_base1_sopc_clock_1_in_arb_share_counter;
  wire             DE0_base1_sopc_clock_1_in_arb_share_counter_next_value;
  wire             DE0_base1_sopc_clock_1_in_arb_share_set_values;
  wire             DE0_base1_sopc_clock_1_in_beginbursttransfer_internal;
  wire             DE0_base1_sopc_clock_1_in_begins_xfer;
  wire    [  3: 0] DE0_base1_sopc_clock_1_in_byteenable;
  wire             DE0_base1_sopc_clock_1_in_end_xfer;
  wire             DE0_base1_sopc_clock_1_in_endofpacket_from_sa;
  wire             DE0_base1_sopc_clock_1_in_firsttransfer;
  wire             DE0_base1_sopc_clock_1_in_grant_vector;
  wire             DE0_base1_sopc_clock_1_in_in_a_read_cycle;
  wire             DE0_base1_sopc_clock_1_in_in_a_write_cycle;
  wire             DE0_base1_sopc_clock_1_in_master_qreq_vector;
  wire    [ 21: 0] DE0_base1_sopc_clock_1_in_nativeaddress;
  wire             DE0_base1_sopc_clock_1_in_non_bursting_master_requests;
  wire             DE0_base1_sopc_clock_1_in_read;
  wire    [ 31: 0] DE0_base1_sopc_clock_1_in_readdata_from_sa;
  reg              DE0_base1_sopc_clock_1_in_reg_firsttransfer;
  wire             DE0_base1_sopc_clock_1_in_reset_n;
  reg              DE0_base1_sopc_clock_1_in_slavearbiterlockenable;
  wire             DE0_base1_sopc_clock_1_in_slavearbiterlockenable2;
  wire             DE0_base1_sopc_clock_1_in_unreg_firsttransfer;
  wire             DE0_base1_sopc_clock_1_in_waitrequest_from_sa;
  wire             DE0_base1_sopc_clock_1_in_waits_for_read;
  wire             DE0_base1_sopc_clock_1_in_waits_for_write;
  wire             DE0_base1_sopc_clock_1_in_write;
  wire    [ 31: 0] DE0_base1_sopc_clock_1_in_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_DE0_base1_sopc_clock_1_in;
  wire             cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in;
  wire             cpu_data_master_read_data_valid_DE0_base1_sopc_clock_1_in;
  wire             cpu_data_master_requests_DE0_base1_sopc_clock_1_in;
  wire             cpu_data_master_saved_grant_DE0_base1_sopc_clock_1_in;
  reg              d1_DE0_base1_sopc_clock_1_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE0_base1_sopc_clock_1_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_DE0_base1_sopc_clock_1_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE0_base1_sopc_clock_1_in_end_xfer;
    end


  assign DE0_base1_sopc_clock_1_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in));
  //assign DE0_base1_sopc_clock_1_in_readdata_from_sa = DE0_base1_sopc_clock_1_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_readdata_from_sa = DE0_base1_sopc_clock_1_in_readdata;

  assign cpu_data_master_requests_DE0_base1_sopc_clock_1_in = ({cpu_data_master_address_to_slave[25 : 24] , 24'b0} == 26'h1000000) & (cpu_data_master_read | cpu_data_master_write);
  //assign DE0_base1_sopc_clock_1_in_waitrequest_from_sa = DE0_base1_sopc_clock_1_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_waitrequest_from_sa = DE0_base1_sopc_clock_1_in_waitrequest;

  //DE0_base1_sopc_clock_1_in_arb_share_counter set values, which is an e_mux
  assign DE0_base1_sopc_clock_1_in_arb_share_set_values = 1;

  //DE0_base1_sopc_clock_1_in_non_bursting_master_requests mux, which is an e_mux
  assign DE0_base1_sopc_clock_1_in_non_bursting_master_requests = cpu_data_master_requests_DE0_base1_sopc_clock_1_in;

  //DE0_base1_sopc_clock_1_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE0_base1_sopc_clock_1_in_any_bursting_master_saved_grant = 0;

  //DE0_base1_sopc_clock_1_in_arb_share_counter_next_value assignment, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_arb_share_counter_next_value = DE0_base1_sopc_clock_1_in_firsttransfer ? (DE0_base1_sopc_clock_1_in_arb_share_set_values - 1) : |DE0_base1_sopc_clock_1_in_arb_share_counter ? (DE0_base1_sopc_clock_1_in_arb_share_counter - 1) : 0;

  //DE0_base1_sopc_clock_1_in_allgrants all slave grants, which is an e_mux
  assign DE0_base1_sopc_clock_1_in_allgrants = |DE0_base1_sopc_clock_1_in_grant_vector;

  //DE0_base1_sopc_clock_1_in_end_xfer assignment, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_end_xfer = ~(DE0_base1_sopc_clock_1_in_waits_for_read | DE0_base1_sopc_clock_1_in_waits_for_write);

  //end_xfer_arb_share_counter_term_DE0_base1_sopc_clock_1_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE0_base1_sopc_clock_1_in = DE0_base1_sopc_clock_1_in_end_xfer & (~DE0_base1_sopc_clock_1_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE0_base1_sopc_clock_1_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_arb_counter_enable = (end_xfer_arb_share_counter_term_DE0_base1_sopc_clock_1_in & DE0_base1_sopc_clock_1_in_allgrants) | (end_xfer_arb_share_counter_term_DE0_base1_sopc_clock_1_in & ~DE0_base1_sopc_clock_1_in_non_bursting_master_requests);

  //DE0_base1_sopc_clock_1_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_1_in_arb_share_counter <= 0;
      else if (DE0_base1_sopc_clock_1_in_arb_counter_enable)
          DE0_base1_sopc_clock_1_in_arb_share_counter <= DE0_base1_sopc_clock_1_in_arb_share_counter_next_value;
    end


  //DE0_base1_sopc_clock_1_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_1_in_slavearbiterlockenable <= 0;
      else if ((|DE0_base1_sopc_clock_1_in_master_qreq_vector & end_xfer_arb_share_counter_term_DE0_base1_sopc_clock_1_in) | (end_xfer_arb_share_counter_term_DE0_base1_sopc_clock_1_in & ~DE0_base1_sopc_clock_1_in_non_bursting_master_requests))
          DE0_base1_sopc_clock_1_in_slavearbiterlockenable <= |DE0_base1_sopc_clock_1_in_arb_share_counter_next_value;
    end


  //cpu/data_master DE0_base1_sopc_clock_1/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = DE0_base1_sopc_clock_1_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //DE0_base1_sopc_clock_1_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_slavearbiterlockenable2 = |DE0_base1_sopc_clock_1_in_arb_share_counter_next_value;

  //cpu/data_master DE0_base1_sopc_clock_1/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = DE0_base1_sopc_clock_1_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //DE0_base1_sopc_clock_1_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in = cpu_data_master_requests_DE0_base1_sopc_clock_1_in & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_DE0_base1_sopc_clock_1_in, which is an e_mux
  assign cpu_data_master_read_data_valid_DE0_base1_sopc_clock_1_in = cpu_data_master_granted_DE0_base1_sopc_clock_1_in & cpu_data_master_read & ~DE0_base1_sopc_clock_1_in_waits_for_read;

  //DE0_base1_sopc_clock_1_in_writedata mux, which is an e_mux
  assign DE0_base1_sopc_clock_1_in_writedata = cpu_data_master_writedata;

  //assign DE0_base1_sopc_clock_1_in_endofpacket_from_sa = DE0_base1_sopc_clock_1_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_endofpacket_from_sa = DE0_base1_sopc_clock_1_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_DE0_base1_sopc_clock_1_in = cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in;

  //cpu/data_master saved-grant DE0_base1_sopc_clock_1/in, which is an e_assign
  assign cpu_data_master_saved_grant_DE0_base1_sopc_clock_1_in = cpu_data_master_requests_DE0_base1_sopc_clock_1_in;

  //allow new arb cycle for DE0_base1_sopc_clock_1/in, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE0_base1_sopc_clock_1_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE0_base1_sopc_clock_1_in_master_qreq_vector = 1;

  //DE0_base1_sopc_clock_1_in_reset_n assignment, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_reset_n = reset_n;

  //DE0_base1_sopc_clock_1_in_firsttransfer first transaction, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_firsttransfer = DE0_base1_sopc_clock_1_in_begins_xfer ? DE0_base1_sopc_clock_1_in_unreg_firsttransfer : DE0_base1_sopc_clock_1_in_reg_firsttransfer;

  //DE0_base1_sopc_clock_1_in_unreg_firsttransfer first transaction, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_unreg_firsttransfer = ~(DE0_base1_sopc_clock_1_in_slavearbiterlockenable & DE0_base1_sopc_clock_1_in_any_continuerequest);

  //DE0_base1_sopc_clock_1_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_1_in_reg_firsttransfer <= 1'b1;
      else if (DE0_base1_sopc_clock_1_in_begins_xfer)
          DE0_base1_sopc_clock_1_in_reg_firsttransfer <= DE0_base1_sopc_clock_1_in_unreg_firsttransfer;
    end


  //DE0_base1_sopc_clock_1_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_beginbursttransfer_internal = DE0_base1_sopc_clock_1_in_begins_xfer;

  //DE0_base1_sopc_clock_1_in_read assignment, which is an e_mux
  assign DE0_base1_sopc_clock_1_in_read = cpu_data_master_granted_DE0_base1_sopc_clock_1_in & cpu_data_master_read;

  //DE0_base1_sopc_clock_1_in_write assignment, which is an e_mux
  assign DE0_base1_sopc_clock_1_in_write = cpu_data_master_granted_DE0_base1_sopc_clock_1_in & cpu_data_master_write;

  //DE0_base1_sopc_clock_1_in_address mux, which is an e_mux
  assign DE0_base1_sopc_clock_1_in_address = cpu_data_master_address_to_slave;

  //slaveid DE0_base1_sopc_clock_1_in_nativeaddress nativeaddress mux, which is an e_mux
  assign DE0_base1_sopc_clock_1_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_DE0_base1_sopc_clock_1_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE0_base1_sopc_clock_1_in_end_xfer <= 1;
      else 
        d1_DE0_base1_sopc_clock_1_in_end_xfer <= DE0_base1_sopc_clock_1_in_end_xfer;
    end


  //DE0_base1_sopc_clock_1_in_waits_for_read in a cycle, which is an e_mux
  assign DE0_base1_sopc_clock_1_in_waits_for_read = DE0_base1_sopc_clock_1_in_in_a_read_cycle & DE0_base1_sopc_clock_1_in_waitrequest_from_sa;

  //DE0_base1_sopc_clock_1_in_in_a_read_cycle assignment, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_in_a_read_cycle = cpu_data_master_granted_DE0_base1_sopc_clock_1_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE0_base1_sopc_clock_1_in_in_a_read_cycle;

  //DE0_base1_sopc_clock_1_in_waits_for_write in a cycle, which is an e_mux
  assign DE0_base1_sopc_clock_1_in_waits_for_write = DE0_base1_sopc_clock_1_in_in_a_write_cycle & DE0_base1_sopc_clock_1_in_waitrequest_from_sa;

  //DE0_base1_sopc_clock_1_in_in_a_write_cycle assignment, which is an e_assign
  assign DE0_base1_sopc_clock_1_in_in_a_write_cycle = cpu_data_master_granted_DE0_base1_sopc_clock_1_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE0_base1_sopc_clock_1_in_in_a_write_cycle;

  assign wait_for_DE0_base1_sopc_clock_1_in_counter = 0;
  //DE0_base1_sopc_clock_1_in_byteenable byte enable port mux, which is an e_mux
  assign DE0_base1_sopc_clock_1_in_byteenable = (cpu_data_master_granted_DE0_base1_sopc_clock_1_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_base1_sopc_clock_1/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_base1_sopc_clock_1_out_arbitrator (
                                               // inputs:
                                                DE0_base1_sopc_clock_1_out_address,
                                                DE0_base1_sopc_clock_1_out_byteenable,
                                                DE0_base1_sopc_clock_1_out_granted_sdram_s1,
                                                DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1,
                                                DE0_base1_sopc_clock_1_out_read,
                                                DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1,
                                                DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register,
                                                DE0_base1_sopc_clock_1_out_requests_sdram_s1,
                                                DE0_base1_sopc_clock_1_out_write,
                                                DE0_base1_sopc_clock_1_out_writedata,
                                                clk,
                                                d1_sdram_s1_end_xfer,
                                                reset_n,
                                                sdram_s1_readdata_from_sa,
                                                sdram_s1_waitrequest_from_sa,

                                               // outputs:
                                                DE0_base1_sopc_clock_1_out_address_to_slave,
                                                DE0_base1_sopc_clock_1_out_readdata,
                                                DE0_base1_sopc_clock_1_out_reset_n,
                                                DE0_base1_sopc_clock_1_out_waitrequest
                                             )
;

  output  [ 23: 0] DE0_base1_sopc_clock_1_out_address_to_slave;
  output  [ 31: 0] DE0_base1_sopc_clock_1_out_readdata;
  output           DE0_base1_sopc_clock_1_out_reset_n;
  output           DE0_base1_sopc_clock_1_out_waitrequest;
  input   [ 23: 0] DE0_base1_sopc_clock_1_out_address;
  input   [  3: 0] DE0_base1_sopc_clock_1_out_byteenable;
  input            DE0_base1_sopc_clock_1_out_granted_sdram_s1;
  input            DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1;
  input            DE0_base1_sopc_clock_1_out_read;
  input            DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1;
  input            DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register;
  input            DE0_base1_sopc_clock_1_out_requests_sdram_s1;
  input            DE0_base1_sopc_clock_1_out_write;
  input   [ 31: 0] DE0_base1_sopc_clock_1_out_writedata;
  input            clk;
  input            d1_sdram_s1_end_xfer;
  input            reset_n;
  input   [ 31: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;

  reg     [ 23: 0] DE0_base1_sopc_clock_1_out_address_last_time;
  wire    [ 23: 0] DE0_base1_sopc_clock_1_out_address_to_slave;
  reg     [  3: 0] DE0_base1_sopc_clock_1_out_byteenable_last_time;
  reg              DE0_base1_sopc_clock_1_out_read_last_time;
  wire    [ 31: 0] DE0_base1_sopc_clock_1_out_readdata;
  wire             DE0_base1_sopc_clock_1_out_reset_n;
  wire             DE0_base1_sopc_clock_1_out_run;
  wire             DE0_base1_sopc_clock_1_out_waitrequest;
  reg              DE0_base1_sopc_clock_1_out_write_last_time;
  reg     [ 31: 0] DE0_base1_sopc_clock_1_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1 | DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1 | ~DE0_base1_sopc_clock_1_out_requests_sdram_s1) & (DE0_base1_sopc_clock_1_out_granted_sdram_s1 | ~DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1) & ((~DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1 | ~DE0_base1_sopc_clock_1_out_read | (DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1 & DE0_base1_sopc_clock_1_out_read))) & ((~DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1 | ~(DE0_base1_sopc_clock_1_out_read | DE0_base1_sopc_clock_1_out_write) | (1 & ~sdram_s1_waitrequest_from_sa & (DE0_base1_sopc_clock_1_out_read | DE0_base1_sopc_clock_1_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign DE0_base1_sopc_clock_1_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign DE0_base1_sopc_clock_1_out_address_to_slave = DE0_base1_sopc_clock_1_out_address;

  //DE0_base1_sopc_clock_1/out readdata mux, which is an e_mux
  assign DE0_base1_sopc_clock_1_out_readdata = sdram_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE0_base1_sopc_clock_1_out_waitrequest = ~DE0_base1_sopc_clock_1_out_run;

  //DE0_base1_sopc_clock_1_out_reset_n assignment, which is an e_assign
  assign DE0_base1_sopc_clock_1_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_base1_sopc_clock_1_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_1_out_address_last_time <= 0;
      else 
        DE0_base1_sopc_clock_1_out_address_last_time <= DE0_base1_sopc_clock_1_out_address;
    end


  //DE0_base1_sopc_clock_1/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE0_base1_sopc_clock_1_out_waitrequest & (DE0_base1_sopc_clock_1_out_read | DE0_base1_sopc_clock_1_out_write);
    end


  //DE0_base1_sopc_clock_1_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_base1_sopc_clock_1_out_address != DE0_base1_sopc_clock_1_out_address_last_time))
        begin
          $write("%0d ns: DE0_base1_sopc_clock_1_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_base1_sopc_clock_1_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_1_out_byteenable_last_time <= 0;
      else 
        DE0_base1_sopc_clock_1_out_byteenable_last_time <= DE0_base1_sopc_clock_1_out_byteenable;
    end


  //DE0_base1_sopc_clock_1_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_base1_sopc_clock_1_out_byteenable != DE0_base1_sopc_clock_1_out_byteenable_last_time))
        begin
          $write("%0d ns: DE0_base1_sopc_clock_1_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_base1_sopc_clock_1_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_1_out_read_last_time <= 0;
      else 
        DE0_base1_sopc_clock_1_out_read_last_time <= DE0_base1_sopc_clock_1_out_read;
    end


  //DE0_base1_sopc_clock_1_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_base1_sopc_clock_1_out_read != DE0_base1_sopc_clock_1_out_read_last_time))
        begin
          $write("%0d ns: DE0_base1_sopc_clock_1_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_base1_sopc_clock_1_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_1_out_write_last_time <= 0;
      else 
        DE0_base1_sopc_clock_1_out_write_last_time <= DE0_base1_sopc_clock_1_out_write;
    end


  //DE0_base1_sopc_clock_1_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_base1_sopc_clock_1_out_write != DE0_base1_sopc_clock_1_out_write_last_time))
        begin
          $write("%0d ns: DE0_base1_sopc_clock_1_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_base1_sopc_clock_1_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_base1_sopc_clock_1_out_writedata_last_time <= 0;
      else 
        DE0_base1_sopc_clock_1_out_writedata_last_time <= DE0_base1_sopc_clock_1_out_writedata;
    end


  //DE0_base1_sopc_clock_1_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_base1_sopc_clock_1_out_writedata != DE0_base1_sopc_clock_1_out_writedata_last_time) & DE0_base1_sopc_clock_1_out_write)
        begin
          $write("%0d ns: DE0_base1_sopc_clock_1_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_latency_counter,
                                           cpu_data_master_read,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_latency_counter,
                                           cpu_instruction_master_read,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 25: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 25: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg              cpu_jtag_debug_module_arb_share_counter;
  wire             cpu_jtag_debug_module_arb_share_counter_next_value;
  wire             cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 25: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 25: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[25 : 11] , 11'b0} == 26'h2020800) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector);

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))) | cpu_instruction_master_arbiterlock);
  //local readdatavalid cpu_data_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_data_master_read_data_valid_cpu_jtag_debug_module = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[25 : 11] , 11'b0} == 26'h2020800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cpu_jtag_debug_module = cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_custom_instruction_master_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result_from_sa,
                                                   reset_n,

                                                  // outputs:
                                                   cpu_custom_instruction_master_combo_result,
                                                   cpu_custom_instruction_master_reset_n,
                                                   cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_select
                                                )
;

  output  [ 31: 0] cpu_custom_instruction_master_combo_result;
  output           cpu_custom_instruction_master_reset_n;
  output           cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_select;
  input            clk;
  input   [ 31: 0] cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result_from_sa;
  input            reset_n;

  wire    [ 31: 0] cpu_custom_instruction_master_combo_result;
  wire             cpu_custom_instruction_master_reset_n;
  wire             cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_select;
  assign cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_select = 1'b1;
  //cpu_custom_instruction_master_combo_result mux, which is an e_mux
  assign cpu_custom_instruction_master_combo_result = {32 {cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_select}} & cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result_from_sa;

  //cpu_custom_instruction_master_reset_n local reset_n, which is an e_assign
  assign cpu_custom_instruction_master_reset_n = reset_n;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     DE0_base1_sopc_clock_1_in_readdata_from_sa,
                                     DE0_base1_sopc_clock_1_in_waitrequest_from_sa,
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_byteenable,
                                     cpu_data_master_granted_DE0_base1_sopc_clock_1_in,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_granted_onchip_memory2_s1,
                                     cpu_data_master_granted_pll_pll_slave,
                                     cpu_data_master_granted_sysid_control_slave,
                                     cpu_data_master_granted_timer_s1,
                                     cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_qualified_request_onchip_memory2_s1,
                                     cpu_data_master_qualified_request_pll_pll_slave,
                                     cpu_data_master_qualified_request_sysid_control_slave,
                                     cpu_data_master_qualified_request_timer_s1,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_DE0_base1_sopc_clock_1_in,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_read_data_valid_onchip_memory2_s1,
                                     cpu_data_master_read_data_valid_pll_pll_slave,
                                     cpu_data_master_read_data_valid_sysid_control_slave,
                                     cpu_data_master_read_data_valid_timer_s1,
                                     cpu_data_master_requests_DE0_base1_sopc_clock_1_in,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_requests_onchip_memory2_s1,
                                     cpu_data_master_requests_pll_pll_slave,
                                     cpu_data_master_requests_sysid_control_slave,
                                     cpu_data_master_requests_timer_s1,
                                     cpu_data_master_write,
                                     cpu_data_master_writedata,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_DE0_base1_sopc_clock_1_in_end_xfer,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                     d1_onchip_memory2_s1_end_xfer,
                                     d1_pll_pll_slave_end_xfer,
                                     d1_sysid_control_slave_end_xfer,
                                     d1_timer_s1_end_xfer,
                                     jtag_uart_avalon_jtag_slave_irq_from_sa,
                                     jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                     jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                     onchip_memory2_s1_readdata_from_sa,
                                     pll_pll_slave_readdata_from_sa,
                                     reset_n,
                                     sysid_control_slave_readdata_from_sa,
                                     timer_s1_irq_from_sa,
                                     timer_s1_readdata_from_sa,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_irq,
                                     cpu_data_master_latency_counter,
                                     cpu_data_master_readdata,
                                     cpu_data_master_readdatavalid,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 25: 0] cpu_data_master_address_to_slave;
  output  [ 31: 0] cpu_data_master_irq;
  output           cpu_data_master_latency_counter;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_readdatavalid;
  output           cpu_data_master_waitrequest;
  input   [ 31: 0] DE0_base1_sopc_clock_1_in_readdata_from_sa;
  input            DE0_base1_sopc_clock_1_in_waitrequest_from_sa;
  input            clk;
  input   [ 25: 0] cpu_data_master_address;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_granted_DE0_base1_sopc_clock_1_in;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_granted_onchip_memory2_s1;
  input            cpu_data_master_granted_pll_pll_slave;
  input            cpu_data_master_granted_sysid_control_slave;
  input            cpu_data_master_granted_timer_s1;
  input            cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_qualified_request_onchip_memory2_s1;
  input            cpu_data_master_qualified_request_pll_pll_slave;
  input            cpu_data_master_qualified_request_sysid_control_slave;
  input            cpu_data_master_qualified_request_timer_s1;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_DE0_base1_sopc_clock_1_in;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_read_data_valid_onchip_memory2_s1;
  input            cpu_data_master_read_data_valid_pll_pll_slave;
  input            cpu_data_master_read_data_valid_sysid_control_slave;
  input            cpu_data_master_read_data_valid_timer_s1;
  input            cpu_data_master_requests_DE0_base1_sopc_clock_1_in;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_requests_onchip_memory2_s1;
  input            cpu_data_master_requests_pll_pll_slave;
  input            cpu_data_master_requests_sysid_control_slave;
  input            cpu_data_master_requests_timer_s1;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_DE0_base1_sopc_clock_1_in_end_xfer;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_jtag_uart_avalon_jtag_slave_end_xfer;
  input            d1_onchip_memory2_s1_end_xfer;
  input            d1_pll_pll_slave_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_timer_s1_end_xfer;
  input            jtag_uart_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  input   [ 31: 0] onchip_memory2_s1_readdata_from_sa;
  input   [ 31: 0] pll_pll_slave_readdata_from_sa;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input            timer_s1_irq_from_sa;
  input   [ 15: 0] timer_s1_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 25: 0] cpu_data_master_address_last_time;
  wire    [ 25: 0] cpu_data_master_address_to_slave;
  reg     [  3: 0] cpu_data_master_byteenable_last_time;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_is_granted_some_slave;
  reg              cpu_data_master_latency_counter;
  reg              cpu_data_master_read_but_no_slave_selected;
  reg              cpu_data_master_read_last_time;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_readdatavalid;
  wire             cpu_data_master_run;
  wire             cpu_data_master_waitrequest;
  reg              cpu_data_master_write_last_time;
  reg     [ 31: 0] cpu_data_master_writedata_last_time;
  wire             latency_load_value;
  wire             p1_cpu_data_master_latency_counter;
  wire             pre_flush_cpu_data_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in | ~cpu_data_master_requests_DE0_base1_sopc_clock_1_in) & ((~cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_base1_sopc_clock_1_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_base1_sopc_clock_1_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~cpu_data_master_requests_jtag_uart_avalon_jtag_slave) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_onchip_memory2_s1 | ~cpu_data_master_requests_onchip_memory2_s1) & (cpu_data_master_granted_onchip_memory2_s1 | ~cpu_data_master_qualified_request_onchip_memory2_s1) & ((~cpu_data_master_qualified_request_onchip_memory2_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_onchip_memory2_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_pll_pll_slave | ~cpu_data_master_requests_pll_pll_slave);

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_data_master_qualified_request_pll_pll_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_pll_pll_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_requests_sysid_control_slave) & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_read | (1 & ~d1_sysid_control_slave_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_timer_s1 | ~cpu_data_master_requests_timer_s1) & ((~cpu_data_master_qualified_request_timer_s1 | ~cpu_data_master_read | (1 & ~d1_timer_s1_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_timer_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[25 : 0];

  //cpu_data_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_but_no_slave_selected <= 0;
      else 
        cpu_data_master_read_but_no_slave_selected <= cpu_data_master_read & cpu_data_master_run & ~cpu_data_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_data_master_is_granted_some_slave = cpu_data_master_granted_DE0_base1_sopc_clock_1_in |
    cpu_data_master_granted_cpu_jtag_debug_module |
    cpu_data_master_granted_jtag_uart_avalon_jtag_slave |
    cpu_data_master_granted_onchip_memory2_s1 |
    cpu_data_master_granted_pll_pll_slave |
    cpu_data_master_granted_sysid_control_slave |
    cpu_data_master_granted_timer_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_data_master_readdatavalid = cpu_data_master_read_data_valid_onchip_memory2_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_data_master_readdatavalid = cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_DE0_base1_sopc_clock_1_in |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_cpu_jtag_debug_module |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_pll_pll_slave |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_sysid_control_slave |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_timer_s1;

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~(cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in & cpu_data_master_read)}} | DE0_base1_sopc_clock_1_in_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_cpu_jtag_debug_module & cpu_data_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave & cpu_data_master_read)}} | jtag_uart_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_onchip_memory2_s1}} | onchip_memory2_s1_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_pll_pll_slave & cpu_data_master_read)}} | pll_pll_slave_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_sysid_control_slave & cpu_data_master_read)}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_timer_s1 & cpu_data_master_read)}} | timer_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_data_master_waitrequest = ~cpu_data_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_latency_counter <= 0;
      else 
        cpu_data_master_latency_counter <= p1_cpu_data_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_data_master_latency_counter = ((cpu_data_master_run & cpu_data_master_read))? latency_load_value :
    (cpu_data_master_latency_counter)? cpu_data_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {cpu_data_master_requests_onchip_memory2_s1}} & 1;

  //irq assign, which is an e_assign
  assign cpu_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    timer_s1_irq_from_sa,
    jtag_uart_avalon_jtag_slave_irq_from_sa};


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_data_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_address_last_time <= 0;
      else 
        cpu_data_master_address_last_time <= cpu_data_master_address;
    end


  //cpu/data_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_data_master_waitrequest & (cpu_data_master_read | cpu_data_master_write);
    end


  //cpu_data_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_address != cpu_data_master_address_last_time))
        begin
          $write("%0d ns: cpu_data_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_byteenable_last_time <= 0;
      else 
        cpu_data_master_byteenable_last_time <= cpu_data_master_byteenable;
    end


  //cpu_data_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_byteenable != cpu_data_master_byteenable_last_time))
        begin
          $write("%0d ns: cpu_data_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_last_time <= 0;
      else 
        cpu_data_master_read_last_time <= cpu_data_master_read;
    end


  //cpu_data_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_read != cpu_data_master_read_last_time))
        begin
          $write("%0d ns: cpu_data_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_write_last_time <= 0;
      else 
        cpu_data_master_write_last_time <= cpu_data_master_write;
    end


  //cpu_data_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_write != cpu_data_master_write_last_time))
        begin
          $write("%0d ns: cpu_data_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_writedata_last_time <= 0;
      else 
        cpu_data_master_writedata_last_time <= cpu_data_master_writedata;
    end


  //cpu_data_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_writedata != cpu_data_master_writedata_last_time) & cpu_data_master_write)
        begin
          $write("%0d ns: cpu_data_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            DE0_base1_sopc_clock_0_in_readdata_from_sa,
                                            DE0_base1_sopc_clock_0_in_waitrequest_from_sa,
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_onchip_memory2_s1,
                                            cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_onchip_memory2_s1,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_DE0_base1_sopc_clock_0_in,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_onchip_memory2_s1,
                                            cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_onchip_memory2_s1,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_DE0_base1_sopc_clock_0_in_end_xfer,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_onchip_memory2_s1_end_xfer,
                                            onchip_memory2_s1_readdata_from_sa,
                                            reset_n,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_latency_counter,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_readdatavalid,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 25: 0] cpu_instruction_master_address_to_slave;
  output           cpu_instruction_master_latency_counter;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_readdatavalid;
  output           cpu_instruction_master_waitrequest;
  input   [ 31: 0] DE0_base1_sopc_clock_0_in_readdata_from_sa;
  input            DE0_base1_sopc_clock_0_in_waitrequest_from_sa;
  input            clk;
  input   [ 25: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_onchip_memory2_s1;
  input            cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_onchip_memory2_s1;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_DE0_base1_sopc_clock_0_in;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_onchip_memory2_s1;
  input            cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_onchip_memory2_s1;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_DE0_base1_sopc_clock_0_in_end_xfer;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_onchip_memory2_s1_end_xfer;
  input   [ 31: 0] onchip_memory2_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 25: 0] cpu_instruction_master_address_last_time;
  wire    [ 25: 0] cpu_instruction_master_address_to_slave;
  wire             cpu_instruction_master_is_granted_some_slave;
  reg              cpu_instruction_master_latency_counter;
  reg              cpu_instruction_master_read_but_no_slave_selected;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  wire             latency_load_value;
  wire             p1_cpu_instruction_master_latency_counter;
  wire             pre_flush_cpu_instruction_master_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in | ~cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in) & ((~cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in | ~(cpu_instruction_master_read) | (1 & ~DE0_base1_sopc_clock_0_in_waitrequest_from_sa & (cpu_instruction_master_read)))) & 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_onchip_memory2_s1 | ~cpu_instruction_master_requests_onchip_memory2_s1) & (cpu_instruction_master_granted_onchip_memory2_s1 | ~cpu_instruction_master_qualified_request_onchip_memory2_s1) & ((~cpu_instruction_master_qualified_request_onchip_memory2_s1 | ~(cpu_instruction_master_read) | (1 & (cpu_instruction_master_read))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = cpu_instruction_master_address[25 : 0];

  //cpu_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_instruction_master_read_but_no_slave_selected <= cpu_instruction_master_read & cpu_instruction_master_run & ~cpu_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_instruction_master_is_granted_some_slave = cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in |
    cpu_instruction_master_granted_cpu_jtag_debug_module |
    cpu_instruction_master_granted_onchip_memory2_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_instruction_master_readdatavalid = cpu_instruction_master_read_data_valid_onchip_memory2_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_instruction_master_readdatavalid = cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_DE0_base1_sopc_clock_0_in |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_cpu_jtag_debug_module |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid;

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~(cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in & cpu_instruction_master_read)}} | DE0_base1_sopc_clock_0_in_readdata_from_sa) &
    ({32 {~(cpu_instruction_master_qualified_request_cpu_jtag_debug_module & cpu_instruction_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_read_data_valid_onchip_memory2_s1}} | onchip_memory2_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_latency_counter <= 0;
      else 
        cpu_instruction_master_latency_counter <= p1_cpu_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_instruction_master_latency_counter = ((cpu_instruction_master_run & cpu_instruction_master_read))? latency_load_value :
    (cpu_instruction_master_latency_counter)? cpu_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {cpu_instruction_master_requests_onchip_memory2_s1}} & 1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else 
        cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else 
        cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_arbitrator (
                                                                                // inputs:
                                                                                 clk,
                                                                                 cpu_custom_instruction_master_combo_dataa,
                                                                                 cpu_custom_instruction_master_combo_n,
                                                                                 cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result,
                                                                                 cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_select,
                                                                                 reset_n,

                                                                                // outputs:
                                                                                 cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_dataa,
                                                                                 cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_n,
                                                                                 cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result_from_sa
                                                                              )
;

  output  [ 31: 0] cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_dataa;
  output           cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_n;
  output  [ 31: 0] cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result_from_sa;
  input            clk;
  input   [ 31: 0] cpu_custom_instruction_master_combo_dataa;
  input   [  7: 0] cpu_custom_instruction_master_combo_n;
  input   [ 31: 0] cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result;
  input            cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_select;
  input            reset_n;

  wire    [ 31: 0] cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_dataa;
  wire             cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_n;
  wire    [ 31: 0] cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result_from_sa;
  assign cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_dataa = cpu_custom_instruction_master_combo_dataa;
  assign cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_n = cpu_custom_instruction_master_combo_n;
  //assign cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result_from_sa = cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result_from_sa = cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_avalon_jtag_slave_arbitrator (
                                                // inputs:
                                                 clk,
                                                 cpu_data_master_address_to_slave,
                                                 cpu_data_master_latency_counter,
                                                 cpu_data_master_read,
                                                 cpu_data_master_write,
                                                 cpu_data_master_writedata,
                                                 jtag_uart_avalon_jtag_slave_dataavailable,
                                                 jtag_uart_avalon_jtag_slave_irq,
                                                 jtag_uart_avalon_jtag_slave_readdata,
                                                 jtag_uart_avalon_jtag_slave_readyfordata,
                                                 jtag_uart_avalon_jtag_slave_waitrequest,
                                                 reset_n,

                                                // outputs:
                                                 cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                                 d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                                 jtag_uart_avalon_jtag_slave_address,
                                                 jtag_uart_avalon_jtag_slave_chipselect,
                                                 jtag_uart_avalon_jtag_slave_dataavailable_from_sa,
                                                 jtag_uart_avalon_jtag_slave_irq_from_sa,
                                                 jtag_uart_avalon_jtag_slave_read_n,
                                                 jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_readyfordata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_reset_n,
                                                 jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                                 jtag_uart_avalon_jtag_slave_write_n,
                                                 jtag_uart_avalon_jtag_slave_writedata
                                              )
;

  output           cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  output           d1_jtag_uart_avalon_jtag_slave_end_xfer;
  output           jtag_uart_avalon_jtag_slave_address;
  output           jtag_uart_avalon_jtag_slave_chipselect;
  output           jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_avalon_jtag_slave_reset_n;
  output           jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 25: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            jtag_uart_avalon_jtag_slave_dataavailable;
  input            jtag_uart_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  input            jtag_uart_avalon_jtag_slave_readyfordata;
  input            jtag_uart_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave;
  reg              d1_jtag_uart_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_allgrants;
  wire             jtag_uart_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_avalon_jtag_slave_arb_counter_enable;
  reg              jtag_uart_avalon_jtag_slave_arb_share_counter;
  wire             jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
  wire             jtag_uart_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  reg              jtag_uart_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [ 25: 0] shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master;
  wire             wait_for_jtag_uart_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave));
  //assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata;

  assign cpu_data_master_requests_jtag_uart_avalon_jtag_slave = ({cpu_data_master_address_to_slave[25 : 3] , 3'b0} == 26'h2021010) & (cpu_data_master_read | cpu_data_master_write);
  //assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest;

  //jtag_uart_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_non_bursting_master_requests = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_avalon_jtag_slave_firsttransfer ? (jtag_uart_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_avalon_jtag_slave_arb_share_counter ? (jtag_uart_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_allgrants = |jtag_uart_avalon_jtag_slave_grant_vector;

  //jtag_uart_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_end_xfer = ~(jtag_uart_avalon_jtag_slave_waits_for_read | jtag_uart_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave = jtag_uart_avalon_jtag_slave_end_xfer & (~jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & jtag_uart_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = jtag_uart_avalon_jtag_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read & ~jtag_uart_avalon_jtag_slave_waits_for_read;

  //jtag_uart_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_jtag_uart_avalon_jtag_slave = cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;

  //cpu/data_master saved-grant jtag_uart/avalon_jtag_slave, which is an e_assign
  assign cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_avalon_jtag_slave_chipselect = cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  //jtag_uart_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_firsttransfer = jtag_uart_avalon_jtag_slave_begins_xfer ? jtag_uart_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_avalon_jtag_slave_begins_xfer)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_read_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read);

  //~jtag_uart_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_write_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write);

  assign shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //jtag_uart_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_address = shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master >> 2;

  //d1_jtag_uart_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_avalon_jtag_slave_end_xfer <= jtag_uart_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_read = jtag_uart_avalon_jtag_slave_in_a_read_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_read_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_write = jtag_uart_avalon_jtag_slave_in_a_write_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_write_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_memory2_s1_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_data_master_address_to_slave,
                                       cpu_data_master_byteenable,
                                       cpu_data_master_latency_counter,
                                       cpu_data_master_read,
                                       cpu_data_master_write,
                                       cpu_data_master_writedata,
                                       cpu_instruction_master_address_to_slave,
                                       cpu_instruction_master_latency_counter,
                                       cpu_instruction_master_read,
                                       onchip_memory2_s1_readdata,
                                       reset_n,

                                      // outputs:
                                       cpu_data_master_granted_onchip_memory2_s1,
                                       cpu_data_master_qualified_request_onchip_memory2_s1,
                                       cpu_data_master_read_data_valid_onchip_memory2_s1,
                                       cpu_data_master_requests_onchip_memory2_s1,
                                       cpu_instruction_master_granted_onchip_memory2_s1,
                                       cpu_instruction_master_qualified_request_onchip_memory2_s1,
                                       cpu_instruction_master_read_data_valid_onchip_memory2_s1,
                                       cpu_instruction_master_requests_onchip_memory2_s1,
                                       d1_onchip_memory2_s1_end_xfer,
                                       onchip_memory2_s1_address,
                                       onchip_memory2_s1_byteenable,
                                       onchip_memory2_s1_chipselect,
                                       onchip_memory2_s1_clken,
                                       onchip_memory2_s1_readdata_from_sa,
                                       onchip_memory2_s1_reset,
                                       onchip_memory2_s1_write,
                                       onchip_memory2_s1_writedata
                                    )
;

  output           cpu_data_master_granted_onchip_memory2_s1;
  output           cpu_data_master_qualified_request_onchip_memory2_s1;
  output           cpu_data_master_read_data_valid_onchip_memory2_s1;
  output           cpu_data_master_requests_onchip_memory2_s1;
  output           cpu_instruction_master_granted_onchip_memory2_s1;
  output           cpu_instruction_master_qualified_request_onchip_memory2_s1;
  output           cpu_instruction_master_read_data_valid_onchip_memory2_s1;
  output           cpu_instruction_master_requests_onchip_memory2_s1;
  output           d1_onchip_memory2_s1_end_xfer;
  output  [ 13: 0] onchip_memory2_s1_address;
  output  [  3: 0] onchip_memory2_s1_byteenable;
  output           onchip_memory2_s1_chipselect;
  output           onchip_memory2_s1_clken;
  output  [ 31: 0] onchip_memory2_s1_readdata_from_sa;
  output           onchip_memory2_s1_reset;
  output           onchip_memory2_s1_write;
  output  [ 31: 0] onchip_memory2_s1_writedata;
  input            clk;
  input   [ 25: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 25: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input   [ 31: 0] onchip_memory2_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_onchip_memory2_s1;
  wire             cpu_data_master_qualified_request_onchip_memory2_s1;
  wire             cpu_data_master_read_data_valid_onchip_memory2_s1;
  reg              cpu_data_master_read_data_valid_onchip_memory2_s1_shift_register;
  wire             cpu_data_master_read_data_valid_onchip_memory2_s1_shift_register_in;
  wire             cpu_data_master_requests_onchip_memory2_s1;
  wire             cpu_data_master_saved_grant_onchip_memory2_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_onchip_memory2_s1;
  wire             cpu_instruction_master_qualified_request_onchip_memory2_s1;
  wire             cpu_instruction_master_read_data_valid_onchip_memory2_s1;
  reg              cpu_instruction_master_read_data_valid_onchip_memory2_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_onchip_memory2_s1_shift_register_in;
  wire             cpu_instruction_master_requests_onchip_memory2_s1;
  wire             cpu_instruction_master_saved_grant_onchip_memory2_s1;
  reg              d1_onchip_memory2_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_memory2_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_onchip_memory2_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_onchip_memory2_s1;
  wire    [ 13: 0] onchip_memory2_s1_address;
  wire             onchip_memory2_s1_allgrants;
  wire             onchip_memory2_s1_allow_new_arb_cycle;
  wire             onchip_memory2_s1_any_bursting_master_saved_grant;
  wire             onchip_memory2_s1_any_continuerequest;
  reg     [  1: 0] onchip_memory2_s1_arb_addend;
  wire             onchip_memory2_s1_arb_counter_enable;
  reg              onchip_memory2_s1_arb_share_counter;
  wire             onchip_memory2_s1_arb_share_counter_next_value;
  wire             onchip_memory2_s1_arb_share_set_values;
  wire    [  1: 0] onchip_memory2_s1_arb_winner;
  wire             onchip_memory2_s1_arbitration_holdoff_internal;
  wire             onchip_memory2_s1_beginbursttransfer_internal;
  wire             onchip_memory2_s1_begins_xfer;
  wire    [  3: 0] onchip_memory2_s1_byteenable;
  wire             onchip_memory2_s1_chipselect;
  wire    [  3: 0] onchip_memory2_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_memory2_s1_chosen_master_rot_left;
  wire             onchip_memory2_s1_clken;
  wire             onchip_memory2_s1_end_xfer;
  wire             onchip_memory2_s1_firsttransfer;
  wire    [  1: 0] onchip_memory2_s1_grant_vector;
  wire             onchip_memory2_s1_in_a_read_cycle;
  wire             onchip_memory2_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_memory2_s1_master_qreq_vector;
  wire             onchip_memory2_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_memory2_s1_readdata_from_sa;
  reg              onchip_memory2_s1_reg_firsttransfer;
  wire             onchip_memory2_s1_reset;
  reg     [  1: 0] onchip_memory2_s1_saved_chosen_master_vector;
  reg              onchip_memory2_s1_slavearbiterlockenable;
  wire             onchip_memory2_s1_slavearbiterlockenable2;
  wire             onchip_memory2_s1_unreg_firsttransfer;
  wire             onchip_memory2_s1_waits_for_read;
  wire             onchip_memory2_s1_waits_for_write;
  wire             onchip_memory2_s1_write;
  wire    [ 31: 0] onchip_memory2_s1_writedata;
  wire             p1_cpu_data_master_read_data_valid_onchip_memory2_s1_shift_register;
  wire             p1_cpu_instruction_master_read_data_valid_onchip_memory2_s1_shift_register;
  wire    [ 25: 0] shifted_address_to_onchip_memory2_s1_from_cpu_data_master;
  wire    [ 25: 0] shifted_address_to_onchip_memory2_s1_from_cpu_instruction_master;
  wire             wait_for_onchip_memory2_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_memory2_s1_end_xfer;
    end


  assign onchip_memory2_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_onchip_memory2_s1 | cpu_instruction_master_qualified_request_onchip_memory2_s1));
  //assign onchip_memory2_s1_readdata_from_sa = onchip_memory2_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_memory2_s1_readdata_from_sa = onchip_memory2_s1_readdata;

  assign cpu_data_master_requests_onchip_memory2_s1 = ({cpu_data_master_address_to_slave[25 : 16] , 16'b0} == 26'h2010000) & (cpu_data_master_read | cpu_data_master_write);
  //onchip_memory2_s1_arb_share_counter set values, which is an e_mux
  assign onchip_memory2_s1_arb_share_set_values = 1;

  //onchip_memory2_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_memory2_s1_non_bursting_master_requests = cpu_data_master_requests_onchip_memory2_s1 |
    cpu_instruction_master_requests_onchip_memory2_s1 |
    cpu_data_master_requests_onchip_memory2_s1 |
    cpu_instruction_master_requests_onchip_memory2_s1;

  //onchip_memory2_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_memory2_s1_any_bursting_master_saved_grant = 0;

  //onchip_memory2_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_memory2_s1_arb_share_counter_next_value = onchip_memory2_s1_firsttransfer ? (onchip_memory2_s1_arb_share_set_values - 1) : |onchip_memory2_s1_arb_share_counter ? (onchip_memory2_s1_arb_share_counter - 1) : 0;

  //onchip_memory2_s1_allgrants all slave grants, which is an e_mux
  assign onchip_memory2_s1_allgrants = (|onchip_memory2_s1_grant_vector) |
    (|onchip_memory2_s1_grant_vector) |
    (|onchip_memory2_s1_grant_vector) |
    (|onchip_memory2_s1_grant_vector);

  //onchip_memory2_s1_end_xfer assignment, which is an e_assign
  assign onchip_memory2_s1_end_xfer = ~(onchip_memory2_s1_waits_for_read | onchip_memory2_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_memory2_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_memory2_s1 = onchip_memory2_s1_end_xfer & (~onchip_memory2_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_memory2_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_memory2_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_memory2_s1 & onchip_memory2_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_memory2_s1 & ~onchip_memory2_s1_non_bursting_master_requests);

  //onchip_memory2_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_s1_arb_share_counter <= 0;
      else if (onchip_memory2_s1_arb_counter_enable)
          onchip_memory2_s1_arb_share_counter <= onchip_memory2_s1_arb_share_counter_next_value;
    end


  //onchip_memory2_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_memory2_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_memory2_s1) | (end_xfer_arb_share_counter_term_onchip_memory2_s1 & ~onchip_memory2_s1_non_bursting_master_requests))
          onchip_memory2_s1_slavearbiterlockenable <= |onchip_memory2_s1_arb_share_counter_next_value;
    end


  //cpu/data_master onchip_memory2/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = onchip_memory2_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //onchip_memory2_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_memory2_s1_slavearbiterlockenable2 = |onchip_memory2_s1_arb_share_counter_next_value;

  //cpu/data_master onchip_memory2/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = onchip_memory2_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master onchip_memory2/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = onchip_memory2_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master onchip_memory2/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = onchip_memory2_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted onchip_memory2/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_onchip_memory2_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_onchip_memory2_s1 <= cpu_instruction_master_saved_grant_onchip_memory2_s1 ? 1 : (onchip_memory2_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_onchip_memory2_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_onchip_memory2_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_onchip_memory2_s1 & cpu_instruction_master_requests_onchip_memory2_s1;

  //onchip_memory2_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_memory2_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_onchip_memory2_s1 = cpu_data_master_requests_onchip_memory2_s1 & ~((cpu_data_master_read & ((1 < cpu_data_master_latency_counter))) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_onchip_memory2_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_memory2_s1_shift_register_in = cpu_data_master_granted_onchip_memory2_s1 & cpu_data_master_read & ~onchip_memory2_s1_waits_for_read;

  //shift register p1 cpu_data_master_read_data_valid_onchip_memory2_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_onchip_memory2_s1_shift_register = {cpu_data_master_read_data_valid_onchip_memory2_s1_shift_register, cpu_data_master_read_data_valid_onchip_memory2_s1_shift_register_in};

  //cpu_data_master_read_data_valid_onchip_memory2_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_onchip_memory2_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_onchip_memory2_s1_shift_register <= p1_cpu_data_master_read_data_valid_onchip_memory2_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_onchip_memory2_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_memory2_s1 = cpu_data_master_read_data_valid_onchip_memory2_s1_shift_register;

  //onchip_memory2_s1_writedata mux, which is an e_mux
  assign onchip_memory2_s1_writedata = cpu_data_master_writedata;

  //mux onchip_memory2_s1_clken, which is an e_mux
  assign onchip_memory2_s1_clken = 1'b1;

  assign cpu_instruction_master_requests_onchip_memory2_s1 = (({cpu_instruction_master_address_to_slave[25 : 16] , 16'b0} == 26'h2010000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted onchip_memory2/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_onchip_memory2_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_onchip_memory2_s1 <= cpu_data_master_saved_grant_onchip_memory2_s1 ? 1 : (onchip_memory2_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_onchip_memory2_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_onchip_memory2_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_onchip_memory2_s1 & cpu_data_master_requests_onchip_memory2_s1;

  assign cpu_instruction_master_qualified_request_onchip_memory2_s1 = cpu_instruction_master_requests_onchip_memory2_s1 & ~((cpu_instruction_master_read & ((1 < cpu_instruction_master_latency_counter))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_onchip_memory2_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_memory2_s1_shift_register_in = cpu_instruction_master_granted_onchip_memory2_s1 & cpu_instruction_master_read & ~onchip_memory2_s1_waits_for_read;

  //shift register p1 cpu_instruction_master_read_data_valid_onchip_memory2_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_onchip_memory2_s1_shift_register = {cpu_instruction_master_read_data_valid_onchip_memory2_s1_shift_register, cpu_instruction_master_read_data_valid_onchip_memory2_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_onchip_memory2_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_onchip_memory2_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_onchip_memory2_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_onchip_memory2_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_onchip_memory2_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_memory2_s1 = cpu_instruction_master_read_data_valid_onchip_memory2_s1_shift_register;

  //allow new arb cycle for onchip_memory2/s1, which is an e_assign
  assign onchip_memory2_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for onchip_memory2/s1, which is an e_assign
  assign onchip_memory2_s1_master_qreq_vector[0] = cpu_instruction_master_qualified_request_onchip_memory2_s1;

  //cpu/instruction_master grant onchip_memory2/s1, which is an e_assign
  assign cpu_instruction_master_granted_onchip_memory2_s1 = onchip_memory2_s1_grant_vector[0];

  //cpu/instruction_master saved-grant onchip_memory2/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_onchip_memory2_s1 = onchip_memory2_s1_arb_winner[0] && cpu_instruction_master_requests_onchip_memory2_s1;

  //cpu/data_master assignment into master qualified-requests vector for onchip_memory2/s1, which is an e_assign
  assign onchip_memory2_s1_master_qreq_vector[1] = cpu_data_master_qualified_request_onchip_memory2_s1;

  //cpu/data_master grant onchip_memory2/s1, which is an e_assign
  assign cpu_data_master_granted_onchip_memory2_s1 = onchip_memory2_s1_grant_vector[1];

  //cpu/data_master saved-grant onchip_memory2/s1, which is an e_assign
  assign cpu_data_master_saved_grant_onchip_memory2_s1 = onchip_memory2_s1_arb_winner[1] && cpu_data_master_requests_onchip_memory2_s1;

  //onchip_memory2/s1 chosen-master double-vector, which is an e_assign
  assign onchip_memory2_s1_chosen_master_double_vector = {onchip_memory2_s1_master_qreq_vector, onchip_memory2_s1_master_qreq_vector} & ({~onchip_memory2_s1_master_qreq_vector, ~onchip_memory2_s1_master_qreq_vector} + onchip_memory2_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_memory2_s1_arb_winner = (onchip_memory2_s1_allow_new_arb_cycle & | onchip_memory2_s1_grant_vector) ? onchip_memory2_s1_grant_vector : onchip_memory2_s1_saved_chosen_master_vector;

  //saved onchip_memory2_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_s1_saved_chosen_master_vector <= 0;
      else if (onchip_memory2_s1_allow_new_arb_cycle)
          onchip_memory2_s1_saved_chosen_master_vector <= |onchip_memory2_s1_grant_vector ? onchip_memory2_s1_grant_vector : onchip_memory2_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_memory2_s1_grant_vector = {(onchip_memory2_s1_chosen_master_double_vector[1] | onchip_memory2_s1_chosen_master_double_vector[3]),
    (onchip_memory2_s1_chosen_master_double_vector[0] | onchip_memory2_s1_chosen_master_double_vector[2])};

  //onchip_memory2/s1 chosen master rotated left, which is an e_assign
  assign onchip_memory2_s1_chosen_master_rot_left = (onchip_memory2_s1_arb_winner << 1) ? (onchip_memory2_s1_arb_winner << 1) : 1;

  //onchip_memory2/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_s1_arb_addend <= 1;
      else if (|onchip_memory2_s1_grant_vector)
          onchip_memory2_s1_arb_addend <= onchip_memory2_s1_end_xfer? onchip_memory2_s1_chosen_master_rot_left : onchip_memory2_s1_grant_vector;
    end


  //~onchip_memory2_s1_reset assignment, which is an e_assign
  assign onchip_memory2_s1_reset = ~reset_n;

  assign onchip_memory2_s1_chipselect = cpu_data_master_granted_onchip_memory2_s1 | cpu_instruction_master_granted_onchip_memory2_s1;
  //onchip_memory2_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_memory2_s1_firsttransfer = onchip_memory2_s1_begins_xfer ? onchip_memory2_s1_unreg_firsttransfer : onchip_memory2_s1_reg_firsttransfer;

  //onchip_memory2_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_memory2_s1_unreg_firsttransfer = ~(onchip_memory2_s1_slavearbiterlockenable & onchip_memory2_s1_any_continuerequest);

  //onchip_memory2_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_memory2_s1_begins_xfer)
          onchip_memory2_s1_reg_firsttransfer <= onchip_memory2_s1_unreg_firsttransfer;
    end


  //onchip_memory2_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_memory2_s1_beginbursttransfer_internal = onchip_memory2_s1_begins_xfer;

  //onchip_memory2_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_memory2_s1_arbitration_holdoff_internal = onchip_memory2_s1_begins_xfer & onchip_memory2_s1_firsttransfer;

  //onchip_memory2_s1_write assignment, which is an e_mux
  assign onchip_memory2_s1_write = cpu_data_master_granted_onchip_memory2_s1 & cpu_data_master_write;

  assign shifted_address_to_onchip_memory2_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //onchip_memory2_s1_address mux, which is an e_mux
  assign onchip_memory2_s1_address = (cpu_data_master_granted_onchip_memory2_s1)? (shifted_address_to_onchip_memory2_s1_from_cpu_data_master >> 2) :
    (shifted_address_to_onchip_memory2_s1_from_cpu_instruction_master >> 2);

  assign shifted_address_to_onchip_memory2_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_onchip_memory2_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_memory2_s1_end_xfer <= 1;
      else 
        d1_onchip_memory2_s1_end_xfer <= onchip_memory2_s1_end_xfer;
    end


  //onchip_memory2_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_memory2_s1_waits_for_read = onchip_memory2_s1_in_a_read_cycle & 0;

  //onchip_memory2_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_memory2_s1_in_a_read_cycle = (cpu_data_master_granted_onchip_memory2_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_onchip_memory2_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_memory2_s1_in_a_read_cycle;

  //onchip_memory2_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_memory2_s1_waits_for_write = onchip_memory2_s1_in_a_write_cycle & 0;

  //onchip_memory2_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_memory2_s1_in_a_write_cycle = cpu_data_master_granted_onchip_memory2_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_memory2_s1_in_a_write_cycle;

  assign wait_for_onchip_memory2_s1_counter = 0;
  //onchip_memory2_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_memory2_s1_byteenable = (cpu_data_master_granted_onchip_memory2_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_memory2/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_onchip_memory2_s1 + cpu_instruction_master_granted_onchip_memory2_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_onchip_memory2_s1 + cpu_instruction_master_saved_grant_onchip_memory2_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pll_pll_slave_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_data_master_address_to_slave,
                                   cpu_data_master_latency_counter,
                                   cpu_data_master_read,
                                   cpu_data_master_write,
                                   cpu_data_master_writedata,
                                   pll_pll_slave_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_data_master_granted_pll_pll_slave,
                                   cpu_data_master_qualified_request_pll_pll_slave,
                                   cpu_data_master_read_data_valid_pll_pll_slave,
                                   cpu_data_master_requests_pll_pll_slave,
                                   d1_pll_pll_slave_end_xfer,
                                   pll_pll_slave_address,
                                   pll_pll_slave_read,
                                   pll_pll_slave_readdata_from_sa,
                                   pll_pll_slave_reset,
                                   pll_pll_slave_write,
                                   pll_pll_slave_writedata
                                )
;

  output           cpu_data_master_granted_pll_pll_slave;
  output           cpu_data_master_qualified_request_pll_pll_slave;
  output           cpu_data_master_read_data_valid_pll_pll_slave;
  output           cpu_data_master_requests_pll_pll_slave;
  output           d1_pll_pll_slave_end_xfer;
  output  [  1: 0] pll_pll_slave_address;
  output           pll_pll_slave_read;
  output  [ 31: 0] pll_pll_slave_readdata_from_sa;
  output           pll_pll_slave_reset;
  output           pll_pll_slave_write;
  output  [ 31: 0] pll_pll_slave_writedata;
  input            clk;
  input   [ 25: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] pll_pll_slave_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_pll_pll_slave;
  wire             cpu_data_master_qualified_request_pll_pll_slave;
  wire             cpu_data_master_read_data_valid_pll_pll_slave;
  wire             cpu_data_master_requests_pll_pll_slave;
  wire             cpu_data_master_saved_grant_pll_pll_slave;
  reg              d1_pll_pll_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pll_pll_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pll_pll_slave_address;
  wire             pll_pll_slave_allgrants;
  wire             pll_pll_slave_allow_new_arb_cycle;
  wire             pll_pll_slave_any_bursting_master_saved_grant;
  wire             pll_pll_slave_any_continuerequest;
  wire             pll_pll_slave_arb_counter_enable;
  reg              pll_pll_slave_arb_share_counter;
  wire             pll_pll_slave_arb_share_counter_next_value;
  wire             pll_pll_slave_arb_share_set_values;
  wire             pll_pll_slave_beginbursttransfer_internal;
  wire             pll_pll_slave_begins_xfer;
  wire             pll_pll_slave_end_xfer;
  wire             pll_pll_slave_firsttransfer;
  wire             pll_pll_slave_grant_vector;
  wire             pll_pll_slave_in_a_read_cycle;
  wire             pll_pll_slave_in_a_write_cycle;
  wire             pll_pll_slave_master_qreq_vector;
  wire             pll_pll_slave_non_bursting_master_requests;
  wire             pll_pll_slave_read;
  wire    [ 31: 0] pll_pll_slave_readdata_from_sa;
  reg              pll_pll_slave_reg_firsttransfer;
  wire             pll_pll_slave_reset;
  reg              pll_pll_slave_slavearbiterlockenable;
  wire             pll_pll_slave_slavearbiterlockenable2;
  wire             pll_pll_slave_unreg_firsttransfer;
  wire             pll_pll_slave_waits_for_read;
  wire             pll_pll_slave_waits_for_write;
  wire             pll_pll_slave_write;
  wire    [ 31: 0] pll_pll_slave_writedata;
  wire    [ 25: 0] shifted_address_to_pll_pll_slave_from_cpu_data_master;
  wire             wait_for_pll_pll_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pll_pll_slave_end_xfer;
    end


  assign pll_pll_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_pll_pll_slave));
  //assign pll_pll_slave_readdata_from_sa = pll_pll_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pll_pll_slave_readdata_from_sa = pll_pll_slave_readdata;

  assign cpu_data_master_requests_pll_pll_slave = ({cpu_data_master_address_to_slave[25 : 4] , 4'b0} == 26'h2021000) & (cpu_data_master_read | cpu_data_master_write);
  //pll_pll_slave_arb_share_counter set values, which is an e_mux
  assign pll_pll_slave_arb_share_set_values = 1;

  //pll_pll_slave_non_bursting_master_requests mux, which is an e_mux
  assign pll_pll_slave_non_bursting_master_requests = cpu_data_master_requests_pll_pll_slave;

  //pll_pll_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign pll_pll_slave_any_bursting_master_saved_grant = 0;

  //pll_pll_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign pll_pll_slave_arb_share_counter_next_value = pll_pll_slave_firsttransfer ? (pll_pll_slave_arb_share_set_values - 1) : |pll_pll_slave_arb_share_counter ? (pll_pll_slave_arb_share_counter - 1) : 0;

  //pll_pll_slave_allgrants all slave grants, which is an e_mux
  assign pll_pll_slave_allgrants = |pll_pll_slave_grant_vector;

  //pll_pll_slave_end_xfer assignment, which is an e_assign
  assign pll_pll_slave_end_xfer = ~(pll_pll_slave_waits_for_read | pll_pll_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_pll_pll_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pll_pll_slave = pll_pll_slave_end_xfer & (~pll_pll_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pll_pll_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign pll_pll_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_pll_pll_slave & pll_pll_slave_allgrants) | (end_xfer_arb_share_counter_term_pll_pll_slave & ~pll_pll_slave_non_bursting_master_requests);

  //pll_pll_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_pll_slave_arb_share_counter <= 0;
      else if (pll_pll_slave_arb_counter_enable)
          pll_pll_slave_arb_share_counter <= pll_pll_slave_arb_share_counter_next_value;
    end


  //pll_pll_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_pll_slave_slavearbiterlockenable <= 0;
      else if ((|pll_pll_slave_master_qreq_vector & end_xfer_arb_share_counter_term_pll_pll_slave) | (end_xfer_arb_share_counter_term_pll_pll_slave & ~pll_pll_slave_non_bursting_master_requests))
          pll_pll_slave_slavearbiterlockenable <= |pll_pll_slave_arb_share_counter_next_value;
    end


  //cpu/data_master pll/pll_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = pll_pll_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //pll_pll_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pll_pll_slave_slavearbiterlockenable2 = |pll_pll_slave_arb_share_counter_next_value;

  //cpu/data_master pll/pll_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = pll_pll_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //pll_pll_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pll_pll_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_pll_pll_slave = cpu_data_master_requests_pll_pll_slave & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_pll_pll_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_pll_pll_slave = cpu_data_master_granted_pll_pll_slave & cpu_data_master_read & ~pll_pll_slave_waits_for_read;

  //pll_pll_slave_writedata mux, which is an e_mux
  assign pll_pll_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_pll_pll_slave = cpu_data_master_qualified_request_pll_pll_slave;

  //cpu/data_master saved-grant pll/pll_slave, which is an e_assign
  assign cpu_data_master_saved_grant_pll_pll_slave = cpu_data_master_requests_pll_pll_slave;

  //allow new arb cycle for pll/pll_slave, which is an e_assign
  assign pll_pll_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pll_pll_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pll_pll_slave_master_qreq_vector = 1;

  //~pll_pll_slave_reset assignment, which is an e_assign
  assign pll_pll_slave_reset = ~reset_n;

  //pll_pll_slave_firsttransfer first transaction, which is an e_assign
  assign pll_pll_slave_firsttransfer = pll_pll_slave_begins_xfer ? pll_pll_slave_unreg_firsttransfer : pll_pll_slave_reg_firsttransfer;

  //pll_pll_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign pll_pll_slave_unreg_firsttransfer = ~(pll_pll_slave_slavearbiterlockenable & pll_pll_slave_any_continuerequest);

  //pll_pll_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_pll_slave_reg_firsttransfer <= 1'b1;
      else if (pll_pll_slave_begins_xfer)
          pll_pll_slave_reg_firsttransfer <= pll_pll_slave_unreg_firsttransfer;
    end


  //pll_pll_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pll_pll_slave_beginbursttransfer_internal = pll_pll_slave_begins_xfer;

  //pll_pll_slave_read assignment, which is an e_mux
  assign pll_pll_slave_read = cpu_data_master_granted_pll_pll_slave & cpu_data_master_read;

  //pll_pll_slave_write assignment, which is an e_mux
  assign pll_pll_slave_write = cpu_data_master_granted_pll_pll_slave & cpu_data_master_write;

  assign shifted_address_to_pll_pll_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //pll_pll_slave_address mux, which is an e_mux
  assign pll_pll_slave_address = shifted_address_to_pll_pll_slave_from_cpu_data_master >> 2;

  //d1_pll_pll_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pll_pll_slave_end_xfer <= 1;
      else 
        d1_pll_pll_slave_end_xfer <= pll_pll_slave_end_xfer;
    end


  //pll_pll_slave_waits_for_read in a cycle, which is an e_mux
  assign pll_pll_slave_waits_for_read = pll_pll_slave_in_a_read_cycle & 0;

  //pll_pll_slave_in_a_read_cycle assignment, which is an e_assign
  assign pll_pll_slave_in_a_read_cycle = cpu_data_master_granted_pll_pll_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pll_pll_slave_in_a_read_cycle;

  //pll_pll_slave_waits_for_write in a cycle, which is an e_mux
  assign pll_pll_slave_waits_for_write = pll_pll_slave_in_a_write_cycle & 0;

  //pll_pll_slave_in_a_write_cycle assignment, which is an e_assign
  assign pll_pll_slave_in_a_write_cycle = cpu_data_master_granted_pll_pll_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pll_pll_slave_in_a_write_cycle;

  assign wait_for_pll_pll_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pll/pll_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_DE0_base1_sopc_clock_0_out_to_sdram_s1_module (
                                                                    // inputs:
                                                                     clear_fifo,
                                                                     clk,
                                                                     data_in,
                                                                     read,
                                                                     reset_n,
                                                                     sync_reset,
                                                                     write,

                                                                    // outputs:
                                                                     data_out,
                                                                     empty,
                                                                     fifo_contains_ones_n,
                                                                     full
                                                                  )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_DE0_base1_sopc_clock_1_out_to_sdram_s1_module (
                                                                    // inputs:
                                                                     clear_fifo,
                                                                     clk,
                                                                     data_in,
                                                                     read,
                                                                     reset_n,
                                                                     sync_reset,
                                                                     write,

                                                                    // outputs:
                                                                     data_out,
                                                                     empty,
                                                                     fifo_contains_ones_n,
                                                                     full
                                                                  )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_s1_arbitrator (
                             // inputs:
                              DE0_base1_sopc_clock_0_out_address_to_slave,
                              DE0_base1_sopc_clock_0_out_byteenable,
                              DE0_base1_sopc_clock_0_out_read,
                              DE0_base1_sopc_clock_0_out_write,
                              DE0_base1_sopc_clock_0_out_writedata,
                              DE0_base1_sopc_clock_1_out_address_to_slave,
                              DE0_base1_sopc_clock_1_out_byteenable,
                              DE0_base1_sopc_clock_1_out_read,
                              DE0_base1_sopc_clock_1_out_write,
                              DE0_base1_sopc_clock_1_out_writedata,
                              clk,
                              reset_n,
                              sdram_s1_readdata,
                              sdram_s1_readdatavalid,
                              sdram_s1_waitrequest,

                             // outputs:
                              DE0_base1_sopc_clock_0_out_granted_sdram_s1,
                              DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1,
                              DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1,
                              DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register,
                              DE0_base1_sopc_clock_0_out_requests_sdram_s1,
                              DE0_base1_sopc_clock_1_out_granted_sdram_s1,
                              DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1,
                              DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1,
                              DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register,
                              DE0_base1_sopc_clock_1_out_requests_sdram_s1,
                              d1_sdram_s1_end_xfer,
                              sdram_s1_address,
                              sdram_s1_byteenable_n,
                              sdram_s1_chipselect,
                              sdram_s1_read_n,
                              sdram_s1_readdata_from_sa,
                              sdram_s1_reset_n,
                              sdram_s1_waitrequest_from_sa,
                              sdram_s1_write_n,
                              sdram_s1_writedata
                           )
;

  output           DE0_base1_sopc_clock_0_out_granted_sdram_s1;
  output           DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1;
  output           DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1;
  output           DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register;
  output           DE0_base1_sopc_clock_0_out_requests_sdram_s1;
  output           DE0_base1_sopc_clock_1_out_granted_sdram_s1;
  output           DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1;
  output           DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1;
  output           DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register;
  output           DE0_base1_sopc_clock_1_out_requests_sdram_s1;
  output           d1_sdram_s1_end_xfer;
  output  [ 21: 0] sdram_s1_address;
  output  [  3: 0] sdram_s1_byteenable_n;
  output           sdram_s1_chipselect;
  output           sdram_s1_read_n;
  output  [ 31: 0] sdram_s1_readdata_from_sa;
  output           sdram_s1_reset_n;
  output           sdram_s1_waitrequest_from_sa;
  output           sdram_s1_write_n;
  output  [ 31: 0] sdram_s1_writedata;
  input   [ 23: 0] DE0_base1_sopc_clock_0_out_address_to_slave;
  input   [  3: 0] DE0_base1_sopc_clock_0_out_byteenable;
  input            DE0_base1_sopc_clock_0_out_read;
  input            DE0_base1_sopc_clock_0_out_write;
  input   [ 31: 0] DE0_base1_sopc_clock_0_out_writedata;
  input   [ 23: 0] DE0_base1_sopc_clock_1_out_address_to_slave;
  input   [  3: 0] DE0_base1_sopc_clock_1_out_byteenable;
  input            DE0_base1_sopc_clock_1_out_read;
  input            DE0_base1_sopc_clock_1_out_write;
  input   [ 31: 0] DE0_base1_sopc_clock_1_out_writedata;
  input            clk;
  input            reset_n;
  input   [ 31: 0] sdram_s1_readdata;
  input            sdram_s1_readdatavalid;
  input            sdram_s1_waitrequest;

  wire             DE0_base1_sopc_clock_0_out_arbiterlock;
  wire             DE0_base1_sopc_clock_0_out_arbiterlock2;
  wire             DE0_base1_sopc_clock_0_out_continuerequest;
  wire             DE0_base1_sopc_clock_0_out_granted_sdram_s1;
  wire             DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1;
  wire             DE0_base1_sopc_clock_0_out_rdv_fifo_empty_sdram_s1;
  wire             DE0_base1_sopc_clock_0_out_rdv_fifo_output_from_sdram_s1;
  wire             DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1;
  wire             DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register;
  wire             DE0_base1_sopc_clock_0_out_requests_sdram_s1;
  wire             DE0_base1_sopc_clock_0_out_saved_grant_sdram_s1;
  wire             DE0_base1_sopc_clock_1_out_arbiterlock;
  wire             DE0_base1_sopc_clock_1_out_arbiterlock2;
  wire             DE0_base1_sopc_clock_1_out_continuerequest;
  wire             DE0_base1_sopc_clock_1_out_granted_sdram_s1;
  wire             DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1;
  wire             DE0_base1_sopc_clock_1_out_rdv_fifo_empty_sdram_s1;
  wire             DE0_base1_sopc_clock_1_out_rdv_fifo_output_from_sdram_s1;
  wire             DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1;
  wire             DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register;
  wire             DE0_base1_sopc_clock_1_out_requests_sdram_s1;
  wire             DE0_base1_sopc_clock_1_out_saved_grant_sdram_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sdram_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sdram_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_DE0_base1_sopc_clock_0_out_granted_slave_sdram_s1;
  reg              last_cycle_DE0_base1_sopc_clock_1_out_granted_slave_sdram_s1;
  wire    [ 21: 0] sdram_s1_address;
  wire             sdram_s1_allgrants;
  wire             sdram_s1_allow_new_arb_cycle;
  wire             sdram_s1_any_bursting_master_saved_grant;
  wire             sdram_s1_any_continuerequest;
  reg     [  1: 0] sdram_s1_arb_addend;
  wire             sdram_s1_arb_counter_enable;
  reg              sdram_s1_arb_share_counter;
  wire             sdram_s1_arb_share_counter_next_value;
  wire             sdram_s1_arb_share_set_values;
  wire    [  1: 0] sdram_s1_arb_winner;
  wire             sdram_s1_arbitration_holdoff_internal;
  wire             sdram_s1_beginbursttransfer_internal;
  wire             sdram_s1_begins_xfer;
  wire    [  3: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire    [  3: 0] sdram_s1_chosen_master_double_vector;
  wire    [  1: 0] sdram_s1_chosen_master_rot_left;
  wire             sdram_s1_end_xfer;
  wire             sdram_s1_firsttransfer;
  wire    [  1: 0] sdram_s1_grant_vector;
  wire             sdram_s1_in_a_read_cycle;
  wire             sdram_s1_in_a_write_cycle;
  wire    [  1: 0] sdram_s1_master_qreq_vector;
  wire             sdram_s1_move_on_to_next_transaction;
  wire             sdram_s1_non_bursting_master_requests;
  wire             sdram_s1_read_n;
  wire    [ 31: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid_from_sa;
  reg              sdram_s1_reg_firsttransfer;
  wire             sdram_s1_reset_n;
  reg     [  1: 0] sdram_s1_saved_chosen_master_vector;
  reg              sdram_s1_slavearbiterlockenable;
  wire             sdram_s1_slavearbiterlockenable2;
  wire             sdram_s1_unreg_firsttransfer;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_waits_for_read;
  wire             sdram_s1_waits_for_write;
  wire             sdram_s1_write_n;
  wire    [ 31: 0] sdram_s1_writedata;
  wire    [ 23: 0] shifted_address_to_sdram_s1_from_DE0_base1_sopc_clock_0_out;
  wire    [ 23: 0] shifted_address_to_sdram_s1_from_DE0_base1_sopc_clock_1_out;
  wire             wait_for_sdram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sdram_s1_end_xfer;
    end


  assign sdram_s1_begins_xfer = ~d1_reasons_to_wait & ((DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1 | DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1));
  //assign sdram_s1_readdata_from_sa = sdram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdata_from_sa = sdram_s1_readdata;

  assign DE0_base1_sopc_clock_0_out_requests_sdram_s1 = (1) & (DE0_base1_sopc_clock_0_out_read | DE0_base1_sopc_clock_0_out_write);
  //assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest;

  //assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid;

  //sdram_s1_arb_share_counter set values, which is an e_mux
  assign sdram_s1_arb_share_set_values = 1;

  //sdram_s1_non_bursting_master_requests mux, which is an e_mux
  assign sdram_s1_non_bursting_master_requests = DE0_base1_sopc_clock_0_out_requests_sdram_s1 |
    DE0_base1_sopc_clock_1_out_requests_sdram_s1 |
    DE0_base1_sopc_clock_0_out_requests_sdram_s1 |
    DE0_base1_sopc_clock_1_out_requests_sdram_s1;

  //sdram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sdram_s1_any_bursting_master_saved_grant = 0;

  //sdram_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sdram_s1_arb_share_counter_next_value = sdram_s1_firsttransfer ? (sdram_s1_arb_share_set_values - 1) : |sdram_s1_arb_share_counter ? (sdram_s1_arb_share_counter - 1) : 0;

  //sdram_s1_allgrants all slave grants, which is an e_mux
  assign sdram_s1_allgrants = (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector);

  //sdram_s1_end_xfer assignment, which is an e_assign
  assign sdram_s1_end_xfer = ~(sdram_s1_waits_for_read | sdram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sdram_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sdram_s1 = sdram_s1_end_xfer & (~sdram_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sdram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sdram_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sdram_s1 & sdram_s1_allgrants) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests);

  //sdram_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_share_counter <= 0;
      else if (sdram_s1_arb_counter_enable)
          sdram_s1_arb_share_counter <= sdram_s1_arb_share_counter_next_value;
    end


  //sdram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_slavearbiterlockenable <= 0;
      else if ((|sdram_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sdram_s1) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests))
          sdram_s1_slavearbiterlockenable <= |sdram_s1_arb_share_counter_next_value;
    end


  //DE0_base1_sopc_clock_0/out sdram/s1 arbiterlock, which is an e_assign
  assign DE0_base1_sopc_clock_0_out_arbiterlock = sdram_s1_slavearbiterlockenable & DE0_base1_sopc_clock_0_out_continuerequest;

  //sdram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sdram_s1_slavearbiterlockenable2 = |sdram_s1_arb_share_counter_next_value;

  //DE0_base1_sopc_clock_0/out sdram/s1 arbiterlock2, which is an e_assign
  assign DE0_base1_sopc_clock_0_out_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & DE0_base1_sopc_clock_0_out_continuerequest;

  //DE0_base1_sopc_clock_1/out sdram/s1 arbiterlock, which is an e_assign
  assign DE0_base1_sopc_clock_1_out_arbiterlock = sdram_s1_slavearbiterlockenable & DE0_base1_sopc_clock_1_out_continuerequest;

  //DE0_base1_sopc_clock_1/out sdram/s1 arbiterlock2, which is an e_assign
  assign DE0_base1_sopc_clock_1_out_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & DE0_base1_sopc_clock_1_out_continuerequest;

  //DE0_base1_sopc_clock_1/out granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_DE0_base1_sopc_clock_1_out_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_DE0_base1_sopc_clock_1_out_granted_slave_sdram_s1 <= DE0_base1_sopc_clock_1_out_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~DE0_base1_sopc_clock_1_out_requests_sdram_s1) ? 0 : last_cycle_DE0_base1_sopc_clock_1_out_granted_slave_sdram_s1;
    end


  //DE0_base1_sopc_clock_1_out_continuerequest continued request, which is an e_mux
  assign DE0_base1_sopc_clock_1_out_continuerequest = last_cycle_DE0_base1_sopc_clock_1_out_granted_slave_sdram_s1 & DE0_base1_sopc_clock_1_out_requests_sdram_s1;

  //sdram_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sdram_s1_any_continuerequest = DE0_base1_sopc_clock_1_out_continuerequest |
    DE0_base1_sopc_clock_0_out_continuerequest;

  assign DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1 = DE0_base1_sopc_clock_0_out_requests_sdram_s1 & ~((DE0_base1_sopc_clock_0_out_read & ((|DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register))) | DE0_base1_sopc_clock_1_out_arbiterlock);
  //unique name for sdram_s1_move_on_to_next_transaction, which is an e_assign
  assign sdram_s1_move_on_to_next_transaction = sdram_s1_readdatavalid_from_sa;

  //rdv_fifo_for_DE0_base1_sopc_clock_0_out_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_DE0_base1_sopc_clock_0_out_to_sdram_s1_module rdv_fifo_for_DE0_base1_sopc_clock_0_out_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (DE0_base1_sopc_clock_0_out_granted_sdram_s1),
      .data_out             (DE0_base1_sopc_clock_0_out_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (DE0_base1_sopc_clock_0_out_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register = ~DE0_base1_sopc_clock_0_out_rdv_fifo_empty_sdram_s1;
  //local readdatavalid DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1, which is an e_mux
  assign DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & DE0_base1_sopc_clock_0_out_rdv_fifo_output_from_sdram_s1) & ~ DE0_base1_sopc_clock_0_out_rdv_fifo_empty_sdram_s1;

  //sdram_s1_writedata mux, which is an e_mux
  assign sdram_s1_writedata = (DE0_base1_sopc_clock_0_out_granted_sdram_s1)? DE0_base1_sopc_clock_0_out_writedata :
    DE0_base1_sopc_clock_1_out_writedata;

  assign DE0_base1_sopc_clock_1_out_requests_sdram_s1 = (1) & (DE0_base1_sopc_clock_1_out_read | DE0_base1_sopc_clock_1_out_write);
  //DE0_base1_sopc_clock_0/out granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_DE0_base1_sopc_clock_0_out_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_DE0_base1_sopc_clock_0_out_granted_slave_sdram_s1 <= DE0_base1_sopc_clock_0_out_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~DE0_base1_sopc_clock_0_out_requests_sdram_s1) ? 0 : last_cycle_DE0_base1_sopc_clock_0_out_granted_slave_sdram_s1;
    end


  //DE0_base1_sopc_clock_0_out_continuerequest continued request, which is an e_mux
  assign DE0_base1_sopc_clock_0_out_continuerequest = last_cycle_DE0_base1_sopc_clock_0_out_granted_slave_sdram_s1 & DE0_base1_sopc_clock_0_out_requests_sdram_s1;

  assign DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1 = DE0_base1_sopc_clock_1_out_requests_sdram_s1 & ~((DE0_base1_sopc_clock_1_out_read & ((|DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register))) | DE0_base1_sopc_clock_0_out_arbiterlock);
  //rdv_fifo_for_DE0_base1_sopc_clock_1_out_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_DE0_base1_sopc_clock_1_out_to_sdram_s1_module rdv_fifo_for_DE0_base1_sopc_clock_1_out_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (DE0_base1_sopc_clock_1_out_granted_sdram_s1),
      .data_out             (DE0_base1_sopc_clock_1_out_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (DE0_base1_sopc_clock_1_out_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register = ~DE0_base1_sopc_clock_1_out_rdv_fifo_empty_sdram_s1;
  //local readdatavalid DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1, which is an e_mux
  assign DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & DE0_base1_sopc_clock_1_out_rdv_fifo_output_from_sdram_s1) & ~ DE0_base1_sopc_clock_1_out_rdv_fifo_empty_sdram_s1;

  //allow new arb cycle for sdram/s1, which is an e_assign
  assign sdram_s1_allow_new_arb_cycle = ~DE0_base1_sopc_clock_0_out_arbiterlock & ~DE0_base1_sopc_clock_1_out_arbiterlock;

  //DE0_base1_sopc_clock_1/out assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[0] = DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1;

  //DE0_base1_sopc_clock_1/out grant sdram/s1, which is an e_assign
  assign DE0_base1_sopc_clock_1_out_granted_sdram_s1 = sdram_s1_grant_vector[0];

  //DE0_base1_sopc_clock_1/out saved-grant sdram/s1, which is an e_assign
  assign DE0_base1_sopc_clock_1_out_saved_grant_sdram_s1 = sdram_s1_arb_winner[0] && DE0_base1_sopc_clock_1_out_requests_sdram_s1;

  //DE0_base1_sopc_clock_0/out assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[1] = DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1;

  //DE0_base1_sopc_clock_0/out grant sdram/s1, which is an e_assign
  assign DE0_base1_sopc_clock_0_out_granted_sdram_s1 = sdram_s1_grant_vector[1];

  //DE0_base1_sopc_clock_0/out saved-grant sdram/s1, which is an e_assign
  assign DE0_base1_sopc_clock_0_out_saved_grant_sdram_s1 = sdram_s1_arb_winner[1] && DE0_base1_sopc_clock_0_out_requests_sdram_s1;

  //sdram/s1 chosen-master double-vector, which is an e_assign
  assign sdram_s1_chosen_master_double_vector = {sdram_s1_master_qreq_vector, sdram_s1_master_qreq_vector} & ({~sdram_s1_master_qreq_vector, ~sdram_s1_master_qreq_vector} + sdram_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign sdram_s1_arb_winner = (sdram_s1_allow_new_arb_cycle & | sdram_s1_grant_vector) ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;

  //saved sdram_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_saved_chosen_master_vector <= 0;
      else if (sdram_s1_allow_new_arb_cycle)
          sdram_s1_saved_chosen_master_vector <= |sdram_s1_grant_vector ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sdram_s1_grant_vector = {(sdram_s1_chosen_master_double_vector[1] | sdram_s1_chosen_master_double_vector[3]),
    (sdram_s1_chosen_master_double_vector[0] | sdram_s1_chosen_master_double_vector[2])};

  //sdram/s1 chosen master rotated left, which is an e_assign
  assign sdram_s1_chosen_master_rot_left = (sdram_s1_arb_winner << 1) ? (sdram_s1_arb_winner << 1) : 1;

  //sdram/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_addend <= 1;
      else if (|sdram_s1_grant_vector)
          sdram_s1_arb_addend <= sdram_s1_end_xfer? sdram_s1_chosen_master_rot_left : sdram_s1_grant_vector;
    end


  //sdram_s1_reset_n assignment, which is an e_assign
  assign sdram_s1_reset_n = reset_n;

  assign sdram_s1_chipselect = DE0_base1_sopc_clock_0_out_granted_sdram_s1 | DE0_base1_sopc_clock_1_out_granted_sdram_s1;
  //sdram_s1_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_firsttransfer = sdram_s1_begins_xfer ? sdram_s1_unreg_firsttransfer : sdram_s1_reg_firsttransfer;

  //sdram_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_unreg_firsttransfer = ~(sdram_s1_slavearbiterlockenable & sdram_s1_any_continuerequest);

  //sdram_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_reg_firsttransfer <= 1'b1;
      else if (sdram_s1_begins_xfer)
          sdram_s1_reg_firsttransfer <= sdram_s1_unreg_firsttransfer;
    end


  //sdram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sdram_s1_beginbursttransfer_internal = sdram_s1_begins_xfer;

  //sdram_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sdram_s1_arbitration_holdoff_internal = sdram_s1_begins_xfer & sdram_s1_firsttransfer;

  //~sdram_s1_read_n assignment, which is an e_mux
  assign sdram_s1_read_n = ~((DE0_base1_sopc_clock_0_out_granted_sdram_s1 & DE0_base1_sopc_clock_0_out_read) | (DE0_base1_sopc_clock_1_out_granted_sdram_s1 & DE0_base1_sopc_clock_1_out_read));

  //~sdram_s1_write_n assignment, which is an e_mux
  assign sdram_s1_write_n = ~((DE0_base1_sopc_clock_0_out_granted_sdram_s1 & DE0_base1_sopc_clock_0_out_write) | (DE0_base1_sopc_clock_1_out_granted_sdram_s1 & DE0_base1_sopc_clock_1_out_write));

  assign shifted_address_to_sdram_s1_from_DE0_base1_sopc_clock_0_out = DE0_base1_sopc_clock_0_out_address_to_slave;
  //sdram_s1_address mux, which is an e_mux
  assign sdram_s1_address = (DE0_base1_sopc_clock_0_out_granted_sdram_s1)? (shifted_address_to_sdram_s1_from_DE0_base1_sopc_clock_0_out >> 2) :
    (shifted_address_to_sdram_s1_from_DE0_base1_sopc_clock_1_out >> 2);

  assign shifted_address_to_sdram_s1_from_DE0_base1_sopc_clock_1_out = DE0_base1_sopc_clock_1_out_address_to_slave;
  //d1_sdram_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sdram_s1_end_xfer <= 1;
      else 
        d1_sdram_s1_end_xfer <= sdram_s1_end_xfer;
    end


  //sdram_s1_waits_for_read in a cycle, which is an e_mux
  assign sdram_s1_waits_for_read = sdram_s1_in_a_read_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_read_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_read_cycle = (DE0_base1_sopc_clock_0_out_granted_sdram_s1 & DE0_base1_sopc_clock_0_out_read) | (DE0_base1_sopc_clock_1_out_granted_sdram_s1 & DE0_base1_sopc_clock_1_out_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sdram_s1_in_a_read_cycle;

  //sdram_s1_waits_for_write in a cycle, which is an e_mux
  assign sdram_s1_waits_for_write = sdram_s1_in_a_write_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_write_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_write_cycle = (DE0_base1_sopc_clock_0_out_granted_sdram_s1 & DE0_base1_sopc_clock_0_out_write) | (DE0_base1_sopc_clock_1_out_granted_sdram_s1 & DE0_base1_sopc_clock_1_out_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sdram_s1_in_a_write_cycle;

  assign wait_for_sdram_s1_counter = 0;
  //~sdram_s1_byteenable_n byte enable port mux, which is an e_mux
  assign sdram_s1_byteenable_n = ~((DE0_base1_sopc_clock_0_out_granted_sdram_s1)? DE0_base1_sopc_clock_0_out_byteenable :
    (DE0_base1_sopc_clock_1_out_granted_sdram_s1)? DE0_base1_sopc_clock_1_out_byteenable :
    -1);


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sdram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (DE0_base1_sopc_clock_0_out_granted_sdram_s1 + DE0_base1_sopc_clock_1_out_granted_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (DE0_base1_sopc_clock_0_out_saved_grant_sdram_s1 + DE0_base1_sopc_clock_1_out_saved_grant_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_latency_counter,
                                         cpu_data_master_read,
                                         cpu_data_master_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         cpu_data_master_granted_sysid_control_slave,
                                         cpu_data_master_qualified_request_sysid_control_slave,
                                         cpu_data_master_read_data_valid_sysid_control_slave,
                                         cpu_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa,
                                         sysid_control_slave_reset_n
                                      )
;

  output           cpu_data_master_granted_sysid_control_slave;
  output           cpu_data_master_qualified_request_sysid_control_slave;
  output           cpu_data_master_read_data_valid_sysid_control_slave;
  output           cpu_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  output           sysid_control_slave_reset_n;
  input            clk;
  input   [ 25: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 25: 0] shifted_address_to_sysid_control_slave_from_cpu_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg              sysid_control_slave_arb_share_counter;
  wire             sysid_control_slave_arb_share_counter_next_value;
  wire             sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  wire             sysid_control_slave_reset_n;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign cpu_data_master_requests_sysid_control_slave = (({cpu_data_master_address_to_slave[25 : 3] , 3'b0} == 26'h2021018) & (cpu_data_master_read | cpu_data_master_write)) & cpu_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = cpu_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //cpu/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //cpu/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sysid_control_slave = cpu_data_master_requests_sysid_control_slave & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_sysid_control_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_sysid_control_slave = cpu_data_master_granted_sysid_control_slave & cpu_data_master_read & ~sysid_control_slave_waits_for_read;

  //master is always granted when requested
  assign cpu_data_master_granted_sysid_control_slave = cpu_data_master_qualified_request_sysid_control_slave;

  //cpu/data_master saved-grant sysid/control_slave, which is an e_assign
  assign cpu_data_master_saved_grant_sysid_control_slave = cpu_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_reset_n assignment, which is an e_assign
  assign sysid_control_slave_reset_n = reset_n;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_cpu_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = cpu_data_master_granted_sysid_control_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = cpu_data_master_granted_sysid_control_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_s1_arbitrator (
                             // inputs:
                              clk,
                              cpu_data_master_address_to_slave,
                              cpu_data_master_latency_counter,
                              cpu_data_master_read,
                              cpu_data_master_write,
                              cpu_data_master_writedata,
                              reset_n,
                              timer_s1_irq,
                              timer_s1_readdata,

                             // outputs:
                              cpu_data_master_granted_timer_s1,
                              cpu_data_master_qualified_request_timer_s1,
                              cpu_data_master_read_data_valid_timer_s1,
                              cpu_data_master_requests_timer_s1,
                              d1_timer_s1_end_xfer,
                              timer_s1_address,
                              timer_s1_chipselect,
                              timer_s1_irq_from_sa,
                              timer_s1_readdata_from_sa,
                              timer_s1_reset_n,
                              timer_s1_write_n,
                              timer_s1_writedata
                           )
;

  output           cpu_data_master_granted_timer_s1;
  output           cpu_data_master_qualified_request_timer_s1;
  output           cpu_data_master_read_data_valid_timer_s1;
  output           cpu_data_master_requests_timer_s1;
  output           d1_timer_s1_end_xfer;
  output  [  2: 0] timer_s1_address;
  output           timer_s1_chipselect;
  output           timer_s1_irq_from_sa;
  output  [ 15: 0] timer_s1_readdata_from_sa;
  output           timer_s1_reset_n;
  output           timer_s1_write_n;
  output  [ 15: 0] timer_s1_writedata;
  input            clk;
  input   [ 25: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            timer_s1_irq;
  input   [ 15: 0] timer_s1_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_timer_s1;
  wire             cpu_data_master_qualified_request_timer_s1;
  wire             cpu_data_master_read_data_valid_timer_s1;
  wire             cpu_data_master_requests_timer_s1;
  wire             cpu_data_master_saved_grant_timer_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 25: 0] shifted_address_to_timer_s1_from_cpu_data_master;
  wire    [  2: 0] timer_s1_address;
  wire             timer_s1_allgrants;
  wire             timer_s1_allow_new_arb_cycle;
  wire             timer_s1_any_bursting_master_saved_grant;
  wire             timer_s1_any_continuerequest;
  wire             timer_s1_arb_counter_enable;
  reg              timer_s1_arb_share_counter;
  wire             timer_s1_arb_share_counter_next_value;
  wire             timer_s1_arb_share_set_values;
  wire             timer_s1_beginbursttransfer_internal;
  wire             timer_s1_begins_xfer;
  wire             timer_s1_chipselect;
  wire             timer_s1_end_xfer;
  wire             timer_s1_firsttransfer;
  wire             timer_s1_grant_vector;
  wire             timer_s1_in_a_read_cycle;
  wire             timer_s1_in_a_write_cycle;
  wire             timer_s1_irq_from_sa;
  wire             timer_s1_master_qreq_vector;
  wire             timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_s1_readdata_from_sa;
  reg              timer_s1_reg_firsttransfer;
  wire             timer_s1_reset_n;
  reg              timer_s1_slavearbiterlockenable;
  wire             timer_s1_slavearbiterlockenable2;
  wire             timer_s1_unreg_firsttransfer;
  wire             timer_s1_waits_for_read;
  wire             timer_s1_waits_for_write;
  wire             timer_s1_write_n;
  wire    [ 15: 0] timer_s1_writedata;
  wire             wait_for_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_s1_end_xfer;
    end


  assign timer_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_timer_s1));
  //assign timer_s1_readdata_from_sa = timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_s1_readdata_from_sa = timer_s1_readdata;

  assign cpu_data_master_requests_timer_s1 = ({cpu_data_master_address_to_slave[25 : 5] , 5'b0} == 26'h0) & (cpu_data_master_read | cpu_data_master_write);
  //timer_s1_arb_share_counter set values, which is an e_mux
  assign timer_s1_arb_share_set_values = 1;

  //timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_s1_non_bursting_master_requests = cpu_data_master_requests_timer_s1;

  //timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_s1_any_bursting_master_saved_grant = 0;

  //timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_s1_arb_share_counter_next_value = timer_s1_firsttransfer ? (timer_s1_arb_share_set_values - 1) : |timer_s1_arb_share_counter ? (timer_s1_arb_share_counter - 1) : 0;

  //timer_s1_allgrants all slave grants, which is an e_mux
  assign timer_s1_allgrants = |timer_s1_grant_vector;

  //timer_s1_end_xfer assignment, which is an e_assign
  assign timer_s1_end_xfer = ~(timer_s1_waits_for_read | timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_s1 = timer_s1_end_xfer & (~timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_s1 & timer_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_s1 & ~timer_s1_non_bursting_master_requests);

  //timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_arb_share_counter <= 0;
      else if (timer_s1_arb_counter_enable)
          timer_s1_arb_share_counter <= timer_s1_arb_share_counter_next_value;
    end


  //timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_slavearbiterlockenable <= 0;
      else if ((|timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_s1) | (end_xfer_arb_share_counter_term_timer_s1 & ~timer_s1_non_bursting_master_requests))
          timer_s1_slavearbiterlockenable <= |timer_s1_arb_share_counter_next_value;
    end


  //cpu/data_master timer/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = timer_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_s1_slavearbiterlockenable2 = |timer_s1_arb_share_counter_next_value;

  //cpu/data_master timer/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = timer_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timer_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_timer_s1 = cpu_data_master_requests_timer_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_timer_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_timer_s1 = cpu_data_master_granted_timer_s1 & cpu_data_master_read & ~timer_s1_waits_for_read;

  //timer_s1_writedata mux, which is an e_mux
  assign timer_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_timer_s1 = cpu_data_master_qualified_request_timer_s1;

  //cpu/data_master saved-grant timer/s1, which is an e_assign
  assign cpu_data_master_saved_grant_timer_s1 = cpu_data_master_requests_timer_s1;

  //allow new arb cycle for timer/s1, which is an e_assign
  assign timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timer_s1_master_qreq_vector = 1;

  //timer_s1_reset_n assignment, which is an e_assign
  assign timer_s1_reset_n = reset_n;

  assign timer_s1_chipselect = cpu_data_master_granted_timer_s1;
  //timer_s1_firsttransfer first transaction, which is an e_assign
  assign timer_s1_firsttransfer = timer_s1_begins_xfer ? timer_s1_unreg_firsttransfer : timer_s1_reg_firsttransfer;

  //timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_s1_unreg_firsttransfer = ~(timer_s1_slavearbiterlockenable & timer_s1_any_continuerequest);

  //timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_reg_firsttransfer <= 1'b1;
      else if (timer_s1_begins_xfer)
          timer_s1_reg_firsttransfer <= timer_s1_unreg_firsttransfer;
    end


  //timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_s1_beginbursttransfer_internal = timer_s1_begins_xfer;

  //~timer_s1_write_n assignment, which is an e_mux
  assign timer_s1_write_n = ~(cpu_data_master_granted_timer_s1 & cpu_data_master_write);

  assign shifted_address_to_timer_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //timer_s1_address mux, which is an e_mux
  assign timer_s1_address = shifted_address_to_timer_s1_from_cpu_data_master >> 2;

  //d1_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_s1_end_xfer <= 1;
      else 
        d1_timer_s1_end_xfer <= timer_s1_end_xfer;
    end


  //timer_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_s1_waits_for_read = timer_s1_in_a_read_cycle & timer_s1_begins_xfer;

  //timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_s1_in_a_read_cycle = cpu_data_master_granted_timer_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_s1_in_a_read_cycle;

  //timer_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_s1_waits_for_write = timer_s1_in_a_write_cycle & 0;

  //timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_s1_in_a_write_cycle = cpu_data_master_granted_timer_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_s1_in_a_write_cycle;

  assign wait_for_timer_s1_counter = 0;
  //assign timer_s1_irq_from_sa = timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_s1_irq_from_sa = timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_base1_sopc_reset_clk_0_domain_synch_module (
                                                        // inputs:
                                                         clk,
                                                         data_in,
                                                         reset_n,

                                                        // outputs:
                                                         data_out
                                                      )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_base1_sopc_reset_clk_pllc0_domain_synch_module (
                                                            // inputs:
                                                             clk,
                                                             data_in,
                                                             reset_n,

                                                            // outputs:
                                                             data_out
                                                          )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_base1_sopc (
                        // 1) global signals:
                         clk_0,
                         clk_pllc0,
                         reset_n,

                        // the_pll
                         locked_from_the_pll,
                         phasedone_from_the_pll,

                        // the_sdram
                         zs_addr_from_the_sdram,
                         zs_ba_from_the_sdram,
                         zs_cas_n_from_the_sdram,
                         zs_cke_from_the_sdram,
                         zs_cs_n_from_the_sdram,
                         zs_dq_to_and_from_the_sdram,
                         zs_dqm_from_the_sdram,
                         zs_ras_n_from_the_sdram,
                         zs_we_n_from_the_sdram
                      )
;

  output           clk_pllc0;
  output           locked_from_the_pll;
  output           phasedone_from_the_pll;
  output  [ 11: 0] zs_addr_from_the_sdram;
  output  [  1: 0] zs_ba_from_the_sdram;
  output           zs_cas_n_from_the_sdram;
  output           zs_cke_from_the_sdram;
  output           zs_cs_n_from_the_sdram;
  inout   [ 31: 0] zs_dq_to_and_from_the_sdram;
  output  [  3: 0] zs_dqm_from_the_sdram;
  output           zs_ras_n_from_the_sdram;
  output           zs_we_n_from_the_sdram;
  input            clk_0;
  input            reset_n;

  wire    [ 23: 0] DE0_base1_sopc_clock_0_in_address;
  wire    [  3: 0] DE0_base1_sopc_clock_0_in_byteenable;
  wire             DE0_base1_sopc_clock_0_in_endofpacket;
  wire             DE0_base1_sopc_clock_0_in_endofpacket_from_sa;
  wire    [ 21: 0] DE0_base1_sopc_clock_0_in_nativeaddress;
  wire             DE0_base1_sopc_clock_0_in_read;
  wire    [ 31: 0] DE0_base1_sopc_clock_0_in_readdata;
  wire    [ 31: 0] DE0_base1_sopc_clock_0_in_readdata_from_sa;
  wire             DE0_base1_sopc_clock_0_in_reset_n;
  wire             DE0_base1_sopc_clock_0_in_waitrequest;
  wire             DE0_base1_sopc_clock_0_in_waitrequest_from_sa;
  wire             DE0_base1_sopc_clock_0_in_write;
  wire    [ 31: 0] DE0_base1_sopc_clock_0_in_writedata;
  wire    [ 23: 0] DE0_base1_sopc_clock_0_out_address;
  wire    [ 23: 0] DE0_base1_sopc_clock_0_out_address_to_slave;
  wire    [  3: 0] DE0_base1_sopc_clock_0_out_byteenable;
  wire             DE0_base1_sopc_clock_0_out_endofpacket;
  wire             DE0_base1_sopc_clock_0_out_granted_sdram_s1;
  wire    [ 21: 0] DE0_base1_sopc_clock_0_out_nativeaddress;
  wire             DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1;
  wire             DE0_base1_sopc_clock_0_out_read;
  wire             DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1;
  wire             DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register;
  wire    [ 31: 0] DE0_base1_sopc_clock_0_out_readdata;
  wire             DE0_base1_sopc_clock_0_out_requests_sdram_s1;
  wire             DE0_base1_sopc_clock_0_out_reset_n;
  wire             DE0_base1_sopc_clock_0_out_waitrequest;
  wire             DE0_base1_sopc_clock_0_out_write;
  wire    [ 31: 0] DE0_base1_sopc_clock_0_out_writedata;
  wire    [ 23: 0] DE0_base1_sopc_clock_1_in_address;
  wire    [  3: 0] DE0_base1_sopc_clock_1_in_byteenable;
  wire             DE0_base1_sopc_clock_1_in_endofpacket;
  wire             DE0_base1_sopc_clock_1_in_endofpacket_from_sa;
  wire    [ 21: 0] DE0_base1_sopc_clock_1_in_nativeaddress;
  wire             DE0_base1_sopc_clock_1_in_read;
  wire    [ 31: 0] DE0_base1_sopc_clock_1_in_readdata;
  wire    [ 31: 0] DE0_base1_sopc_clock_1_in_readdata_from_sa;
  wire             DE0_base1_sopc_clock_1_in_reset_n;
  wire             DE0_base1_sopc_clock_1_in_waitrequest;
  wire             DE0_base1_sopc_clock_1_in_waitrequest_from_sa;
  wire             DE0_base1_sopc_clock_1_in_write;
  wire    [ 31: 0] DE0_base1_sopc_clock_1_in_writedata;
  wire    [ 23: 0] DE0_base1_sopc_clock_1_out_address;
  wire    [ 23: 0] DE0_base1_sopc_clock_1_out_address_to_slave;
  wire    [  3: 0] DE0_base1_sopc_clock_1_out_byteenable;
  wire             DE0_base1_sopc_clock_1_out_endofpacket;
  wire             DE0_base1_sopc_clock_1_out_granted_sdram_s1;
  wire    [ 21: 0] DE0_base1_sopc_clock_1_out_nativeaddress;
  wire             DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1;
  wire             DE0_base1_sopc_clock_1_out_read;
  wire             DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1;
  wire             DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register;
  wire    [ 31: 0] DE0_base1_sopc_clock_1_out_readdata;
  wire             DE0_base1_sopc_clock_1_out_requests_sdram_s1;
  wire             DE0_base1_sopc_clock_1_out_reset_n;
  wire             DE0_base1_sopc_clock_1_out_waitrequest;
  wire             DE0_base1_sopc_clock_1_out_write;
  wire    [ 31: 0] DE0_base1_sopc_clock_1_out_writedata;
  wire             clk_0_reset_n;
  wire             clk_pllc0;
  wire             clk_pllc0_reset_n;
  wire    [  4: 0] cpu_custom_instruction_master_combo_a;
  wire    [  4: 0] cpu_custom_instruction_master_combo_b;
  wire    [  4: 0] cpu_custom_instruction_master_combo_c;
  wire    [ 31: 0] cpu_custom_instruction_master_combo_dataa;
  wire    [ 31: 0] cpu_custom_instruction_master_combo_datab;
  wire             cpu_custom_instruction_master_combo_estatus;
  wire    [ 31: 0] cpu_custom_instruction_master_combo_ipending;
  wire    [  7: 0] cpu_custom_instruction_master_combo_n;
  wire             cpu_custom_instruction_master_combo_readra;
  wire             cpu_custom_instruction_master_combo_readrb;
  wire    [ 31: 0] cpu_custom_instruction_master_combo_result;
  wire             cpu_custom_instruction_master_combo_status;
  wire             cpu_custom_instruction_master_combo_writerc;
  wire             cpu_custom_instruction_master_reset_n;
  wire    [ 25: 0] cpu_data_master_address;
  wire    [ 25: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_DE0_base1_sopc_clock_1_in;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_granted_onchip_memory2_s1;
  wire             cpu_data_master_granted_pll_pll_slave;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire             cpu_data_master_granted_timer_s1;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_latency_counter;
  wire             cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_onchip_memory2_s1;
  wire             cpu_data_master_qualified_request_pll_pll_slave;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_qualified_request_timer_s1;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_DE0_base1_sopc_clock_1_in;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_onchip_memory2_s1;
  wire             cpu_data_master_read_data_valid_pll_pll_slave;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_data_master_read_data_valid_timer_s1;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_readdatavalid;
  wire             cpu_data_master_requests_DE0_base1_sopc_clock_1_in;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_onchip_memory2_s1;
  wire             cpu_data_master_requests_pll_pll_slave;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_requests_timer_s1;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 25: 0] cpu_instruction_master_address;
  wire    [ 25: 0] cpu_instruction_master_address_to_slave;
  wire             cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_onchip_memory2_s1;
  wire             cpu_instruction_master_latency_counter;
  wire             cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_onchip_memory2_s1;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_DE0_base1_sopc_clock_0_in;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_onchip_memory2_s1;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_onchip_memory2_s1;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire    [ 31: 0] cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_dataa;
  wire             cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_n;
  wire    [ 31: 0] cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result;
  wire    [ 31: 0] cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result_from_sa;
  wire             cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_select;
  wire             d1_DE0_base1_sopc_clock_0_in_end_xfer;
  wire             d1_DE0_base1_sopc_clock_1_in_end_xfer;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_jtag_uart_avalon_jtag_slave_end_xfer;
  wire             d1_onchip_memory2_s1_end_xfer;
  wire             d1_pll_pll_slave_end_xfer;
  wire             d1_sdram_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_timer_s1_end_xfer;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_irq;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  wire             jtag_uart_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire             locked_from_the_pll;
  wire    [ 13: 0] onchip_memory2_s1_address;
  wire    [  3: 0] onchip_memory2_s1_byteenable;
  wire             onchip_memory2_s1_chipselect;
  wire             onchip_memory2_s1_clken;
  wire    [ 31: 0] onchip_memory2_s1_readdata;
  wire    [ 31: 0] onchip_memory2_s1_readdata_from_sa;
  wire             onchip_memory2_s1_reset;
  wire             onchip_memory2_s1_write;
  wire    [ 31: 0] onchip_memory2_s1_writedata;
  wire             out_clk_pll_c0;
  wire             phasedone_from_the_pll;
  wire    [  1: 0] pll_pll_slave_address;
  wire             pll_pll_slave_read;
  wire    [ 31: 0] pll_pll_slave_readdata;
  wire    [ 31: 0] pll_pll_slave_readdata_from_sa;
  wire             pll_pll_slave_reset;
  wire             pll_pll_slave_write;
  wire    [ 31: 0] pll_pll_slave_writedata;
  wire             reset_n_sources;
  wire    [ 21: 0] sdram_s1_address;
  wire    [  3: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire             sdram_s1_read_n;
  wire    [ 31: 0] sdram_s1_readdata;
  wire    [ 31: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid;
  wire             sdram_s1_reset_n;
  wire             sdram_s1_waitrequest;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_write_n;
  wire    [ 31: 0] sdram_s1_writedata;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
  wire    [  2: 0] timer_s1_address;
  wire             timer_s1_chipselect;
  wire             timer_s1_irq;
  wire             timer_s1_irq_from_sa;
  wire    [ 15: 0] timer_s1_readdata;
  wire    [ 15: 0] timer_s1_readdata_from_sa;
  wire             timer_s1_reset_n;
  wire             timer_s1_write_n;
  wire    [ 15: 0] timer_s1_writedata;
  wire    [ 11: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 31: 0] zs_dq_to_and_from_the_sdram;
  wire    [  3: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;
  DE0_base1_sopc_clock_0_in_arbitrator the_DE0_base1_sopc_clock_0_in
    (
      .DE0_base1_sopc_clock_0_in_address                                  (DE0_base1_sopc_clock_0_in_address),
      .DE0_base1_sopc_clock_0_in_byteenable                               (DE0_base1_sopc_clock_0_in_byteenable),
      .DE0_base1_sopc_clock_0_in_endofpacket                              (DE0_base1_sopc_clock_0_in_endofpacket),
      .DE0_base1_sopc_clock_0_in_endofpacket_from_sa                      (DE0_base1_sopc_clock_0_in_endofpacket_from_sa),
      .DE0_base1_sopc_clock_0_in_nativeaddress                            (DE0_base1_sopc_clock_0_in_nativeaddress),
      .DE0_base1_sopc_clock_0_in_read                                     (DE0_base1_sopc_clock_0_in_read),
      .DE0_base1_sopc_clock_0_in_readdata                                 (DE0_base1_sopc_clock_0_in_readdata),
      .DE0_base1_sopc_clock_0_in_readdata_from_sa                         (DE0_base1_sopc_clock_0_in_readdata_from_sa),
      .DE0_base1_sopc_clock_0_in_reset_n                                  (DE0_base1_sopc_clock_0_in_reset_n),
      .DE0_base1_sopc_clock_0_in_waitrequest                              (DE0_base1_sopc_clock_0_in_waitrequest),
      .DE0_base1_sopc_clock_0_in_waitrequest_from_sa                      (DE0_base1_sopc_clock_0_in_waitrequest_from_sa),
      .DE0_base1_sopc_clock_0_in_write                                    (DE0_base1_sopc_clock_0_in_write),
      .clk                                                                (clk_0),
      .cpu_instruction_master_address_to_slave                            (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in           (cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in),
      .cpu_instruction_master_latency_counter                             (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in (cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in),
      .cpu_instruction_master_read                                        (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_DE0_base1_sopc_clock_0_in   (cpu_instruction_master_read_data_valid_DE0_base1_sopc_clock_0_in),
      .cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in          (cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in),
      .d1_DE0_base1_sopc_clock_0_in_end_xfer                              (d1_DE0_base1_sopc_clock_0_in_end_xfer),
      .reset_n                                                            (clk_0_reset_n)
    );

  DE0_base1_sopc_clock_0_out_arbitrator the_DE0_base1_sopc_clock_0_out
    (
      .DE0_base1_sopc_clock_0_out_address                                 (DE0_base1_sopc_clock_0_out_address),
      .DE0_base1_sopc_clock_0_out_address_to_slave                        (DE0_base1_sopc_clock_0_out_address_to_slave),
      .DE0_base1_sopc_clock_0_out_byteenable                              (DE0_base1_sopc_clock_0_out_byteenable),
      .DE0_base1_sopc_clock_0_out_granted_sdram_s1                        (DE0_base1_sopc_clock_0_out_granted_sdram_s1),
      .DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1              (DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1),
      .DE0_base1_sopc_clock_0_out_read                                    (DE0_base1_sopc_clock_0_out_read),
      .DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1                (DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1),
      .DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register (DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register),
      .DE0_base1_sopc_clock_0_out_readdata                                (DE0_base1_sopc_clock_0_out_readdata),
      .DE0_base1_sopc_clock_0_out_requests_sdram_s1                       (DE0_base1_sopc_clock_0_out_requests_sdram_s1),
      .DE0_base1_sopc_clock_0_out_reset_n                                 (DE0_base1_sopc_clock_0_out_reset_n),
      .DE0_base1_sopc_clock_0_out_waitrequest                             (DE0_base1_sopc_clock_0_out_waitrequest),
      .DE0_base1_sopc_clock_0_out_write                                   (DE0_base1_sopc_clock_0_out_write),
      .DE0_base1_sopc_clock_0_out_writedata                               (DE0_base1_sopc_clock_0_out_writedata),
      .clk                                                                (clk_pllc0),
      .d1_sdram_s1_end_xfer                                               (d1_sdram_s1_end_xfer),
      .reset_n                                                            (clk_pllc0_reset_n),
      .sdram_s1_readdata_from_sa                                          (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                       (sdram_s1_waitrequest_from_sa)
    );

  DE0_base1_sopc_clock_0 the_DE0_base1_sopc_clock_0
    (
      .master_address       (DE0_base1_sopc_clock_0_out_address),
      .master_byteenable    (DE0_base1_sopc_clock_0_out_byteenable),
      .master_clk           (clk_pllc0),
      .master_endofpacket   (DE0_base1_sopc_clock_0_out_endofpacket),
      .master_nativeaddress (DE0_base1_sopc_clock_0_out_nativeaddress),
      .master_read          (DE0_base1_sopc_clock_0_out_read),
      .master_readdata      (DE0_base1_sopc_clock_0_out_readdata),
      .master_reset_n       (DE0_base1_sopc_clock_0_out_reset_n),
      .master_waitrequest   (DE0_base1_sopc_clock_0_out_waitrequest),
      .master_write         (DE0_base1_sopc_clock_0_out_write),
      .master_writedata     (DE0_base1_sopc_clock_0_out_writedata),
      .slave_address        (DE0_base1_sopc_clock_0_in_address),
      .slave_byteenable     (DE0_base1_sopc_clock_0_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (DE0_base1_sopc_clock_0_in_endofpacket),
      .slave_nativeaddress  (DE0_base1_sopc_clock_0_in_nativeaddress),
      .slave_read           (DE0_base1_sopc_clock_0_in_read),
      .slave_readdata       (DE0_base1_sopc_clock_0_in_readdata),
      .slave_reset_n        (DE0_base1_sopc_clock_0_in_reset_n),
      .slave_waitrequest    (DE0_base1_sopc_clock_0_in_waitrequest),
      .slave_write          (DE0_base1_sopc_clock_0_in_write),
      .slave_writedata      (DE0_base1_sopc_clock_0_in_writedata)
    );

  DE0_base1_sopc_clock_1_in_arbitrator the_DE0_base1_sopc_clock_1_in
    (
      .DE0_base1_sopc_clock_1_in_address                           (DE0_base1_sopc_clock_1_in_address),
      .DE0_base1_sopc_clock_1_in_byteenable                        (DE0_base1_sopc_clock_1_in_byteenable),
      .DE0_base1_sopc_clock_1_in_endofpacket                       (DE0_base1_sopc_clock_1_in_endofpacket),
      .DE0_base1_sopc_clock_1_in_endofpacket_from_sa               (DE0_base1_sopc_clock_1_in_endofpacket_from_sa),
      .DE0_base1_sopc_clock_1_in_nativeaddress                     (DE0_base1_sopc_clock_1_in_nativeaddress),
      .DE0_base1_sopc_clock_1_in_read                              (DE0_base1_sopc_clock_1_in_read),
      .DE0_base1_sopc_clock_1_in_readdata                          (DE0_base1_sopc_clock_1_in_readdata),
      .DE0_base1_sopc_clock_1_in_readdata_from_sa                  (DE0_base1_sopc_clock_1_in_readdata_from_sa),
      .DE0_base1_sopc_clock_1_in_reset_n                           (DE0_base1_sopc_clock_1_in_reset_n),
      .DE0_base1_sopc_clock_1_in_waitrequest                       (DE0_base1_sopc_clock_1_in_waitrequest),
      .DE0_base1_sopc_clock_1_in_waitrequest_from_sa               (DE0_base1_sopc_clock_1_in_waitrequest_from_sa),
      .DE0_base1_sopc_clock_1_in_write                             (DE0_base1_sopc_clock_1_in_write),
      .DE0_base1_sopc_clock_1_in_writedata                         (DE0_base1_sopc_clock_1_in_writedata),
      .clk                                                         (clk_0),
      .cpu_data_master_address_to_slave                            (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                  (cpu_data_master_byteenable),
      .cpu_data_master_granted_DE0_base1_sopc_clock_1_in           (cpu_data_master_granted_DE0_base1_sopc_clock_1_in),
      .cpu_data_master_latency_counter                             (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in (cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in),
      .cpu_data_master_read                                        (cpu_data_master_read),
      .cpu_data_master_read_data_valid_DE0_base1_sopc_clock_1_in   (cpu_data_master_read_data_valid_DE0_base1_sopc_clock_1_in),
      .cpu_data_master_requests_DE0_base1_sopc_clock_1_in          (cpu_data_master_requests_DE0_base1_sopc_clock_1_in),
      .cpu_data_master_write                                       (cpu_data_master_write),
      .cpu_data_master_writedata                                   (cpu_data_master_writedata),
      .d1_DE0_base1_sopc_clock_1_in_end_xfer                       (d1_DE0_base1_sopc_clock_1_in_end_xfer),
      .reset_n                                                     (clk_0_reset_n)
    );

  DE0_base1_sopc_clock_1_out_arbitrator the_DE0_base1_sopc_clock_1_out
    (
      .DE0_base1_sopc_clock_1_out_address                                 (DE0_base1_sopc_clock_1_out_address),
      .DE0_base1_sopc_clock_1_out_address_to_slave                        (DE0_base1_sopc_clock_1_out_address_to_slave),
      .DE0_base1_sopc_clock_1_out_byteenable                              (DE0_base1_sopc_clock_1_out_byteenable),
      .DE0_base1_sopc_clock_1_out_granted_sdram_s1                        (DE0_base1_sopc_clock_1_out_granted_sdram_s1),
      .DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1              (DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1),
      .DE0_base1_sopc_clock_1_out_read                                    (DE0_base1_sopc_clock_1_out_read),
      .DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1                (DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1),
      .DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register (DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register),
      .DE0_base1_sopc_clock_1_out_readdata                                (DE0_base1_sopc_clock_1_out_readdata),
      .DE0_base1_sopc_clock_1_out_requests_sdram_s1                       (DE0_base1_sopc_clock_1_out_requests_sdram_s1),
      .DE0_base1_sopc_clock_1_out_reset_n                                 (DE0_base1_sopc_clock_1_out_reset_n),
      .DE0_base1_sopc_clock_1_out_waitrequest                             (DE0_base1_sopc_clock_1_out_waitrequest),
      .DE0_base1_sopc_clock_1_out_write                                   (DE0_base1_sopc_clock_1_out_write),
      .DE0_base1_sopc_clock_1_out_writedata                               (DE0_base1_sopc_clock_1_out_writedata),
      .clk                                                                (clk_pllc0),
      .d1_sdram_s1_end_xfer                                               (d1_sdram_s1_end_xfer),
      .reset_n                                                            (clk_pllc0_reset_n),
      .sdram_s1_readdata_from_sa                                          (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                       (sdram_s1_waitrequest_from_sa)
    );

  DE0_base1_sopc_clock_1 the_DE0_base1_sopc_clock_1
    (
      .master_address       (DE0_base1_sopc_clock_1_out_address),
      .master_byteenable    (DE0_base1_sopc_clock_1_out_byteenable),
      .master_clk           (clk_pllc0),
      .master_endofpacket   (DE0_base1_sopc_clock_1_out_endofpacket),
      .master_nativeaddress (DE0_base1_sopc_clock_1_out_nativeaddress),
      .master_read          (DE0_base1_sopc_clock_1_out_read),
      .master_readdata      (DE0_base1_sopc_clock_1_out_readdata),
      .master_reset_n       (DE0_base1_sopc_clock_1_out_reset_n),
      .master_waitrequest   (DE0_base1_sopc_clock_1_out_waitrequest),
      .master_write         (DE0_base1_sopc_clock_1_out_write),
      .master_writedata     (DE0_base1_sopc_clock_1_out_writedata),
      .slave_address        (DE0_base1_sopc_clock_1_in_address),
      .slave_byteenable     (DE0_base1_sopc_clock_1_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (DE0_base1_sopc_clock_1_in_endofpacket),
      .slave_nativeaddress  (DE0_base1_sopc_clock_1_in_nativeaddress),
      .slave_read           (DE0_base1_sopc_clock_1_in_read),
      .slave_readdata       (DE0_base1_sopc_clock_1_in_readdata),
      .slave_reset_n        (DE0_base1_sopc_clock_1_in_reset_n),
      .slave_waitrequest    (DE0_base1_sopc_clock_1_in_waitrequest),
      .slave_write          (DE0_base1_sopc_clock_1_in_write),
      .slave_writedata      (DE0_base1_sopc_clock_1_in_writedata)
    );

  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                            (clk_0),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                    (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                  (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_latency_counter                                (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module        (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module          (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_requests_cpu_jtag_debug_module                 (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_data_master_writedata                                      (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                  (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                            (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                               (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                               (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                              (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                 (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_resetrequest                             (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                     (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                    (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                        (clk_0_reset_n)
    );

  cpu_custom_instruction_master_arbitrator the_cpu_custom_instruction_master
    (
      .clk                                                                        (clk_0),
      .cpu_custom_instruction_master_combo_result                                 (cpu_custom_instruction_master_combo_result),
      .cpu_custom_instruction_master_reset_n                                      (cpu_custom_instruction_master_reset_n),
      .cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result_from_sa (cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result_from_sa),
      .cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_select         (cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_select),
      .reset_n                                                                    (clk_0_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .DE0_base1_sopc_clock_1_in_readdata_from_sa                    (DE0_base1_sopc_clock_1_in_readdata_from_sa),
      .DE0_base1_sopc_clock_1_in_waitrequest_from_sa                 (DE0_base1_sopc_clock_1_in_waitrequest_from_sa),
      .clk                                                           (clk_0),
      .cpu_data_master_address                                       (cpu_data_master_address),
      .cpu_data_master_address_to_slave                              (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                    (cpu_data_master_byteenable),
      .cpu_data_master_granted_DE0_base1_sopc_clock_1_in             (cpu_data_master_granted_DE0_base1_sopc_clock_1_in),
      .cpu_data_master_granted_cpu_jtag_debug_module                 (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave           (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_granted_onchip_memory2_s1                     (cpu_data_master_granted_onchip_memory2_s1),
      .cpu_data_master_granted_pll_pll_slave                         (cpu_data_master_granted_pll_pll_slave),
      .cpu_data_master_granted_sysid_control_slave                   (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_granted_timer_s1                              (cpu_data_master_granted_timer_s1),
      .cpu_data_master_irq                                           (cpu_data_master_irq),
      .cpu_data_master_latency_counter                               (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in   (cpu_data_master_qualified_request_DE0_base1_sopc_clock_1_in),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module       (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_onchip_memory2_s1           (cpu_data_master_qualified_request_onchip_memory2_s1),
      .cpu_data_master_qualified_request_pll_pll_slave               (cpu_data_master_qualified_request_pll_pll_slave),
      .cpu_data_master_qualified_request_sysid_control_slave         (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_qualified_request_timer_s1                    (cpu_data_master_qualified_request_timer_s1),
      .cpu_data_master_read                                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_DE0_base1_sopc_clock_1_in     (cpu_data_master_read_data_valid_DE0_base1_sopc_clock_1_in),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module         (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave   (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_onchip_memory2_s1             (cpu_data_master_read_data_valid_onchip_memory2_s1),
      .cpu_data_master_read_data_valid_pll_pll_slave                 (cpu_data_master_read_data_valid_pll_pll_slave),
      .cpu_data_master_read_data_valid_sysid_control_slave           (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_read_data_valid_timer_s1                      (cpu_data_master_read_data_valid_timer_s1),
      .cpu_data_master_readdata                                      (cpu_data_master_readdata),
      .cpu_data_master_readdatavalid                                 (cpu_data_master_readdatavalid),
      .cpu_data_master_requests_DE0_base1_sopc_clock_1_in            (cpu_data_master_requests_DE0_base1_sopc_clock_1_in),
      .cpu_data_master_requests_cpu_jtag_debug_module                (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave          (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_onchip_memory2_s1                    (cpu_data_master_requests_onchip_memory2_s1),
      .cpu_data_master_requests_pll_pll_slave                        (cpu_data_master_requests_pll_pll_slave),
      .cpu_data_master_requests_sysid_control_slave                  (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_requests_timer_s1                             (cpu_data_master_requests_timer_s1),
      .cpu_data_master_waitrequest                                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                                         (cpu_data_master_write),
      .cpu_data_master_writedata                                     (cpu_data_master_writedata),
      .cpu_jtag_debug_module_readdata_from_sa                        (cpu_jtag_debug_module_readdata_from_sa),
      .d1_DE0_base1_sopc_clock_1_in_end_xfer                         (d1_DE0_base1_sopc_clock_1_in_end_xfer),
      .d1_cpu_jtag_debug_module_end_xfer                             (d1_cpu_jtag_debug_module_end_xfer),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                       (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .d1_onchip_memory2_s1_end_xfer                                 (d1_onchip_memory2_s1_end_xfer),
      .d1_pll_pll_slave_end_xfer                                     (d1_pll_pll_slave_end_xfer),
      .d1_sysid_control_slave_end_xfer                               (d1_sysid_control_slave_end_xfer),
      .d1_timer_s1_end_xfer                                          (d1_timer_s1_end_xfer),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                       (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                  (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa               (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .onchip_memory2_s1_readdata_from_sa                            (onchip_memory2_s1_readdata_from_sa),
      .pll_pll_slave_readdata_from_sa                                (pll_pll_slave_readdata_from_sa),
      .reset_n                                                       (clk_0_reset_n),
      .sysid_control_slave_readdata_from_sa                          (sysid_control_slave_readdata_from_sa),
      .timer_s1_irq_from_sa                                          (timer_s1_irq_from_sa),
      .timer_s1_readdata_from_sa                                     (timer_s1_readdata_from_sa)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .DE0_base1_sopc_clock_0_in_readdata_from_sa                         (DE0_base1_sopc_clock_0_in_readdata_from_sa),
      .DE0_base1_sopc_clock_0_in_waitrequest_from_sa                      (DE0_base1_sopc_clock_0_in_waitrequest_from_sa),
      .clk                                                                (clk_0),
      .cpu_instruction_master_address                                     (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                            (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in           (cpu_instruction_master_granted_DE0_base1_sopc_clock_0_in),
      .cpu_instruction_master_granted_cpu_jtag_debug_module               (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_onchip_memory2_s1                   (cpu_instruction_master_granted_onchip_memory2_s1),
      .cpu_instruction_master_latency_counter                             (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in (cpu_instruction_master_qualified_request_DE0_base1_sopc_clock_0_in),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module     (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_onchip_memory2_s1         (cpu_instruction_master_qualified_request_onchip_memory2_s1),
      .cpu_instruction_master_read                                        (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_DE0_base1_sopc_clock_0_in   (cpu_instruction_master_read_data_valid_DE0_base1_sopc_clock_0_in),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module       (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_onchip_memory2_s1           (cpu_instruction_master_read_data_valid_onchip_memory2_s1),
      .cpu_instruction_master_readdata                                    (cpu_instruction_master_readdata),
      .cpu_instruction_master_readdatavalid                               (cpu_instruction_master_readdatavalid),
      .cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in          (cpu_instruction_master_requests_DE0_base1_sopc_clock_0_in),
      .cpu_instruction_master_requests_cpu_jtag_debug_module              (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_onchip_memory2_s1                  (cpu_instruction_master_requests_onchip_memory2_s1),
      .cpu_instruction_master_waitrequest                                 (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                             (cpu_jtag_debug_module_readdata_from_sa),
      .d1_DE0_base1_sopc_clock_0_in_end_xfer                              (d1_DE0_base1_sopc_clock_0_in_end_xfer),
      .d1_cpu_jtag_debug_module_end_xfer                                  (d1_cpu_jtag_debug_module_end_xfer),
      .d1_onchip_memory2_s1_end_xfer                                      (d1_onchip_memory2_s1_end_xfer),
      .onchip_memory2_s1_readdata_from_sa                                 (onchip_memory2_s1_readdata_from_sa),
      .reset_n                                                            (clk_0_reset_n)
    );

  cpu the_cpu
    (
      .E_ci_combo_a                          (cpu_custom_instruction_master_combo_a),
      .E_ci_combo_b                          (cpu_custom_instruction_master_combo_b),
      .E_ci_combo_c                          (cpu_custom_instruction_master_combo_c),
      .E_ci_combo_dataa                      (cpu_custom_instruction_master_combo_dataa),
      .E_ci_combo_datab                      (cpu_custom_instruction_master_combo_datab),
      .E_ci_combo_estatus                    (cpu_custom_instruction_master_combo_estatus),
      .E_ci_combo_ipending                   (cpu_custom_instruction_master_combo_ipending),
      .E_ci_combo_n                          (cpu_custom_instruction_master_combo_n),
      .E_ci_combo_readra                     (cpu_custom_instruction_master_combo_readra),
      .E_ci_combo_readrb                     (cpu_custom_instruction_master_combo_readrb),
      .E_ci_combo_result                     (cpu_custom_instruction_master_combo_result),
      .E_ci_combo_status                     (cpu_custom_instruction_master_combo_status),
      .E_ci_combo_writerc                    (cpu_custom_instruction_master_combo_writerc),
      .clk                                   (clk_0),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_readdatavalid                       (cpu_data_master_readdatavalid),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_readdatavalid                       (cpu_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_custom_instruction_master_reset_n)
    );

  cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_arbitrator the_cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0
    (
      .clk                                                                        (clk_0),
      .cpu_custom_instruction_master_combo_dataa                                  (cpu_custom_instruction_master_combo_dataa),
      .cpu_custom_instruction_master_combo_n                                      (cpu_custom_instruction_master_combo_n),
      .cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_dataa          (cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_dataa),
      .cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_n              (cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_n),
      .cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result         (cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result),
      .cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result_from_sa (cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result_from_sa),
      .cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_select         (cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_select),
      .reset_n                                                                    (clk_0_reset_n)
    );

  cpu_mymath_custom_inst_inst the_cpu_mymath_custom_inst_inst
    (
      .dataa  (cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_dataa),
      .n      (cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_n),
      .result (cpu_mymath_custom_inst_inst_nios_custom_instruction_slave_0_result)
    );

  jtag_uart_avalon_jtag_slave_arbitrator the_jtag_uart_avalon_jtag_slave
    (
      .clk                                                           (clk_0),
      .cpu_data_master_address_to_slave                              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave           (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_latency_counter                               (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read                                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave   (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave          (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_write                                         (cpu_data_master_write),
      .cpu_data_master_writedata                                     (cpu_data_master_writedata),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                       (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .jtag_uart_avalon_jtag_slave_address                           (jtag_uart_avalon_jtag_slave_address),
      .jtag_uart_avalon_jtag_slave_chipselect                        (jtag_uart_avalon_jtag_slave_chipselect),
      .jtag_uart_avalon_jtag_slave_dataavailable                     (jtag_uart_avalon_jtag_slave_dataavailable),
      .jtag_uart_avalon_jtag_slave_dataavailable_from_sa             (jtag_uart_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_avalon_jtag_slave_irq                               (jtag_uart_avalon_jtag_slave_irq),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                       (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_read_n                            (jtag_uart_avalon_jtag_slave_read_n),
      .jtag_uart_avalon_jtag_slave_readdata                          (jtag_uart_avalon_jtag_slave_readdata),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                  (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_readyfordata                      (jtag_uart_avalon_jtag_slave_readyfordata),
      .jtag_uart_avalon_jtag_slave_readyfordata_from_sa              (jtag_uart_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_avalon_jtag_slave_reset_n                           (jtag_uart_avalon_jtag_slave_reset_n),
      .jtag_uart_avalon_jtag_slave_waitrequest                       (jtag_uart_avalon_jtag_slave_waitrequest),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa               (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_avalon_jtag_slave_write_n                           (jtag_uart_avalon_jtag_slave_write_n),
      .jtag_uart_avalon_jtag_slave_writedata                         (jtag_uart_avalon_jtag_slave_writedata),
      .reset_n                                                       (clk_0_reset_n)
    );

  jtag_uart the_jtag_uart
    (
      .av_address     (jtag_uart_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_avalon_jtag_slave_writedata),
      .clk            (clk_0),
      .dataavailable  (jtag_uart_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_avalon_jtag_slave_reset_n)
    );

  onchip_memory2_s1_arbitrator the_onchip_memory2_s1
    (
      .clk                                                        (clk_0),
      .cpu_data_master_address_to_slave                           (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                 (cpu_data_master_byteenable),
      .cpu_data_master_granted_onchip_memory2_s1                  (cpu_data_master_granted_onchip_memory2_s1),
      .cpu_data_master_latency_counter                            (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_onchip_memory2_s1        (cpu_data_master_qualified_request_onchip_memory2_s1),
      .cpu_data_master_read                                       (cpu_data_master_read),
      .cpu_data_master_read_data_valid_onchip_memory2_s1          (cpu_data_master_read_data_valid_onchip_memory2_s1),
      .cpu_data_master_requests_onchip_memory2_s1                 (cpu_data_master_requests_onchip_memory2_s1),
      .cpu_data_master_write                                      (cpu_data_master_write),
      .cpu_data_master_writedata                                  (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                    (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_onchip_memory2_s1           (cpu_instruction_master_granted_onchip_memory2_s1),
      .cpu_instruction_master_latency_counter                     (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_onchip_memory2_s1 (cpu_instruction_master_qualified_request_onchip_memory2_s1),
      .cpu_instruction_master_read                                (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_onchip_memory2_s1   (cpu_instruction_master_read_data_valid_onchip_memory2_s1),
      .cpu_instruction_master_requests_onchip_memory2_s1          (cpu_instruction_master_requests_onchip_memory2_s1),
      .d1_onchip_memory2_s1_end_xfer                              (d1_onchip_memory2_s1_end_xfer),
      .onchip_memory2_s1_address                                  (onchip_memory2_s1_address),
      .onchip_memory2_s1_byteenable                               (onchip_memory2_s1_byteenable),
      .onchip_memory2_s1_chipselect                               (onchip_memory2_s1_chipselect),
      .onchip_memory2_s1_clken                                    (onchip_memory2_s1_clken),
      .onchip_memory2_s1_readdata                                 (onchip_memory2_s1_readdata),
      .onchip_memory2_s1_readdata_from_sa                         (onchip_memory2_s1_readdata_from_sa),
      .onchip_memory2_s1_reset                                    (onchip_memory2_s1_reset),
      .onchip_memory2_s1_write                                    (onchip_memory2_s1_write),
      .onchip_memory2_s1_writedata                                (onchip_memory2_s1_writedata),
      .reset_n                                                    (clk_0_reset_n)
    );

  onchip_memory2 the_onchip_memory2
    (
      .address    (onchip_memory2_s1_address),
      .byteenable (onchip_memory2_s1_byteenable),
      .chipselect (onchip_memory2_s1_chipselect),
      .clk        (clk_0),
      .clken      (onchip_memory2_s1_clken),
      .readdata   (onchip_memory2_s1_readdata),
      .reset      (onchip_memory2_s1_reset),
      .write      (onchip_memory2_s1_write),
      .writedata  (onchip_memory2_s1_writedata)
    );

  pll_pll_slave_arbitrator the_pll_pll_slave
    (
      .clk                                             (clk_0),
      .cpu_data_master_address_to_slave                (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_pll_pll_slave           (cpu_data_master_granted_pll_pll_slave),
      .cpu_data_master_latency_counter                 (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_pll_pll_slave (cpu_data_master_qualified_request_pll_pll_slave),
      .cpu_data_master_read                            (cpu_data_master_read),
      .cpu_data_master_read_data_valid_pll_pll_slave   (cpu_data_master_read_data_valid_pll_pll_slave),
      .cpu_data_master_requests_pll_pll_slave          (cpu_data_master_requests_pll_pll_slave),
      .cpu_data_master_write                           (cpu_data_master_write),
      .cpu_data_master_writedata                       (cpu_data_master_writedata),
      .d1_pll_pll_slave_end_xfer                       (d1_pll_pll_slave_end_xfer),
      .pll_pll_slave_address                           (pll_pll_slave_address),
      .pll_pll_slave_read                              (pll_pll_slave_read),
      .pll_pll_slave_readdata                          (pll_pll_slave_readdata),
      .pll_pll_slave_readdata_from_sa                  (pll_pll_slave_readdata_from_sa),
      .pll_pll_slave_reset                             (pll_pll_slave_reset),
      .pll_pll_slave_write                             (pll_pll_slave_write),
      .pll_pll_slave_writedata                         (pll_pll_slave_writedata),
      .reset_n                                         (clk_0_reset_n)
    );

  //clk_pllc0 out_clk assignment, which is an e_assign
  assign clk_pllc0 = out_clk_pll_c0;

  pll the_pll
    (
      .address   (pll_pll_slave_address),
      .c0        (out_clk_pll_c0),
      .clk       (clk_0),
      .locked    (locked_from_the_pll),
      .phasedone (phasedone_from_the_pll),
      .read      (pll_pll_slave_read),
      .readdata  (pll_pll_slave_readdata),
      .reset     (pll_pll_slave_reset),
      .write     (pll_pll_slave_write),
      .writedata (pll_pll_slave_writedata)
    );

  sdram_s1_arbitrator the_sdram_s1
    (
      .DE0_base1_sopc_clock_0_out_address_to_slave                        (DE0_base1_sopc_clock_0_out_address_to_slave),
      .DE0_base1_sopc_clock_0_out_byteenable                              (DE0_base1_sopc_clock_0_out_byteenable),
      .DE0_base1_sopc_clock_0_out_granted_sdram_s1                        (DE0_base1_sopc_clock_0_out_granted_sdram_s1),
      .DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1              (DE0_base1_sopc_clock_0_out_qualified_request_sdram_s1),
      .DE0_base1_sopc_clock_0_out_read                                    (DE0_base1_sopc_clock_0_out_read),
      .DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1                (DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1),
      .DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register (DE0_base1_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register),
      .DE0_base1_sopc_clock_0_out_requests_sdram_s1                       (DE0_base1_sopc_clock_0_out_requests_sdram_s1),
      .DE0_base1_sopc_clock_0_out_write                                   (DE0_base1_sopc_clock_0_out_write),
      .DE0_base1_sopc_clock_0_out_writedata                               (DE0_base1_sopc_clock_0_out_writedata),
      .DE0_base1_sopc_clock_1_out_address_to_slave                        (DE0_base1_sopc_clock_1_out_address_to_slave),
      .DE0_base1_sopc_clock_1_out_byteenable                              (DE0_base1_sopc_clock_1_out_byteenable),
      .DE0_base1_sopc_clock_1_out_granted_sdram_s1                        (DE0_base1_sopc_clock_1_out_granted_sdram_s1),
      .DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1              (DE0_base1_sopc_clock_1_out_qualified_request_sdram_s1),
      .DE0_base1_sopc_clock_1_out_read                                    (DE0_base1_sopc_clock_1_out_read),
      .DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1                (DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1),
      .DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register (DE0_base1_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register),
      .DE0_base1_sopc_clock_1_out_requests_sdram_s1                       (DE0_base1_sopc_clock_1_out_requests_sdram_s1),
      .DE0_base1_sopc_clock_1_out_write                                   (DE0_base1_sopc_clock_1_out_write),
      .DE0_base1_sopc_clock_1_out_writedata                               (DE0_base1_sopc_clock_1_out_writedata),
      .clk                                                                (clk_pllc0),
      .d1_sdram_s1_end_xfer                                               (d1_sdram_s1_end_xfer),
      .reset_n                                                            (clk_pllc0_reset_n),
      .sdram_s1_address                                                   (sdram_s1_address),
      .sdram_s1_byteenable_n                                              (sdram_s1_byteenable_n),
      .sdram_s1_chipselect                                                (sdram_s1_chipselect),
      .sdram_s1_read_n                                                    (sdram_s1_read_n),
      .sdram_s1_readdata                                                  (sdram_s1_readdata),
      .sdram_s1_readdata_from_sa                                          (sdram_s1_readdata_from_sa),
      .sdram_s1_readdatavalid                                             (sdram_s1_readdatavalid),
      .sdram_s1_reset_n                                                   (sdram_s1_reset_n),
      .sdram_s1_waitrequest                                               (sdram_s1_waitrequest),
      .sdram_s1_waitrequest_from_sa                                       (sdram_s1_waitrequest_from_sa),
      .sdram_s1_write_n                                                   (sdram_s1_write_n),
      .sdram_s1_writedata                                                 (sdram_s1_writedata)
    );

  sdram the_sdram
    (
      .az_addr        (sdram_s1_address),
      .az_be_n        (sdram_s1_byteenable_n),
      .az_cs          (sdram_s1_chipselect),
      .az_data        (sdram_s1_writedata),
      .az_rd_n        (sdram_s1_read_n),
      .az_wr_n        (sdram_s1_write_n),
      .clk            (clk_pllc0),
      .reset_n        (sdram_s1_reset_n),
      .za_data        (sdram_s1_readdata),
      .za_valid       (sdram_s1_readdatavalid),
      .za_waitrequest (sdram_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_sdram),
      .zs_ba          (zs_ba_from_the_sdram),
      .zs_cas_n       (zs_cas_n_from_the_sdram),
      .zs_cke         (zs_cke_from_the_sdram),
      .zs_cs_n        (zs_cs_n_from_the_sdram),
      .zs_dq          (zs_dq_to_and_from_the_sdram),
      .zs_dqm         (zs_dqm_from_the_sdram),
      .zs_ras_n       (zs_ras_n_from_the_sdram),
      .zs_we_n        (zs_we_n_from_the_sdram)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                   (clk_0),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sysid_control_slave           (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_latency_counter                       (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_sysid_control_slave (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sysid_control_slave   (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_requests_sysid_control_slave          (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .d1_sysid_control_slave_end_xfer                       (d1_sysid_control_slave_end_xfer),
      .reset_n                                               (clk_0_reset_n),
      .sysid_control_slave_address                           (sysid_control_slave_address),
      .sysid_control_slave_readdata                          (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                  (sysid_control_slave_readdata_from_sa),
      .sysid_control_slave_reset_n                           (sysid_control_slave_reset_n)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .clock    (sysid_control_slave_clock),
      .readdata (sysid_control_slave_readdata),
      .reset_n  (sysid_control_slave_reset_n)
    );

  timer_s1_arbitrator the_timer_s1
    (
      .clk                                        (clk_0),
      .cpu_data_master_address_to_slave           (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_timer_s1           (cpu_data_master_granted_timer_s1),
      .cpu_data_master_latency_counter            (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_timer_s1 (cpu_data_master_qualified_request_timer_s1),
      .cpu_data_master_read                       (cpu_data_master_read),
      .cpu_data_master_read_data_valid_timer_s1   (cpu_data_master_read_data_valid_timer_s1),
      .cpu_data_master_requests_timer_s1          (cpu_data_master_requests_timer_s1),
      .cpu_data_master_write                      (cpu_data_master_write),
      .cpu_data_master_writedata                  (cpu_data_master_writedata),
      .d1_timer_s1_end_xfer                       (d1_timer_s1_end_xfer),
      .reset_n                                    (clk_0_reset_n),
      .timer_s1_address                           (timer_s1_address),
      .timer_s1_chipselect                        (timer_s1_chipselect),
      .timer_s1_irq                               (timer_s1_irq),
      .timer_s1_irq_from_sa                       (timer_s1_irq_from_sa),
      .timer_s1_readdata                          (timer_s1_readdata),
      .timer_s1_readdata_from_sa                  (timer_s1_readdata_from_sa),
      .timer_s1_reset_n                           (timer_s1_reset_n),
      .timer_s1_write_n                           (timer_s1_write_n),
      .timer_s1_writedata                         (timer_s1_writedata)
    );

  timer the_timer
    (
      .address    (timer_s1_address),
      .chipselect (timer_s1_chipselect),
      .clk        (clk_0),
      .irq        (timer_s1_irq),
      .readdata   (timer_s1_readdata),
      .reset_n    (timer_s1_reset_n),
      .write_n    (timer_s1_write_n),
      .writedata  (timer_s1_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  DE0_base1_sopc_reset_clk_0_domain_synch_module DE0_base1_sopc_reset_clk_0_domain_synch
    (
      .clk      (clk_0),
      .data_in  (1'b1),
      .data_out (clk_0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa |
    0);

  //reset is asserted asynchronously and deasserted synchronously
  DE0_base1_sopc_reset_clk_pllc0_domain_synch_module DE0_base1_sopc_reset_clk_pllc0_domain_synch
    (
      .clk      (clk_pllc0),
      .data_in  (1'b1),
      .data_out (clk_pllc0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //DE0_base1_sopc_clock_0_in_writedata of type writedata does not connect to anything so wire it to default (0)
  assign DE0_base1_sopc_clock_0_in_writedata = 0;

  //DE0_base1_sopc_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign DE0_base1_sopc_clock_0_out_endofpacket = 0;

  //DE0_base1_sopc_clock_1_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign DE0_base1_sopc_clock_1_out_endofpacket = 0;

  //sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  assign sysid_control_slave_clock = 0;


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/10.1/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/10.1/quartus/eda/sim_lib/220model.v"
`include "c:/altera/10.1/quartus/eda/sim_lib/sgate.v"
`include "cpu_mymath_custom_inst_inst.v"
`include "pll.vo"
`include "onchip_memory2.v"
`include "DE0_base1_sopc_clock_0.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "sdram.v"
`include "sysid.v"
`include "jtag_uart.v"
`include "DE0_base1_sopc_clock_1.v"
`include "timer.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             DE0_base1_sopc_clock_0_in_endofpacket_from_sa;
  wire    [ 31: 0] DE0_base1_sopc_clock_0_in_writedata;
  wire             DE0_base1_sopc_clock_0_out_endofpacket;
  wire    [ 21: 0] DE0_base1_sopc_clock_0_out_nativeaddress;
  wire             DE0_base1_sopc_clock_1_in_endofpacket_from_sa;
  wire             DE0_base1_sopc_clock_1_out_endofpacket;
  wire    [ 21: 0] DE0_base1_sopc_clock_1_out_nativeaddress;
  wire             clk;
  reg              clk_0;
  wire             clk_pllc0;
  wire    [  4: 0] cpu_custom_instruction_master_combo_a;
  wire    [  4: 0] cpu_custom_instruction_master_combo_b;
  wire    [  4: 0] cpu_custom_instruction_master_combo_c;
  wire    [ 31: 0] cpu_custom_instruction_master_combo_datab;
  wire             cpu_custom_instruction_master_combo_estatus;
  wire    [ 31: 0] cpu_custom_instruction_master_combo_ipending;
  wire             cpu_custom_instruction_master_combo_readra;
  wire             cpu_custom_instruction_master_combo_readrb;
  wire             cpu_custom_instruction_master_combo_status;
  wire             cpu_custom_instruction_master_combo_writerc;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             locked_from_the_pll;
  wire             phasedone_from_the_pll;
  reg              reset_n;
  wire             sysid_control_slave_clock;
  wire    [ 11: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 31: 0] zs_dq_to_and_from_the_sdram;
  wire    [  3: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  DE0_base1_sopc DUT
    (
      .clk_0                       (clk_0),
      .clk_pllc0                   (clk_pllc0),
      .locked_from_the_pll         (locked_from_the_pll),
      .phasedone_from_the_pll      (phasedone_from_the_pll),
      .reset_n                     (reset_n),
      .zs_addr_from_the_sdram      (zs_addr_from_the_sdram),
      .zs_ba_from_the_sdram        (zs_ba_from_the_sdram),
      .zs_cas_n_from_the_sdram     (zs_cas_n_from_the_sdram),
      .zs_cke_from_the_sdram       (zs_cke_from_the_sdram),
      .zs_cs_n_from_the_sdram      (zs_cs_n_from_the_sdram),
      .zs_dq_to_and_from_the_sdram (zs_dq_to_and_from_the_sdram),
      .zs_dqm_from_the_sdram       (zs_dqm_from_the_sdram),
      .zs_ras_n_from_the_sdram     (zs_ras_n_from_the_sdram),
      .zs_we_n_from_the_sdram      (zs_we_n_from_the_sdram)
    );

  initial
    clk_0 = 1'b0;
  always
    #10 clk_0 <= ~clk_0;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on