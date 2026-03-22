//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef MYIP_V2_0_HLS_CONFIG__SV                        
    `define MYIP_V2_0_HLS_CONFIG__SV                    
                                                            
    class myip_v2_0_HLS_config extends uvm_object;            
                                                            
        int check_ena;                                      
        int cover_ena;                                      
        svr_pkg::svr_config port_S_AXIS_cfg;
        svr_pkg::svr_config port_M_AXIS_cfg;

        `uvm_object_utils_begin(myip_v2_0_HLS_config)         
        `uvm_field_object(port_S_AXIS_cfg, UVM_DEFAULT)
        `uvm_field_object(port_M_AXIS_cfg, UVM_DEFAULT)
        `uvm_field_int   (check_ena , UVM_DEFAULT)          
        `uvm_field_int   (cover_ena , UVM_DEFAULT)          
        `uvm_object_utils_end                               

        function new (string name = "myip_v2_0_HLS_config");
            super.new(name);                                
            port_S_AXIS_cfg = svr_pkg::svr_config::type_id::create("port_S_AXIS_cfg");
            port_M_AXIS_cfg = svr_pkg::svr_config::type_id::create("port_M_AXIS_cfg");
        endfunction                                         
                                                            
    endclass                                                
                                                            
`endif                                                      
