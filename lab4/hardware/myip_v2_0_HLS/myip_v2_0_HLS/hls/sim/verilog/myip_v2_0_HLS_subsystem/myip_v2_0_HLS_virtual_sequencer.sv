//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef MYIP_V2_0_HLS_VIRTUAL_SEQUENCER__SV                        
    `define MYIP_V2_0_HLS_VIRTUAL_SEQUENCER__SV                    
                                                                       
    class myip_v2_0_HLS_virtual_sequencer extends uvm_sequencer;         
        svr_master_sequencer#(41) svr_port_S_AXIS_sqr;
        svr_slave_sequencer#(41) svr_port_M_AXIS_sqr;
 
        function new (string name, uvm_component parent);              
            super.new(name, parent);                                   
            //`uvm_info(this.get_full_name(), "new is called", UVM_LOW)
        endfunction                                                    
                                                                       
        `uvm_component_utils_begin(myip_v2_0_HLS_virtual_sequencer)      
        `uvm_component_utils_end                                       
                                                                       
    endclass

`endif
