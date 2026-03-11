//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef MYIP_V2_0_HLS_SUBSYSTEM_MONITOR_SV
`define MYIP_V2_0_HLS_SUBSYSTEM_MONITOR_SV

`uvm_analysis_imp_decl(_svr_master_S_AXIS)
`uvm_analysis_imp_decl(_svr_slave_M_AXIS)

class myip_v2_0_HLS_subsystem_monitor extends uvm_component;

    myip_v2_0_HLS_reference_model refm;
    myip_v2_0_HLS_scoreboard scbd;

    `uvm_component_utils_begin(myip_v2_0_HLS_subsystem_monitor)
    `uvm_component_utils_end

    uvm_analysis_imp_svr_master_S_AXIS#(svr_pkg::svr_transfer#(41), myip_v2_0_HLS_subsystem_monitor) svr_master_S_AXIS_imp;
    uvm_analysis_imp_svr_slave_M_AXIS#(svr_pkg::svr_transfer#(41), myip_v2_0_HLS_subsystem_monitor) svr_slave_M_AXIS_imp;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(myip_v2_0_HLS_reference_model)::get(this, "", "refm", refm))
            `uvm_fatal(this.get_full_name(), "No refm from high level")
        `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_MEDIUM)
        scbd = myip_v2_0_HLS_scoreboard::type_id::create("scbd", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    function new (string name = "", uvm_component parent = null);
        super.new(name, parent);
        svr_master_S_AXIS_imp = new("svr_master_S_AXIS_imp", this);
        svr_slave_M_AXIS_imp = new("svr_slave_M_AXIS_imp", this);
    endfunction

    virtual function void write_svr_master_S_AXIS(svr_transfer#(41) tr);
        refm.write_svr_master_S_AXIS(tr);
        scbd.write_svr_master_S_AXIS(tr);
    endfunction

    virtual function void write_svr_slave_M_AXIS(svr_transfer#(41) tr);
        refm.write_svr_slave_M_AXIS(tr);
        scbd.write_svr_slave_M_AXIS(tr);
    endfunction
endclass
`endif
