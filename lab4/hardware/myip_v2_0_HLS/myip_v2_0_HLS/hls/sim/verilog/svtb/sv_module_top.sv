//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef SV_MODULE_TOP_SV
`define SV_MODULE_TOP_SV


`timescale 1ns/1ps


`include "uvm_macros.svh"
import uvm_pkg::*;
import file_agent_pkg::*;
import svr_pkg::*;
import myip_v2_0_HLS_subsystem_pkg::*;
`include "myip_v2_0_HLS_subsys_test_sequence_lib.sv"
`include "myip_v2_0_HLS_test_lib.sv"


module sv_module_top;


    misc_interface              misc_if ( .clock(apatb_myip_v2_0_HLS_top.AESL_clock), .reset(apatb_myip_v2_0_HLS_top.AESL_reset) );
    initial begin
        uvm_config_db #(virtual misc_interface)::set(null, "uvm_test_top.top_env.*", "misc_if", misc_if);
    end


    svr_if #(41)  svr_S_AXIS_if    (.clk  (apatb_myip_v2_0_HLS_top.AESL_clock), .rst(apatb_myip_v2_0_HLS_top.AESL_reset));
    assign svr_S_AXIS_if.ready = apatb_myip_v2_0_HLS_top.S_AXIS_TREADY;
    assign apatb_myip_v2_0_HLS_top.S_AXIS_TVALID = svr_S_AXIS_if.valid;
    assign apatb_myip_v2_0_HLS_top.S_AXIS_TDATA = svr_S_AXIS_if.data[31:0];
    assign apatb_myip_v2_0_HLS_top.S_AXIS_TKEEP = svr_S_AXIS_if.data[35:32];
    assign apatb_myip_v2_0_HLS_top.S_AXIS_TSTRB = svr_S_AXIS_if.data[39:36];
    assign apatb_myip_v2_0_HLS_top.S_AXIS_TLAST = svr_S_AXIS_if.data[40:40];
    initial begin
        uvm_config_db #( virtual svr_if#(41) )::set(null, "uvm_test_top.top_env.env_master_svr_S_AXIS.*", "vif", svr_S_AXIS_if);
    end


    svr_if #(41)  svr_M_AXIS_if    (.clk  (apatb_myip_v2_0_HLS_top.AESL_clock), .rst(apatb_myip_v2_0_HLS_top.AESL_reset));
    assign apatb_myip_v2_0_HLS_top.M_AXIS_TREADY = svr_M_AXIS_if.ready;
    assign svr_M_AXIS_if.valid = apatb_myip_v2_0_HLS_top.M_AXIS_TVALID;
    assign svr_M_AXIS_if.data[31:0] = apatb_myip_v2_0_HLS_top.M_AXIS_TDATA;
    assign svr_M_AXIS_if.data[35:32] = apatb_myip_v2_0_HLS_top.M_AXIS_TKEEP;
    assign svr_M_AXIS_if.data[39:36] = apatb_myip_v2_0_HLS_top.M_AXIS_TSTRB;
    assign svr_M_AXIS_if.data[40:40] = apatb_myip_v2_0_HLS_top.M_AXIS_TLAST;
    initial begin
        uvm_config_db #( virtual svr_if#(41) )::set(null, "uvm_test_top.top_env.env_slave_svr_M_AXIS.*", "vif", svr_M_AXIS_if);
    end


    initial begin
        run_test();
    end
endmodule
`endif
