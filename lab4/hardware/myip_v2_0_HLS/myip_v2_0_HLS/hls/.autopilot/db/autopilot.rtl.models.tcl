set SynModuleInfo {
  {SRCNAME Loop_myip_v2_0_HLS_read_inputs_proc MODELNAME Loop_myip_v2_0_HLS_read_inputs_proc RTLNAME myip_v2_0_HLS_Loop_myip_v2_0_HLS_read_inputs_proc
    SUBMODULES {
      {MODELNAME myip_v2_0_HLS_regslice_both RTLNAME myip_v2_0_HLS_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
      {MODELNAME myip_v2_0_HLS_flow_control_loop_pipe RTLNAME myip_v2_0_HLS_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME myip_v2_0_HLS_flow_control_loop_pipe_U}
    }
  }
  {SRCNAME Loop_myip_v2_0_HLS_compute_proc MODELNAME Loop_myip_v2_0_HLS_compute_proc RTLNAME myip_v2_0_HLS_Loop_myip_v2_0_HLS_compute_proc
    SUBMODULES {
      {MODELNAME myip_v2_0_HLS_mul_32s_32s_32_1_1 RTLNAME myip_v2_0_HLS_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Loop_myip_v2_0_HLS_write_outputs_proc MODELNAME Loop_myip_v2_0_HLS_write_outputs_proc RTLNAME myip_v2_0_HLS_Loop_myip_v2_0_HLS_write_outputs_proc
    SUBMODULES {
      {MODELNAME myip_v2_0_HLS_sparsemux_129_6_32_1_1 RTLNAME myip_v2_0_HLS_sparsemux_129_6_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME myip_v2_0_HLS MODELNAME myip_v2_0_HLS RTLNAME myip_v2_0_HLS IS_TOP 1
    SUBMODULES {
      {MODELNAME myip_v2_0_HLS_mat_A_RAM_AUTO_1R1W_memcore RTLNAME myip_v2_0_HLS_mat_A_RAM_AUTO_1R1W_memcore BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME myip_v2_0_HLS_mat_A_RAM_AUTO_1R1W RTLNAME myip_v2_0_HLS_mat_A_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc18_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc19_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc20_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc21_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc22_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc23_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc24_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_63_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_62_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_61_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_60_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_59_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_58_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_57_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_56_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_55_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_54_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_53_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_52_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_51_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_50_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_49_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_48_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_47_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_46_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_45_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_44_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_43_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_42_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_41_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_40_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_39_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_38_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_37_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_36_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_35_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_34_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_33_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_32_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_31_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_30_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_29_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_28_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_27_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_26_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_25_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_24_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_23_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_22_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_21_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_20_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_19_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_18_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_17_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_16_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_15_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_14_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_13_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_12_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_11_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_10_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_9_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_8_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_7_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_6_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_5_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_4_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_3_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_2_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_1_0_loc_channel_U}
      {MODELNAME myip_v2_0_HLS_fifo_w32_d2_S RTLNAME myip_v2_0_HLS_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME mat_RES_0_0_loc_channel_U}
    }
  }
}
