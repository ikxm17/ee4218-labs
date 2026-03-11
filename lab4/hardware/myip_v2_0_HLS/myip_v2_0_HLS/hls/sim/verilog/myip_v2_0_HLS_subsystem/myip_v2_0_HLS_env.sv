//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef MYIP_V2_0_HLS_ENV__SV                                                                                   
    `define MYIP_V2_0_HLS_ENV__SV                                                                               
                                                                                                                    
                                                                                                                    
    class myip_v2_0_HLS_env extends uvm_env;                                                                          
                                                                                                                    
        myip_v2_0_HLS_virtual_sequencer myip_v2_0_HLS_virtual_sqr;                                                      
        myip_v2_0_HLS_config myip_v2_0_HLS_cfg;                                                                         
                                                                                                                    
        svr_pkg::svr_env#(41) env_master_svr_S_AXIS;
        svr_pkg::svr_env#(41) env_slave_svr_M_AXIS;
                                                                                                                    
        myip_v2_0_HLS_reference_model   refm;                                                                         
                                                                                                                    
        myip_v2_0_HLS_subsystem_monitor subsys_mon;                                                                   
                                                                                                                    
        `uvm_component_utils_begin(myip_v2_0_HLS_env)                                                                 
        `uvm_field_object (env_master_svr_S_AXIS,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (env_slave_svr_M_AXIS,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (refm, UVM_DEFAULT | UVM_REFERENCE)                                                       
        `uvm_field_object (myip_v2_0_HLS_virtual_sqr, UVM_DEFAULT | UVM_REFERENCE)                                    
        `uvm_field_object (myip_v2_0_HLS_cfg        , UVM_DEFAULT)                                                    
        `uvm_component_utils_end                                                                                    
                                                                                                                    
        function new (string name = "myip_v2_0_HLS_env", uvm_component parent = null);                              
            super.new(name, parent);                                                                                
        endfunction                                                                                                 
                                                                                                                    
        extern virtual function void build_phase(uvm_phase phase);                                                  
        extern virtual function void connect_phase(uvm_phase phase);                                                
        extern virtual task          run_phase(uvm_phase phase);                                                    
                                                                                                                    
    endclass                                                                                                        
                                                                                                                    
    function void myip_v2_0_HLS_env::build_phase(uvm_phase phase);                                                    
        super.build_phase(phase);                                                                                   
        myip_v2_0_HLS_cfg = myip_v2_0_HLS_config::type_id::create("myip_v2_0_HLS_cfg", this);                           
                                                                                                                    
        myip_v2_0_HLS_cfg.port_S_AXIS_cfg.svr_type = svr_pkg::SVR_MASTER ;
        env_master_svr_S_AXIS  = svr_env#(41)::type_id::create("env_master_svr_S_AXIS", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_master_svr_S_AXIS*", "cfg", myip_v2_0_HLS_cfg.port_S_AXIS_cfg);
        myip_v2_0_HLS_cfg.port_S_AXIS_cfg.prt_type = svr_pkg::AXIS;
        myip_v2_0_HLS_cfg.port_S_AXIS_cfg.is_active = svr_pkg::SVR_ACTIVE;
        myip_v2_0_HLS_cfg.port_S_AXIS_cfg.spec_cfg = svr_pkg::NORMAL;
        myip_v2_0_HLS_cfg.port_S_AXIS_cfg.reset_level = svr_pkg::RESET_LEVEL_LOW;
 
        myip_v2_0_HLS_cfg.port_M_AXIS_cfg.svr_type = svr_pkg::SVR_SLAVE ;
        env_slave_svr_M_AXIS  = svr_env#(41)::type_id::create("env_slave_svr_M_AXIS", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_slave_svr_M_AXIS*", "cfg", myip_v2_0_HLS_cfg.port_M_AXIS_cfg);
        myip_v2_0_HLS_cfg.port_M_AXIS_cfg.prt_type = svr_pkg::AXIS;
        myip_v2_0_HLS_cfg.port_M_AXIS_cfg.is_active = svr_pkg::SVR_ACTIVE;
        myip_v2_0_HLS_cfg.port_M_AXIS_cfg.spec_cfg = svr_pkg::NORMAL;
        myip_v2_0_HLS_cfg.port_M_AXIS_cfg.reset_level = svr_pkg::RESET_LEVEL_LOW;
 



        refm = myip_v2_0_HLS_reference_model::type_id::create("refm", this);


        uvm_config_db#(myip_v2_0_HLS_reference_model)::set(this, "*", "refm", refm);


        `uvm_info(this.get_full_name(), "set reference model by uvm_config_db", UVM_LOW)


        subsys_mon = myip_v2_0_HLS_subsystem_monitor::type_id::create("subsys_mon", this);


        myip_v2_0_HLS_virtual_sqr = myip_v2_0_HLS_virtual_sequencer::type_id::create("myip_v2_0_HLS_virtual_sqr", this);
        `uvm_info(this.get_full_name(), "build_phase done", UVM_LOW)
    endfunction


    function void myip_v2_0_HLS_env::connect_phase(uvm_phase phase);
        super.connect_phase(phase);


        myip_v2_0_HLS_virtual_sqr.svr_port_S_AXIS_sqr = env_master_svr_S_AXIS.m_agt.sqr;
        env_master_svr_S_AXIS.m_agt.mon.item_collect_port.connect(subsys_mon.svr_master_S_AXIS_imp);
 
        myip_v2_0_HLS_virtual_sqr.svr_port_M_AXIS_sqr = env_slave_svr_M_AXIS.s_agt.sqr;
        env_slave_svr_M_AXIS.s_agt.mon.item_collect_port.connect(subsys_mon.svr_slave_M_AXIS_imp);
 
        refm.myip_v2_0_HLS_cfg = myip_v2_0_HLS_cfg;
        `uvm_info(this.get_full_name(), "connect phase done", UVM_LOW)
    endfunction


    task myip_v2_0_HLS_env::run_phase(uvm_phase phase);
        `uvm_info(this.get_full_name(), "myip_v2_0_HLS_env is running", UVM_LOW)
    endtask


`endif
