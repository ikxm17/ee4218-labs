#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst_n", 1, hls_in, -1, "", "", 1),
	Port_Property("S_AXIS_TDATA", 32, hls_in, 0, "axis", "in_data", 1),
	Port_Property("S_AXIS_TKEEP", 4, hls_in, 1, "axis", "in_data", 1),
	Port_Property("S_AXIS_TSTRB", 4, hls_in, 2, "axis", "in_data", 1),
	Port_Property("S_AXIS_TLAST", 1, hls_in, 3, "axis", "in_data", 1),
	Port_Property("M_AXIS_TDATA", 32, hls_out, 4, "axis", "out_data", 1),
	Port_Property("M_AXIS_TKEEP", 4, hls_out, 5, "axis", "out_data", 1),
	Port_Property("M_AXIS_TSTRB", 4, hls_out, 6, "axis", "out_data", 1),
	Port_Property("M_AXIS_TLAST", 1, hls_out, 7, "axis", "out_data", 1),
	Port_Property("S_AXIS_TVALID", 1, hls_in, 3, "axis", "in_vld", 1),
	Port_Property("S_AXIS_TREADY", 1, hls_out, 3, "axis", "in_acc", 1),
	Port_Property("M_AXIS_TVALID", 1, hls_out, 7, "axis", "out_vld", 1),
	Port_Property("M_AXIS_TREADY", 1, hls_in, 7, "axis", "out_acc", 1),
};
const char* HLS_Design_Meta::dut_name = "myip_v2_0_HLS";
