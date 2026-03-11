set ModuleHierarchy {[{
"Name" : "myip_v2_0_HLS", "RefName" : "myip_v2_0_HLS","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "Loop_myip_v2_0_HLS_read_inputs_proc_U0", "RefName" : "Loop_myip_v2_0_HLS_read_inputs_proc","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "myip_v2_0_HLS_read_inputs","RefName" : "myip_v2_0_HLS_read_inputs","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "Loop_myip_v2_0_HLS_compute_proc_U0", "RefName" : "Loop_myip_v2_0_HLS_compute_proc","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "myip_v2_0_HLS_compute","RefName" : "myip_v2_0_HLS_compute","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "Loop_myip_v2_0_HLS_write_outputs_proc_U0", "RefName" : "Loop_myip_v2_0_HLS_write_outputs_proc","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "myip_v2_0_HLS_write_outputs","RefName" : "myip_v2_0_HLS_write_outputs","ID" : "6","Type" : "pipeline"},]},]
}]}