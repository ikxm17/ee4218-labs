set moduleName Loop_myip_v2_0_HLS_read_inputs_proc
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type loop_auto_rewind
set FunctionProtocol ap_ctrl_none
set restart_counter_num 0
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 6
set C_modelName {Loop_myip_v2_0_HLS_read_inputs_proc}
set C_modelType { int 256 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict mat_A_7 { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict mat_A_6 { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict mat_A_5 { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict mat_A_4 { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict mat_A_3 { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict mat_A_2 { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict mat_A_1 { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict mat_A_0 { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ mat_A_7 int 32 regular {array 64 { 0 3 } 0 1 }  }
	{ mat_A_6 int 32 regular {array 64 { 0 3 } 0 1 }  }
	{ mat_A_5 int 32 regular {array 64 { 0 3 } 0 1 }  }
	{ mat_A_4 int 32 regular {array 64 { 0 3 } 0 1 }  }
	{ mat_A_3 int 32 regular {array 64 { 0 3 } 0 1 }  }
	{ mat_A_2 int 32 regular {array 64 { 0 3 } 0 1 }  }
	{ mat_A_1 int 32 regular {array 64 { 0 3 } 0 1 }  }
	{ mat_A_0 int 32 regular {array 64 { 0 3 } 0 1 }  }
	{ S_AXIS_V_data_V int 32 regular {axi_s 0 volatile  { S_AXIS Data } }  }
	{ S_AXIS_V_keep_V int 4 regular {axi_s 0 volatile  { S_AXIS Keep } }  }
	{ S_AXIS_V_strb_V int 4 regular {axi_s 0 volatile  { S_AXIS Strb } }  }
	{ S_AXIS_V_last_V int 1 regular {axi_s 0 volatile  { S_AXIS Last } }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "mat_A_7", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mat_A_6", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mat_A_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mat_A_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mat_A_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mat_A_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mat_A_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mat_A_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "S_AXIS_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "S_AXIS_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "S_AXIS_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "S_AXIS_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 256} ]}
# RTL Port declarations: 
set portNum 53
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ S_AXIS_TVALID sc_in sc_logic 1 invld 11 } 
	{ mat_A_7_address0 sc_out sc_lv 6 signal 0 } 
	{ mat_A_7_ce0 sc_out sc_logic 1 signal 0 } 
	{ mat_A_7_we0 sc_out sc_logic 1 signal 0 } 
	{ mat_A_7_d0 sc_out sc_lv 32 signal 0 } 
	{ mat_A_6_address0 sc_out sc_lv 6 signal 1 } 
	{ mat_A_6_ce0 sc_out sc_logic 1 signal 1 } 
	{ mat_A_6_we0 sc_out sc_logic 1 signal 1 } 
	{ mat_A_6_d0 sc_out sc_lv 32 signal 1 } 
	{ mat_A_5_address0 sc_out sc_lv 6 signal 2 } 
	{ mat_A_5_ce0 sc_out sc_logic 1 signal 2 } 
	{ mat_A_5_we0 sc_out sc_logic 1 signal 2 } 
	{ mat_A_5_d0 sc_out sc_lv 32 signal 2 } 
	{ mat_A_4_address0 sc_out sc_lv 6 signal 3 } 
	{ mat_A_4_ce0 sc_out sc_logic 1 signal 3 } 
	{ mat_A_4_we0 sc_out sc_logic 1 signal 3 } 
	{ mat_A_4_d0 sc_out sc_lv 32 signal 3 } 
	{ mat_A_3_address0 sc_out sc_lv 6 signal 4 } 
	{ mat_A_3_ce0 sc_out sc_logic 1 signal 4 } 
	{ mat_A_3_we0 sc_out sc_logic 1 signal 4 } 
	{ mat_A_3_d0 sc_out sc_lv 32 signal 4 } 
	{ mat_A_2_address0 sc_out sc_lv 6 signal 5 } 
	{ mat_A_2_ce0 sc_out sc_logic 1 signal 5 } 
	{ mat_A_2_we0 sc_out sc_logic 1 signal 5 } 
	{ mat_A_2_d0 sc_out sc_lv 32 signal 5 } 
	{ mat_A_1_address0 sc_out sc_lv 6 signal 6 } 
	{ mat_A_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ mat_A_1_we0 sc_out sc_logic 1 signal 6 } 
	{ mat_A_1_d0 sc_out sc_lv 32 signal 6 } 
	{ mat_A_0_address0 sc_out sc_lv 6 signal 7 } 
	{ mat_A_0_ce0 sc_out sc_logic 1 signal 7 } 
	{ mat_A_0_we0 sc_out sc_logic 1 signal 7 } 
	{ mat_A_0_d0 sc_out sc_lv 32 signal 7 } 
	{ S_AXIS_TDATA sc_in sc_lv 32 signal 8 } 
	{ S_AXIS_TREADY sc_out sc_logic 1 inacc 11 } 
	{ S_AXIS_TKEEP sc_in sc_lv 4 signal 9 } 
	{ S_AXIS_TSTRB sc_in sc_lv 4 signal 10 } 
	{ S_AXIS_TLAST sc_in sc_lv 1 signal 11 } 
	{ ap_return_0 sc_out sc_lv 32 signal -1 } 
	{ ap_return_1 sc_out sc_lv 32 signal -1 } 
	{ ap_return_2 sc_out sc_lv 32 signal -1 } 
	{ ap_return_3 sc_out sc_lv 32 signal -1 } 
	{ ap_return_4 sc_out sc_lv 32 signal -1 } 
	{ ap_return_5 sc_out sc_lv 32 signal -1 } 
	{ ap_return_6 sc_out sc_lv 32 signal -1 } 
	{ ap_return_7 sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "S_AXIS_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "S_AXIS_V_last_V", "role": "default" }} , 
 	{ "name": "mat_A_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "mat_A_7", "role": "address0" }} , 
 	{ "name": "mat_A_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_7", "role": "ce0" }} , 
 	{ "name": "mat_A_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_7", "role": "we0" }} , 
 	{ "name": "mat_A_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mat_A_7", "role": "d0" }} , 
 	{ "name": "mat_A_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "mat_A_6", "role": "address0" }} , 
 	{ "name": "mat_A_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_6", "role": "ce0" }} , 
 	{ "name": "mat_A_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_6", "role": "we0" }} , 
 	{ "name": "mat_A_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mat_A_6", "role": "d0" }} , 
 	{ "name": "mat_A_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "mat_A_5", "role": "address0" }} , 
 	{ "name": "mat_A_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_5", "role": "ce0" }} , 
 	{ "name": "mat_A_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_5", "role": "we0" }} , 
 	{ "name": "mat_A_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mat_A_5", "role": "d0" }} , 
 	{ "name": "mat_A_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "mat_A_4", "role": "address0" }} , 
 	{ "name": "mat_A_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_4", "role": "ce0" }} , 
 	{ "name": "mat_A_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_4", "role": "we0" }} , 
 	{ "name": "mat_A_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mat_A_4", "role": "d0" }} , 
 	{ "name": "mat_A_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "mat_A_3", "role": "address0" }} , 
 	{ "name": "mat_A_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_3", "role": "ce0" }} , 
 	{ "name": "mat_A_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_3", "role": "we0" }} , 
 	{ "name": "mat_A_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mat_A_3", "role": "d0" }} , 
 	{ "name": "mat_A_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "mat_A_2", "role": "address0" }} , 
 	{ "name": "mat_A_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_2", "role": "ce0" }} , 
 	{ "name": "mat_A_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_2", "role": "we0" }} , 
 	{ "name": "mat_A_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mat_A_2", "role": "d0" }} , 
 	{ "name": "mat_A_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "mat_A_1", "role": "address0" }} , 
 	{ "name": "mat_A_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_1", "role": "ce0" }} , 
 	{ "name": "mat_A_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_1", "role": "we0" }} , 
 	{ "name": "mat_A_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mat_A_1", "role": "d0" }} , 
 	{ "name": "mat_A_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "mat_A_0", "role": "address0" }} , 
 	{ "name": "mat_A_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_0", "role": "ce0" }} , 
 	{ "name": "mat_A_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mat_A_0", "role": "we0" }} , 
 	{ "name": "mat_A_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mat_A_0", "role": "d0" }} , 
 	{ "name": "S_AXIS_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "S_AXIS_V_data_V", "role": "default" }} , 
 	{ "name": "S_AXIS_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "S_AXIS_V_last_V", "role": "default" }} , 
 	{ "name": "S_AXIS_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "S_AXIS_V_keep_V", "role": "default" }} , 
 	{ "name": "S_AXIS_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "S_AXIS_V_strb_V", "role": "default" }} , 
 	{ "name": "S_AXIS_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "S_AXIS_V_last_V", "role": "default" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }} , 
 	{ "name": "ap_return_4", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_4", "role": "default" }} , 
 	{ "name": "ap_return_5", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_5", "role": "default" }} , 
 	{ "name": "ap_return_6", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_6", "role": "default" }} , 
 	{ "name": "ap_return_7", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_7", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	Loop_myip_v2_0_HLS_read_inputs_proc {
		mat_A_7 {Type O LastRead -1 FirstWrite 0}
		mat_A_6 {Type O LastRead -1 FirstWrite 0}
		mat_A_5 {Type O LastRead -1 FirstWrite 0}
		mat_A_4 {Type O LastRead -1 FirstWrite 0}
		mat_A_3 {Type O LastRead -1 FirstWrite 0}
		mat_A_2 {Type O LastRead -1 FirstWrite 0}
		mat_A_1 {Type O LastRead -1 FirstWrite 0}
		mat_A_0 {Type O LastRead -1 FirstWrite 0}
		S_AXIS_V_data_V {Type I LastRead 0 FirstWrite -1}
		S_AXIS_V_keep_V {Type I LastRead 0 FirstWrite -1}
		S_AXIS_V_strb_V {Type I LastRead 0 FirstWrite -1}
		S_AXIS_V_last_V {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "521", "Max" : "521"}
	, {"Name" : "Interval", "Min" : "520", "Max" : "520"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	mat_A_7 { ap_memory {  { mat_A_7_address0 mem_address 1 6 }  { mat_A_7_ce0 mem_ce 1 1 }  { mat_A_7_we0 mem_we 1 1 }  { mat_A_7_d0 mem_din 1 32 } } }
	mat_A_6 { ap_memory {  { mat_A_6_address0 mem_address 1 6 }  { mat_A_6_ce0 mem_ce 1 1 }  { mat_A_6_we0 mem_we 1 1 }  { mat_A_6_d0 mem_din 1 32 } } }
	mat_A_5 { ap_memory {  { mat_A_5_address0 mem_address 1 6 }  { mat_A_5_ce0 mem_ce 1 1 }  { mat_A_5_we0 mem_we 1 1 }  { mat_A_5_d0 mem_din 1 32 } } }
	mat_A_4 { ap_memory {  { mat_A_4_address0 mem_address 1 6 }  { mat_A_4_ce0 mem_ce 1 1 }  { mat_A_4_we0 mem_we 1 1 }  { mat_A_4_d0 mem_din 1 32 } } }
	mat_A_3 { ap_memory {  { mat_A_3_address0 mem_address 1 6 }  { mat_A_3_ce0 mem_ce 1 1 }  { mat_A_3_we0 mem_we 1 1 }  { mat_A_3_d0 mem_din 1 32 } } }
	mat_A_2 { ap_memory {  { mat_A_2_address0 mem_address 1 6 }  { mat_A_2_ce0 mem_ce 1 1 }  { mat_A_2_we0 mem_we 1 1 }  { mat_A_2_d0 mem_din 1 32 } } }
	mat_A_1 { ap_memory {  { mat_A_1_address0 mem_address 1 6 }  { mat_A_1_ce0 mem_ce 1 1 }  { mat_A_1_we0 mem_we 1 1 }  { mat_A_1_d0 mem_din 1 32 } } }
	mat_A_0 { ap_memory {  { mat_A_0_address0 mem_address 1 6 }  { mat_A_0_ce0 mem_ce 1 1 }  { mat_A_0_we0 mem_we 1 1 }  { mat_A_0_d0 mem_din 1 32 } } }
	S_AXIS_V_data_V { axis {  { S_AXIS_TDATA in_data 0 32 } } }
	S_AXIS_V_keep_V { axis {  { S_AXIS_TKEEP in_data 0 4 } } }
	S_AXIS_V_strb_V { axis {  { S_AXIS_TSTRB in_data 0 4 } } }
	S_AXIS_V_last_V { axis {  { S_AXIS_TVALID in_vld 0 1 }  { S_AXIS_TREADY in_acc 1 1 }  { S_AXIS_TLAST in_data 0 1 } } }
}
