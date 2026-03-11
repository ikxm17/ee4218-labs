//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`timescale 1ns/1ps 

`ifndef MYIP_V2_0_HLS_SUBSYSTEM_PKG__SV          
    `define MYIP_V2_0_HLS_SUBSYSTEM_PKG__SV      
                                                     
    package myip_v2_0_HLS_subsystem_pkg;               
                                                     
        import uvm_pkg::*;                           
        import file_agent_pkg::*;                    
        import svr_pkg::*;
                                                     
        `include "uvm_macros.svh"                  
                                                     
        `include "myip_v2_0_HLS_config.sv"           
        `include "myip_v2_0_HLS_reference_model.sv"  
        `include "myip_v2_0_HLS_scoreboard.sv"       
        `include "myip_v2_0_HLS_subsystem_monitor.sv"
        `include "myip_v2_0_HLS_virtual_sequencer.sv"
        `include "myip_v2_0_HLS_pkg_sequence_lib.sv" 
        `include "myip_v2_0_HLS_env.sv"              
                                                     
    endpackage                                       
                                                     
`endif                                               
