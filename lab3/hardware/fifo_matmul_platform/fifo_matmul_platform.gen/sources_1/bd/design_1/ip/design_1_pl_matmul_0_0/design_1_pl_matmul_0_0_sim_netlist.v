// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Feb 23 16:52:17 2026
// Host        : leeeyG14 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/leeey/Downloads/ee4218-labs/lab3/hardware/fifo_matmul_platform/fifo_matmul_platform.gen/sources_1/bd/design_1/ip/design_1_pl_matmul_0_0/design_1_pl_matmul_0_0_sim_netlist.v
// Design      : design_1_pl_matmul_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_pl_matmul_0_0,myip_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "myip_v1_0,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module design_1_pl_matmul_0_0
   (ACLK,
    ARESETN,
    S_AXIS_TREADY,
    S_AXIS_TDATA,
    S_AXIS_TLAST,
    S_AXIS_TVALID,
    M_AXIS_TVALID,
    M_AXIS_TDATA,
    M_AXIS_TLAST,
    M_AXIS_TREADY);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ACLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ACLK, ASSOCIATED_RESET ARESETN, ASSOCIATED_BUSIF S_AXIS:M_AXIS, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input ACLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ARESETN RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ARESETN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *) output S_AXIS_TREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) input [31:0]S_AXIS_TDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input S_AXIS_TLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input S_AXIS_TVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *) output M_AXIS_TVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) output [31:0]M_AXIS_TDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output M_AXIS_TLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input M_AXIS_TREADY;

  wire \<const0> ;
  wire ACLK;
  wire ARESETN;
  wire [7:0]\^M_AXIS_TDATA ;
  wire M_AXIS_TLAST;
  wire M_AXIS_TREADY;
  wire M_AXIS_TVALID;
  wire [31:0]S_AXIS_TDATA;
  wire S_AXIS_TLAST;
  wire S_AXIS_TREADY;
  wire S_AXIS_TVALID;

  assign M_AXIS_TDATA[31] = \<const0> ;
  assign M_AXIS_TDATA[30] = \<const0> ;
  assign M_AXIS_TDATA[29] = \<const0> ;
  assign M_AXIS_TDATA[28] = \<const0> ;
  assign M_AXIS_TDATA[27] = \<const0> ;
  assign M_AXIS_TDATA[26] = \<const0> ;
  assign M_AXIS_TDATA[25] = \<const0> ;
  assign M_AXIS_TDATA[24] = \<const0> ;
  assign M_AXIS_TDATA[23] = \<const0> ;
  assign M_AXIS_TDATA[22] = \<const0> ;
  assign M_AXIS_TDATA[21] = \<const0> ;
  assign M_AXIS_TDATA[20] = \<const0> ;
  assign M_AXIS_TDATA[19] = \<const0> ;
  assign M_AXIS_TDATA[18] = \<const0> ;
  assign M_AXIS_TDATA[17] = \<const0> ;
  assign M_AXIS_TDATA[16] = \<const0> ;
  assign M_AXIS_TDATA[15] = \<const0> ;
  assign M_AXIS_TDATA[14] = \<const0> ;
  assign M_AXIS_TDATA[13] = \<const0> ;
  assign M_AXIS_TDATA[12] = \<const0> ;
  assign M_AXIS_TDATA[11] = \<const0> ;
  assign M_AXIS_TDATA[10] = \<const0> ;
  assign M_AXIS_TDATA[9] = \<const0> ;
  assign M_AXIS_TDATA[8] = \<const0> ;
  assign M_AXIS_TDATA[7:0] = \^M_AXIS_TDATA [7:0];
  GND GND
       (.G(\<const0> ));
  design_1_pl_matmul_0_0_myip_v1_0 inst
       (.ACLK(ACLK),
        .ARESETN(ARESETN),
        .M_AXIS_TDATA(\^M_AXIS_TDATA ),
        .M_AXIS_TLAST(M_AXIS_TLAST),
        .M_AXIS_TREADY(M_AXIS_TREADY),
        .M_AXIS_TVALID(M_AXIS_TVALID),
        .S_AXIS_TDATA(S_AXIS_TDATA[7:0]),
        .S_AXIS_TLAST(S_AXIS_TLAST),
        .S_AXIS_TREADY(S_AXIS_TREADY),
        .S_AXIS_TVALID(S_AXIS_TVALID));
endmodule

(* ORIG_REF_NAME = "matrix_multiply" *) 
module design_1_pl_matmul_0_0_matrix_multiply
   (RES_write_en,
    dia,
    \dob_reg[0] ,
    CO,
    \dob_reg[2] ,
    O,
    \dob_reg[5] ,
    \dob_reg[5]_0 ,
    ADDRARDADDR,
    D,
    ARESETN_0,
    \dob_reg[6] ,
    E,
    \read_counter_reg[4] ,
    \RES_write_address_reg[5]_0 ,
    write_counter,
    \FSM_onehot_state_reg[0]_0 ,
    M_AXIS_TREADY_0,
    ACLK,
    DI,
    S,
    mul0__60_carry_i_7,
    mul0__60_carry_i_7_0,
    mul0__60_carry_i_13_0,
    mul0__60_carry_i_13_1,
    mul0__60_carry__0_i_15,
    mul0__60_carry__0_i_15_0,
    \acc[0]_i_6_0 ,
    \acc[0]_i_6_1 ,
    \acc[8]_i_5_0 ,
    \acc[8]_i_5_1 ,
    Q,
    \FSM_onehot_state_reg[0]_1 ,
    ARESETN,
    mul0__60_carry_0,
    DOUTADOUT,
    mul0__60_carry_1,
    RAM_reg_bram_0_i_3_0,
    M_AXIS_TREADY,
    \FSM_onehot_state_reg[1]_0 ,
    mul0__60_carry_2);
  output RES_write_en;
  output [7:0]dia;
  output [0:0]\dob_reg[0] ;
  output [0:0]CO;
  output [1:0]\dob_reg[2] ;
  output [3:0]O;
  output [0:0]\dob_reg[5] ;
  output [1:0]\dob_reg[5]_0 ;
  output [8:0]ADDRARDADDR;
  output [1:0]D;
  output ARESETN_0;
  output \dob_reg[6] ;
  output [0:0]E;
  output \read_counter_reg[4] ;
  output [5:0]\RES_write_address_reg[5]_0 ;
  output [0:0]write_counter;
  output \FSM_onehot_state_reg[0]_0 ;
  output [0:0]M_AXIS_TREADY_0;
  input ACLK;
  input [6:0]DI;
  input [7:0]S;
  input [1:0]mul0__60_carry_i_7;
  input [1:0]mul0__60_carry_i_7_0;
  input [6:0]mul0__60_carry_i_13_0;
  input [7:0]mul0__60_carry_i_13_1;
  input [1:0]mul0__60_carry__0_i_15;
  input [1:0]mul0__60_carry__0_i_15_0;
  input [1:0]\acc[0]_i_6_0 ;
  input [1:0]\acc[0]_i_6_1 ;
  input [3:0]\acc[8]_i_5_0 ;
  input [4:0]\acc[8]_i_5_1 ;
  input [3:0]Q;
  input \FSM_onehot_state_reg[0]_1 ;
  input ARESETN;
  input [1:0]mul0__60_carry_0;
  input [2:0]DOUTADOUT;
  input mul0__60_carry_1;
  input [9:0]RAM_reg_bram_0_i_3_0;
  input M_AXIS_TREADY;
  input \FSM_onehot_state_reg[1]_0 ;
  input mul0__60_carry_2;

  wire ACLK;
  wire [8:0]ADDRARDADDR;
  wire ARESETN;
  wire ARESETN_0;
  wire [0:0]CO;
  wire [1:0]D;
  wire [6:0]DI;
  wire [2:0]DOUTADOUT;
  wire Done;
  wire Done_i_1_n_0;
  wire [0:0]E;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state_reg[0]_0 ;
  wire \FSM_onehot_state_reg[0]_1 ;
  wire \FSM_onehot_state_reg[1]_0 ;
  wire M_AXIS_TREADY;
  wire [0:0]M_AXIS_TREADY_0;
  wire [3:0]O;
  wire [3:0]Q;
  wire [9:0]RAM_reg_bram_0_i_3_0;
  wire RAM_reg_bram_0_i_5_n_0;
  wire RAM_reg_bram_0_i_6_n_0;
  wire RES_write_address0;
  wire \RES_write_address[5]_i_1_n_0 ;
  wire [5:0]\RES_write_address_reg[5]_0 ;
  wire RES_write_en;
  wire RES_write_en0;
  wire [7:0]S;
  wire Start__20;
  wire __10;
  wire [0:0]acc;
  wire acc0;
  wire \acc[0]_i_10_n_0 ;
  wire \acc[0]_i_11_n_0 ;
  wire \acc[0]_i_12_n_0 ;
  wire \acc[0]_i_13_n_0 ;
  wire \acc[0]_i_14_n_0 ;
  wire \acc[0]_i_15_n_0 ;
  wire \acc[0]_i_16_n_0 ;
  wire \acc[0]_i_17_n_0 ;
  wire \acc[0]_i_2_n_0 ;
  wire \acc[0]_i_3_n_0 ;
  wire \acc[0]_i_4_n_0 ;
  wire \acc[0]_i_5_n_0 ;
  wire [1:0]\acc[0]_i_6_0 ;
  wire [1:0]\acc[0]_i_6_1 ;
  wire \acc[0]_i_6_n_0 ;
  wire \acc[0]_i_7_n_0 ;
  wire \acc[0]_i_8_n_0 ;
  wire \acc[0]_i_9_n_0 ;
  wire \acc[8]_i_10_n_0 ;
  wire \acc[8]_i_11_n_0 ;
  wire \acc[8]_i_12_n_0 ;
  wire \acc[8]_i_13_n_0 ;
  wire \acc[8]_i_14_n_0 ;
  wire \acc[8]_i_15_n_0 ;
  wire \acc[8]_i_16_n_0 ;
  wire \acc[8]_i_2_n_0 ;
  wire \acc[8]_i_3_n_0 ;
  wire \acc[8]_i_4_n_0 ;
  wire [3:0]\acc[8]_i_5_0 ;
  wire [4:0]\acc[8]_i_5_1 ;
  wire \acc[8]_i_5_n_0 ;
  wire \acc[8]_i_6_n_0 ;
  wire \acc[8]_i_7_n_0 ;
  wire \acc[8]_i_8_n_0 ;
  wire \acc[8]_i_9_n_0 ;
  wire \acc_reg[0]_i_1_n_0 ;
  wire \acc_reg[0]_i_1_n_1 ;
  wire \acc_reg[0]_i_1_n_10 ;
  wire \acc_reg[0]_i_1_n_11 ;
  wire \acc_reg[0]_i_1_n_12 ;
  wire \acc_reg[0]_i_1_n_13 ;
  wire \acc_reg[0]_i_1_n_14 ;
  wire \acc_reg[0]_i_1_n_15 ;
  wire \acc_reg[0]_i_1_n_2 ;
  wire \acc_reg[0]_i_1_n_3 ;
  wire \acc_reg[0]_i_1_n_4 ;
  wire \acc_reg[0]_i_1_n_5 ;
  wire \acc_reg[0]_i_1_n_6 ;
  wire \acc_reg[0]_i_1_n_7 ;
  wire \acc_reg[0]_i_1_n_8 ;
  wire \acc_reg[0]_i_1_n_9 ;
  wire \acc_reg[8]_i_1_n_1 ;
  wire \acc_reg[8]_i_1_n_10 ;
  wire \acc_reg[8]_i_1_n_11 ;
  wire \acc_reg[8]_i_1_n_12 ;
  wire \acc_reg[8]_i_1_n_13 ;
  wire \acc_reg[8]_i_1_n_14 ;
  wire \acc_reg[8]_i_1_n_15 ;
  wire \acc_reg[8]_i_1_n_2 ;
  wire \acc_reg[8]_i_1_n_3 ;
  wire \acc_reg[8]_i_1_n_4 ;
  wire \acc_reg[8]_i_1_n_5 ;
  wire \acc_reg[8]_i_1_n_6 ;
  wire \acc_reg[8]_i_1_n_7 ;
  wire \acc_reg[8]_i_1_n_8 ;
  wire \acc_reg[8]_i_1_n_9 ;
  wire \acc_reg_n_0_[0] ;
  wire \acc_reg_n_0_[1] ;
  wire \acc_reg_n_0_[2] ;
  wire \acc_reg_n_0_[3] ;
  wire \acc_reg_n_0_[4] ;
  wire \acc_reg_n_0_[5] ;
  wire \acc_reg_n_0_[6] ;
  wire \acc_reg_n_0_[7] ;
  wire [7:0]dia;
  wire [0:0]\dob_reg[0] ;
  wire [1:0]\dob_reg[2] ;
  wire [0:0]\dob_reg[5] ;
  wire [1:0]\dob_reg[5]_0 ;
  wire \dob_reg[6] ;
  wire first_mac_cycle_i_1_n_0;
  wire first_mac_cycle_reg_n_0;
  wire last_mac_cycle28_in;
  wire last_mac_cycle_i_1_n_0;
  wire last_mac_cycle_reg_n_0;
  wire m_counter0__1;
  wire \m_counter[0]_i_1_n_0 ;
  wire \m_counter[1]_i_1_n_0 ;
  wire \m_counter[2]_i_1_n_0 ;
  wire \m_counter[3]_i_1_n_0 ;
  wire \m_counter[4]_i_1_n_0 ;
  wire \m_counter[5]_i_1_n_0 ;
  wire \m_counter[5]_i_2_n_0 ;
  wire \m_counter[5]_i_3_n_0 ;
  wire \m_counter[5]_i_4_n_0 ;
  wire [15:0]mul0;
  wire mul0__0_carry__0_n_7;
  wire mul0__0_carry_n_0;
  wire mul0__0_carry_n_1;
  wire mul0__0_carry_n_10;
  wire mul0__0_carry_n_11;
  wire mul0__0_carry_n_12;
  wire mul0__0_carry_n_2;
  wire mul0__0_carry_n_3;
  wire mul0__0_carry_n_4;
  wire mul0__0_carry_n_5;
  wire mul0__0_carry_n_6;
  wire mul0__0_carry_n_7;
  wire mul0__0_carry_n_8;
  wire mul0__30_carry__0_n_7;
  wire mul0__30_carry_n_0;
  wire mul0__30_carry_n_1;
  wire mul0__30_carry_n_11;
  wire mul0__30_carry_n_13;
  wire mul0__30_carry_n_14;
  wire mul0__30_carry_n_15;
  wire mul0__30_carry_n_2;
  wire mul0__30_carry_n_3;
  wire mul0__30_carry_n_4;
  wire mul0__30_carry_n_5;
  wire mul0__30_carry_n_6;
  wire mul0__30_carry_n_7;
  wire [1:0]mul0__60_carry_0;
  wire mul0__60_carry_1;
  wire mul0__60_carry_2;
  wire [1:0]mul0__60_carry__0_i_15;
  wire [1:0]mul0__60_carry__0_i_15_0;
  wire mul0__60_carry__0_n_4;
  wire mul0__60_carry__0_n_5;
  wire mul0__60_carry__0_n_6;
  wire mul0__60_carry__0_n_7;
  wire mul0__60_carry_i_10_n_0;
  wire mul0__60_carry_i_11_n_0;
  wire mul0__60_carry_i_12_n_0;
  wire [6:0]mul0__60_carry_i_13_0;
  wire [7:0]mul0__60_carry_i_13_1;
  wire mul0__60_carry_i_13_n_0;
  wire mul0__60_carry_i_2_n_0;
  wire mul0__60_carry_i_4_n_0;
  wire mul0__60_carry_i_5_n_0;
  wire [1:0]mul0__60_carry_i_7;
  wire [1:0]mul0__60_carry_i_7_0;
  wire mul0__60_carry_i_8_n_0;
  wire mul0__60_carry_i_9_n_0;
  wire mul0__60_carry_n_0;
  wire mul0__60_carry_n_1;
  wire mul0__60_carry_n_2;
  wire mul0__60_carry_n_3;
  wire mul0__60_carry_n_4;
  wire mul0__60_carry_n_5;
  wire mul0__60_carry_n_6;
  wire mul0__60_carry_n_7;
  wire \n_counter[0]_i_1_n_0 ;
  wire \n_counter[1]_i_1_n_0 ;
  wire \n_counter[2]_i_2_n_0 ;
  wire [5:0]p_0_in;
  wire \read_counter_reg[4] ;
  wire [0:0]write_counter;
  wire [7:7]\NLW_acc_reg[8]_i_1_CO_UNCONNECTED ;
  wire [7:2]NLW_mul0__0_carry__0_CO_UNCONNECTED;
  wire [7:2]NLW_mul0__0_carry__0_O_UNCONNECTED;
  wire [7:2]NLW_mul0__30_carry__0_CO_UNCONNECTED;
  wire [7:2]NLW_mul0__30_carry__0_O_UNCONNECTED;
  wire [7:4]NLW_mul0__60_carry__0_CO_UNCONNECTED;
  wire [7:5]NLW_mul0__60_carry__0_O_UNCONNECTED;

  LUT5 #(
    .INIT(32'hD5FFC000)) 
    Done_i_1
       (.I0(acc0),
        .I1(acc),
        .I2(last_mac_cycle_reg_n_0),
        .I3(ARESETN),
        .I4(Done),
        .O(Done_i_1_n_0));
  FDRE Done_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(Done_i_1_n_0),
        .Q(Done),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(Q[0]),
        .I1(\FSM_onehot_state_reg[0]_1 ),
        .I2(Done),
        .I3(Q[1]),
        .O(D[0]));
  LUT4 #(
    .INIT(16'hF888)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(acc),
        .I1(last_mac_cycle_reg_n_0),
        .I2(acc0),
        .I3(Start__20),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_state[1]_i_1__0 
       (.I0(\FSM_onehot_state_reg[1]_0 ),
        .I1(Q[2]),
        .I2(Done),
        .I3(Q[1]),
        .O(D[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(ARESETN),
        .O(ARESETN_0));
  (* FSM_ENCODED_STATES = "Idle:01,MAC:10," *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(ACLK),
        .CE(\FSM_onehot_state[1]_i_1_n_0 ),
        .D(acc),
        .Q(acc0),
        .S(ARESETN_0));
  (* FSM_ENCODED_STATES = "Idle:01,MAC:10," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(ACLK),
        .CE(\FSM_onehot_state[1]_i_1_n_0 ),
        .D(acc0),
        .Q(acc),
        .R(ARESETN_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    M_AXIS_TVALID_i_1
       (.I0(Q[0]),
        .I1(Done),
        .I2(Q[1]),
        .O(\FSM_onehot_state_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    RAM_reg_bram_0_i_1
       (.I0(Start__20),
        .I1(acc0),
        .I2(acc),
        .O(E));
  LUT6 #(
    .INIT(64'h0000004000000000)) 
    RAM_reg_bram_0_i_3
       (.I0(RAM_reg_bram_0_i_3_0[6]),
        .I1(RAM_reg_bram_0_i_5_n_0),
        .I2(RAM_reg_bram_0_i_6_n_0),
        .I3(RAM_reg_bram_0_i_3_0[8]),
        .I4(RAM_reg_bram_0_i_3_0[7]),
        .I5(\read_counter_reg[4] ),
        .O(Start__20));
  LUT6 #(
    .INIT(64'h2300000000000000)) 
    RAM_reg_bram_0_i_5
       (.I0(RAM_reg_bram_0_i_3_0[4]),
        .I1(RAM_reg_bram_0_i_3_0[5]),
        .I2(RAM_reg_bram_0_i_3_0[3]),
        .I3(RAM_reg_bram_0_i_3_0[0]),
        .I4(RAM_reg_bram_0_i_3_0[1]),
        .I5(RAM_reg_bram_0_i_3_0[2]),
        .O(RAM_reg_bram_0_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    RAM_reg_bram_0_i_6
       (.I0(RAM_reg_bram_0_i_3_0[9]),
        .I1(Q[2]),
        .O(RAM_reg_bram_0_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    RAM_reg_bram_0_i_7
       (.I0(RAM_reg_bram_0_i_3_0[4]),
        .I1(RAM_reg_bram_0_i_3_0[5]),
        .O(\read_counter_reg[4] ));
  LUT1 #(
    .INIT(2'h1)) 
    \RES_write_address[0]_i_1 
       (.I0(\RES_write_address_reg[5]_0 [0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \RES_write_address[1]_i_1 
       (.I0(\RES_write_address_reg[5]_0 [0]),
        .I1(\RES_write_address_reg[5]_0 [1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \RES_write_address[2]_i_1 
       (.I0(\RES_write_address_reg[5]_0 [0]),
        .I1(\RES_write_address_reg[5]_0 [1]),
        .I2(\RES_write_address_reg[5]_0 [2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \RES_write_address[3]_i_1 
       (.I0(\RES_write_address_reg[5]_0 [1]),
        .I1(\RES_write_address_reg[5]_0 [0]),
        .I2(\RES_write_address_reg[5]_0 [2]),
        .I3(\RES_write_address_reg[5]_0 [3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \RES_write_address[4]_i_1 
       (.I0(\RES_write_address_reg[5]_0 [2]),
        .I1(\RES_write_address_reg[5]_0 [0]),
        .I2(\RES_write_address_reg[5]_0 [1]),
        .I3(\RES_write_address_reg[5]_0 [3]),
        .I4(\RES_write_address_reg[5]_0 [4]),
        .O(p_0_in[4]));
  LUT3 #(
    .INIT(8'h2A)) 
    \RES_write_address[5]_i_1 
       (.I0(acc0),
        .I1(RES_write_en),
        .I2(acc),
        .O(\RES_write_address[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \RES_write_address[5]_i_2 
       (.I0(acc),
        .I1(RES_write_en),
        .O(RES_write_address0));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \RES_write_address[5]_i_3 
       (.I0(\RES_write_address_reg[5]_0 [3]),
        .I1(\RES_write_address_reg[5]_0 [1]),
        .I2(\RES_write_address_reg[5]_0 [0]),
        .I3(\RES_write_address_reg[5]_0 [2]),
        .I4(\RES_write_address_reg[5]_0 [4]),
        .I5(\RES_write_address_reg[5]_0 [5]),
        .O(p_0_in[5]));
  FDRE \RES_write_address_reg[0] 
       (.C(ACLK),
        .CE(RES_write_address0),
        .D(p_0_in[0]),
        .Q(\RES_write_address_reg[5]_0 [0]),
        .R(\RES_write_address[5]_i_1_n_0 ));
  FDRE \RES_write_address_reg[1] 
       (.C(ACLK),
        .CE(RES_write_address0),
        .D(p_0_in[1]),
        .Q(\RES_write_address_reg[5]_0 [1]),
        .R(\RES_write_address[5]_i_1_n_0 ));
  FDRE \RES_write_address_reg[2] 
       (.C(ACLK),
        .CE(RES_write_address0),
        .D(p_0_in[2]),
        .Q(\RES_write_address_reg[5]_0 [2]),
        .R(\RES_write_address[5]_i_1_n_0 ));
  FDRE \RES_write_address_reg[3] 
       (.C(ACLK),
        .CE(RES_write_address0),
        .D(p_0_in[3]),
        .Q(\RES_write_address_reg[5]_0 [3]),
        .R(\RES_write_address[5]_i_1_n_0 ));
  FDRE \RES_write_address_reg[4] 
       (.C(ACLK),
        .CE(RES_write_address0),
        .D(p_0_in[4]),
        .Q(\RES_write_address_reg[5]_0 [4]),
        .R(\RES_write_address[5]_i_1_n_0 ));
  FDRE \RES_write_address_reg[5] 
       (.C(ACLK),
        .CE(RES_write_address0),
        .D(p_0_in[5]),
        .Q(\RES_write_address_reg[5]_0 [5]),
        .R(\RES_write_address[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    RES_write_en_i_1
       (.I0(first_mac_cycle_reg_n_0),
        .I1(ADDRARDADDR[0]),
        .I2(ADDRARDADDR[1]),
        .I3(ADDRARDADDR[2]),
        .I4(acc),
        .O(RES_write_en0));
  FDRE RES_write_en_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(RES_write_en0),
        .Q(RES_write_en),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[0]_i_10 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[7]),
        .I3(RES_write_en),
        .I4(\acc_reg_n_0_[7] ),
        .O(\acc[0]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[0]_i_11 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[6]),
        .I3(RES_write_en),
        .I4(\acc_reg_n_0_[6] ),
        .O(\acc[0]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[0]_i_12 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[5]),
        .I3(RES_write_en),
        .I4(\acc_reg_n_0_[5] ),
        .O(\acc[0]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[0]_i_13 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[4]),
        .I3(RES_write_en),
        .I4(\acc_reg_n_0_[4] ),
        .O(\acc[0]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[0]_i_14 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[3]),
        .I3(RES_write_en),
        .I4(\acc_reg_n_0_[3] ),
        .O(\acc[0]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[0]_i_15 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[2]),
        .I3(RES_write_en),
        .I4(\acc_reg_n_0_[2] ),
        .O(\acc[0]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[0]_i_16 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[1]),
        .I3(RES_write_en),
        .I4(\acc_reg_n_0_[1] ),
        .O(\acc[0]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[0]_i_17 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[0]),
        .I3(RES_write_en),
        .I4(\acc_reg_n_0_[0] ),
        .O(\acc[0]_i_17_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[0]_i_2 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[7]),
        .O(\acc[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[0]_i_3 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[6]),
        .O(\acc[0]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[0]_i_4 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[5]),
        .O(\acc[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[0]_i_5 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[4]),
        .O(\acc[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[0]_i_6 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[3]),
        .O(\acc[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[0]_i_7 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[2]),
        .O(\acc[0]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[0]_i_8 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[1]),
        .O(\acc[0]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[0]_i_9 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[0]),
        .O(\acc[0]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[8]_i_10 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[14]),
        .I3(RES_write_en),
        .I4(dia[6]),
        .O(\acc[8]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[8]_i_11 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[13]),
        .I3(RES_write_en),
        .I4(dia[5]),
        .O(\acc[8]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[8]_i_12 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[12]),
        .I3(RES_write_en),
        .I4(dia[4]),
        .O(\acc[8]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[8]_i_13 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[11]),
        .I3(RES_write_en),
        .I4(dia[3]),
        .O(\acc[8]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[8]_i_14 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[10]),
        .I3(RES_write_en),
        .I4(dia[2]),
        .O(\acc[8]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[8]_i_15 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[9]),
        .I3(RES_write_en),
        .I4(dia[1]),
        .O(\acc[8]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[8]_i_16 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[8]),
        .I3(RES_write_en),
        .I4(dia[0]),
        .O(\acc[8]_i_16_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[8]_i_2 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[14]),
        .O(\acc[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[8]_i_3 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[13]),
        .O(\acc[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[8]_i_4 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[12]),
        .O(\acc[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[8]_i_5 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[11]),
        .O(\acc[8]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[8]_i_6 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[10]),
        .O(\acc[8]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[8]_i_7 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[9]),
        .O(\acc[8]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \acc[8]_i_8 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[8]),
        .O(\acc[8]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h20DF2020)) 
    \acc[8]_i_9 
       (.I0(acc),
        .I1(Start__20),
        .I2(mul0[15]),
        .I3(RES_write_en),
        .I4(dia[7]),
        .O(\acc[8]_i_9_n_0 ));
  FDRE \acc_reg[0] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[0]_i_1_n_15 ),
        .Q(\acc_reg_n_0_[0] ),
        .R(acc0));
  CARRY8 \acc_reg[0]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\acc_reg[0]_i_1_n_0 ,\acc_reg[0]_i_1_n_1 ,\acc_reg[0]_i_1_n_2 ,\acc_reg[0]_i_1_n_3 ,\acc_reg[0]_i_1_n_4 ,\acc_reg[0]_i_1_n_5 ,\acc_reg[0]_i_1_n_6 ,\acc_reg[0]_i_1_n_7 }),
        .DI({\acc[0]_i_2_n_0 ,\acc[0]_i_3_n_0 ,\acc[0]_i_4_n_0 ,\acc[0]_i_5_n_0 ,\acc[0]_i_6_n_0 ,\acc[0]_i_7_n_0 ,\acc[0]_i_8_n_0 ,\acc[0]_i_9_n_0 }),
        .O({\acc_reg[0]_i_1_n_8 ,\acc_reg[0]_i_1_n_9 ,\acc_reg[0]_i_1_n_10 ,\acc_reg[0]_i_1_n_11 ,\acc_reg[0]_i_1_n_12 ,\acc_reg[0]_i_1_n_13 ,\acc_reg[0]_i_1_n_14 ,\acc_reg[0]_i_1_n_15 }),
        .S({\acc[0]_i_10_n_0 ,\acc[0]_i_11_n_0 ,\acc[0]_i_12_n_0 ,\acc[0]_i_13_n_0 ,\acc[0]_i_14_n_0 ,\acc[0]_i_15_n_0 ,\acc[0]_i_16_n_0 ,\acc[0]_i_17_n_0 }));
  FDRE \acc_reg[10] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[8]_i_1_n_13 ),
        .Q(dia[2]),
        .R(acc0));
  FDRE \acc_reg[11] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[8]_i_1_n_12 ),
        .Q(dia[3]),
        .R(acc0));
  FDRE \acc_reg[12] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[8]_i_1_n_11 ),
        .Q(dia[4]),
        .R(acc0));
  FDRE \acc_reg[13] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[8]_i_1_n_10 ),
        .Q(dia[5]),
        .R(acc0));
  FDRE \acc_reg[14] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[8]_i_1_n_9 ),
        .Q(dia[6]),
        .R(acc0));
  FDRE \acc_reg[15] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[8]_i_1_n_8 ),
        .Q(dia[7]),
        .R(acc0));
  FDRE \acc_reg[1] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[0]_i_1_n_14 ),
        .Q(\acc_reg_n_0_[1] ),
        .R(acc0));
  FDRE \acc_reg[2] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[0]_i_1_n_13 ),
        .Q(\acc_reg_n_0_[2] ),
        .R(acc0));
  FDRE \acc_reg[3] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[0]_i_1_n_12 ),
        .Q(\acc_reg_n_0_[3] ),
        .R(acc0));
  FDRE \acc_reg[4] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[0]_i_1_n_11 ),
        .Q(\acc_reg_n_0_[4] ),
        .R(acc0));
  FDRE \acc_reg[5] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[0]_i_1_n_10 ),
        .Q(\acc_reg_n_0_[5] ),
        .R(acc0));
  FDRE \acc_reg[6] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[0]_i_1_n_9 ),
        .Q(\acc_reg_n_0_[6] ),
        .R(acc0));
  FDRE \acc_reg[7] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[0]_i_1_n_8 ),
        .Q(\acc_reg_n_0_[7] ),
        .R(acc0));
  FDRE \acc_reg[8] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[8]_i_1_n_15 ),
        .Q(dia[0]),
        .R(acc0));
  CARRY8 \acc_reg[8]_i_1 
       (.CI(\acc_reg[0]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_acc_reg[8]_i_1_CO_UNCONNECTED [7],\acc_reg[8]_i_1_n_1 ,\acc_reg[8]_i_1_n_2 ,\acc_reg[8]_i_1_n_3 ,\acc_reg[8]_i_1_n_4 ,\acc_reg[8]_i_1_n_5 ,\acc_reg[8]_i_1_n_6 ,\acc_reg[8]_i_1_n_7 }),
        .DI({1'b0,\acc[8]_i_2_n_0 ,\acc[8]_i_3_n_0 ,\acc[8]_i_4_n_0 ,\acc[8]_i_5_n_0 ,\acc[8]_i_6_n_0 ,\acc[8]_i_7_n_0 ,\acc[8]_i_8_n_0 }),
        .O({\acc_reg[8]_i_1_n_8 ,\acc_reg[8]_i_1_n_9 ,\acc_reg[8]_i_1_n_10 ,\acc_reg[8]_i_1_n_11 ,\acc_reg[8]_i_1_n_12 ,\acc_reg[8]_i_1_n_13 ,\acc_reg[8]_i_1_n_14 ,\acc_reg[8]_i_1_n_15 }),
        .S({\acc[8]_i_9_n_0 ,\acc[8]_i_10_n_0 ,\acc[8]_i_11_n_0 ,\acc[8]_i_12_n_0 ,\acc[8]_i_13_n_0 ,\acc[8]_i_14_n_0 ,\acc[8]_i_15_n_0 ,\acc[8]_i_16_n_0 }));
  FDRE \acc_reg[9] 
       (.C(ACLK),
        .CE(acc),
        .D(\acc_reg[8]_i_1_n_14 ),
        .Q(dia[1]),
        .R(acc0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \dob[7]_i_1 
       (.I0(M_AXIS_TREADY),
        .I1(Q[0]),
        .I2(Done),
        .I3(Q[1]),
        .O(M_AXIS_TREADY_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'hAA0CCCCC)) 
    first_mac_cycle_i_1
       (.I0(Start__20),
        .I1(first_mac_cycle_reg_n_0),
        .I2(acc),
        .I3(acc0),
        .I4(ARESETN),
        .O(first_mac_cycle_i_1_n_0));
  FDRE first_mac_cycle_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(first_mac_cycle_i_1_n_0),
        .Q(first_mac_cycle_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h46020202AAAAAAAA)) 
    last_mac_cycle_i_1
       (.I0(last_mac_cycle_reg_n_0),
        .I1(acc),
        .I2(acc0),
        .I3(m_counter0__1),
        .I4(last_mac_cycle28_in),
        .I5(ARESETN),
        .O(last_mac_cycle_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h80)) 
    last_mac_cycle_i_2
       (.I0(ADDRARDADDR[2]),
        .I1(ADDRARDADDR[1]),
        .I2(ADDRARDADDR[0]),
        .O(m_counter0__1));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    last_mac_cycle_i_3
       (.I0(ADDRARDADDR[5]),
        .I1(ADDRARDADDR[6]),
        .I2(ADDRARDADDR[3]),
        .I3(ADDRARDADDR[4]),
        .I4(ADDRARDADDR[8]),
        .I5(ADDRARDADDR[7]),
        .O(last_mac_cycle28_in));
  FDRE last_mac_cycle_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(last_mac_cycle_i_1_n_0),
        .Q(last_mac_cycle_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \m_counter[0]_i_1 
       (.I0(\m_counter[5]_i_4_n_0 ),
        .I1(ADDRARDADDR[3]),
        .O(\m_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \m_counter[1]_i_1 
       (.I0(\m_counter[5]_i_4_n_0 ),
        .I1(ADDRARDADDR[3]),
        .I2(ADDRARDADDR[4]),
        .O(\m_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \m_counter[2]_i_1 
       (.I0(\m_counter[5]_i_4_n_0 ),
        .I1(ADDRARDADDR[3]),
        .I2(ADDRARDADDR[4]),
        .I3(ADDRARDADDR[5]),
        .O(\m_counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \m_counter[3]_i_1 
       (.I0(\m_counter[5]_i_4_n_0 ),
        .I1(ADDRARDADDR[4]),
        .I2(ADDRARDADDR[3]),
        .I3(ADDRARDADDR[5]),
        .I4(ADDRARDADDR[6]),
        .O(\m_counter[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \m_counter[4]_i_1 
       (.I0(ADDRARDADDR[6]),
        .I1(ADDRARDADDR[4]),
        .I2(ADDRARDADDR[3]),
        .I3(ADDRARDADDR[5]),
        .I4(\m_counter[5]_i_4_n_0 ),
        .I5(ADDRARDADDR[7]),
        .O(\m_counter[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    \m_counter[5]_i_1 
       (.I0(ADDRARDADDR[2]),
        .I1(ADDRARDADDR[1]),
        .I2(ADDRARDADDR[0]),
        .I3(acc),
        .I4(acc0),
        .O(\m_counter[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \m_counter[5]_i_2 
       (.I0(ADDRARDADDR[7]),
        .I1(\m_counter[5]_i_3_n_0 ),
        .I2(\m_counter[5]_i_4_n_0 ),
        .I3(ADDRARDADDR[8]),
        .O(\m_counter[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \m_counter[5]_i_3 
       (.I0(ADDRARDADDR[6]),
        .I1(ADDRARDADDR[4]),
        .I2(ADDRARDADDR[3]),
        .I3(ADDRARDADDR[5]),
        .O(\m_counter[5]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \m_counter[5]_i_4 
       (.I0(acc),
        .I1(last_mac_cycle28_in),
        .O(\m_counter[5]_i_4_n_0 ));
  FDRE \m_counter_reg[0] 
       (.C(ACLK),
        .CE(\m_counter[5]_i_1_n_0 ),
        .D(\m_counter[0]_i_1_n_0 ),
        .Q(ADDRARDADDR[3]),
        .R(1'b0));
  FDRE \m_counter_reg[1] 
       (.C(ACLK),
        .CE(\m_counter[5]_i_1_n_0 ),
        .D(\m_counter[1]_i_1_n_0 ),
        .Q(ADDRARDADDR[4]),
        .R(1'b0));
  FDRE \m_counter_reg[2] 
       (.C(ACLK),
        .CE(\m_counter[5]_i_1_n_0 ),
        .D(\m_counter[2]_i_1_n_0 ),
        .Q(ADDRARDADDR[5]),
        .R(1'b0));
  FDRE \m_counter_reg[3] 
       (.C(ACLK),
        .CE(\m_counter[5]_i_1_n_0 ),
        .D(\m_counter[3]_i_1_n_0 ),
        .Q(ADDRARDADDR[6]),
        .R(1'b0));
  FDRE \m_counter_reg[4] 
       (.C(ACLK),
        .CE(\m_counter[5]_i_1_n_0 ),
        .D(\m_counter[4]_i_1_n_0 ),
        .Q(ADDRARDADDR[7]),
        .R(1'b0));
  FDRE \m_counter_reg[5] 
       (.C(ACLK),
        .CE(\m_counter[5]_i_1_n_0 ),
        .D(\m_counter[5]_i_2_n_0 ),
        .Q(ADDRARDADDR[8]),
        .R(1'b0));
  CARRY8 mul0__0_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({mul0__0_carry_n_0,mul0__0_carry_n_1,mul0__0_carry_n_2,mul0__0_carry_n_3,mul0__0_carry_n_4,mul0__0_carry_n_5,mul0__0_carry_n_6,mul0__0_carry_n_7}),
        .DI({DI,1'b0}),
        .O({mul0__0_carry_n_8,\dob_reg[0] ,mul0__0_carry_n_10,mul0__0_carry_n_11,mul0__0_carry_n_12,mul0[2:0]}),
        .S(S));
  CARRY8 mul0__0_carry__0
       (.CI(mul0__0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_mul0__0_carry__0_CO_UNCONNECTED[7:2],CO,mul0__0_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,mul0__60_carry_i_7}),
        .O({NLW_mul0__0_carry__0_O_UNCONNECTED[7:2],\dob_reg[2] }),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,mul0__60_carry_i_7_0}));
  CARRY8 mul0__30_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({mul0__30_carry_n_0,mul0__30_carry_n_1,mul0__30_carry_n_2,mul0__30_carry_n_3,mul0__30_carry_n_4,mul0__30_carry_n_5,mul0__30_carry_n_6,mul0__30_carry_n_7}),
        .DI({mul0__60_carry_i_13_0,1'b0}),
        .O({O[3:1],mul0__30_carry_n_11,O[0],mul0__30_carry_n_13,mul0__30_carry_n_14,mul0__30_carry_n_15}),
        .S(mul0__60_carry_i_13_1));
  CARRY8 mul0__30_carry__0
       (.CI(mul0__30_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_mul0__30_carry__0_CO_UNCONNECTED[7:2],\dob_reg[5] ,mul0__30_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,mul0__60_carry__0_i_15}),
        .O({NLW_mul0__30_carry__0_O_UNCONNECTED[7:2],\dob_reg[5]_0 }),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,mul0__60_carry__0_i_15_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 mul0__60_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({mul0__60_carry_n_0,mul0__60_carry_n_1,mul0__60_carry_n_2,mul0__60_carry_n_3,mul0__60_carry_n_4,mul0__60_carry_n_5,mul0__60_carry_n_6,mul0__60_carry_n_7}),
        .DI({\acc[0]_i_6_0 [1],mul0__60_carry_i_2_n_0,\acc[0]_i_6_0 [0],mul0__60_carry_i_4_n_0,mul0__60_carry_i_5_n_0,mul0__0_carry_n_10,mul0__0_carry_n_11,mul0__0_carry_n_12}),
        .O(mul0[10:3]),
        .S({\acc[0]_i_6_1 ,mul0__60_carry_i_8_n_0,mul0__60_carry_i_9_n_0,mul0__60_carry_i_10_n_0,mul0__60_carry_i_11_n_0,mul0__60_carry_i_12_n_0,mul0__60_carry_i_13_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 mul0__60_carry__0
       (.CI(mul0__60_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_mul0__60_carry__0_CO_UNCONNECTED[7:4],mul0__60_carry__0_n_4,mul0__60_carry__0_n_5,mul0__60_carry__0_n_6,mul0__60_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,\acc[8]_i_5_0 }),
        .O({NLW_mul0__60_carry__0_O_UNCONNECTED[7:5],mul0[15:11]}),
        .S({1'b0,1'b0,1'b0,\acc[8]_i_5_1 }));
  LUT4 #(
    .INIT(16'h9666)) 
    mul0__60_carry_i_10
       (.I0(O[0]),
        .I1(\dob_reg[0] ),
        .I2(mul0__60_carry_0[0]),
        .I3(DOUTADOUT[0]),
        .O(mul0__60_carry_i_10_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    mul0__60_carry_i_11
       (.I0(mul0__0_carry_n_10),
        .I1(mul0__30_carry_n_13),
        .O(mul0__60_carry_i_11_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    mul0__60_carry_i_12
       (.I0(mul0__0_carry_n_11),
        .I1(mul0__30_carry_n_14),
        .O(mul0__60_carry_i_12_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    mul0__60_carry_i_13
       (.I0(mul0__0_carry_n_12),
        .I1(mul0__30_carry_n_15),
        .O(mul0__60_carry_i_13_n_0));
  LUT6 #(
    .INIT(64'hF0F0800080000000)) 
    mul0__60_carry_i_2
       (.I0(\dob_reg[0] ),
        .I1(O[0]),
        .I2(mul0__60_carry_0[0]),
        .I3(DOUTADOUT[1]),
        .I4(mul0__60_carry_1),
        .I5(DOUTADOUT[2]),
        .O(mul0__60_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h8000)) 
    mul0__60_carry_i_22
       (.I0(\dob_reg[0] ),
        .I1(O[0]),
        .I2(mul0__60_carry_0[0]),
        .I3(DOUTADOUT[1]),
        .O(\dob_reg[6] ));
  LUT4 #(
    .INIT(16'h8778)) 
    mul0__60_carry_i_4
       (.I0(mul0__60_carry_0[1]),
        .I1(DOUTADOUT[0]),
        .I2(mul0__30_carry_n_11),
        .I3(mul0__0_carry_n_8),
        .O(mul0__60_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    mul0__60_carry_i_5
       (.I0(\dob_reg[0] ),
        .I1(O[0]),
        .O(mul0__60_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h6669699969996999)) 
    mul0__60_carry_i_8
       (.I0(mul0__60_carry_2),
        .I1(\dob_reg[6] ),
        .I2(mul0__0_carry_n_8),
        .I3(mul0__30_carry_n_11),
        .I4(DOUTADOUT[0]),
        .I5(mul0__60_carry_0[1]),
        .O(mul0__60_carry_i_8_n_0));
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    mul0__60_carry_i_9
       (.I0(mul0__60_carry_i_4_n_0),
        .I1(DOUTADOUT[1]),
        .I2(mul0__60_carry_0[0]),
        .I3(O[0]),
        .I4(\dob_reg[0] ),
        .O(mul0__60_carry_i_9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0F08)) 
    \n_counter[0]_i_1 
       (.I0(acc0),
        .I1(Start__20),
        .I2(ADDRARDADDR[0]),
        .I3(acc),
        .O(\n_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h0FF00880)) 
    \n_counter[1]_i_1 
       (.I0(acc0),
        .I1(Start__20),
        .I2(ADDRARDADDR[1]),
        .I3(ADDRARDADDR[0]),
        .I4(acc),
        .O(\n_counter[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \n_counter[2]_i_1 
       (.I0(acc0),
        .I1(acc),
        .O(__10));
  LUT6 #(
    .INIT(64'h0FF0F0F008808080)) 
    \n_counter[2]_i_2 
       (.I0(acc0),
        .I1(Start__20),
        .I2(ADDRARDADDR[2]),
        .I3(ADDRARDADDR[1]),
        .I4(ADDRARDADDR[0]),
        .I5(acc),
        .O(\n_counter[2]_i_2_n_0 ));
  FDRE \n_counter_reg[0] 
       (.C(ACLK),
        .CE(__10),
        .D(\n_counter[0]_i_1_n_0 ),
        .Q(ADDRARDADDR[0]),
        .R(1'b0));
  FDRE \n_counter_reg[1] 
       (.C(ACLK),
        .CE(__10),
        .D(\n_counter[1]_i_1_n_0 ),
        .Q(ADDRARDADDR[1]),
        .R(1'b0));
  FDRE \n_counter_reg[2] 
       (.C(ACLK),
        .CE(__10),
        .D(\n_counter[2]_i_2_n_0 ),
        .Q(ADDRARDADDR[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'hFAEAEAEA)) 
    \write_counter[0]_i_1 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(M_AXIS_TREADY),
        .I3(Q[1]),
        .I4(Done),
        .O(write_counter));
endmodule

(* ORIG_REF_NAME = "memory_RAM" *) 
module design_1_pl_matmul_0_0_memory_RAM
   (DOUTADOUT,
    RAM_reg_bram_0_0,
    RAM_reg_bram_0_1,
    RAM_reg_bram_0_2,
    RAM_reg_bram_0_3,
    S,
    DI,
    RAM_reg_bram_0_4,
    RAM_reg_bram_0_5,
    RAM_reg_bram_0_6,
    RAM_reg_bram_0_7,
    RAM_reg_bram_0_8,
    RAM_reg_bram_0_9,
    RAM_reg_bram_0_10,
    RAM_reg_bram_0_11,
    RAM_reg_bram_0_12,
    RAM_reg_bram_0_13,
    RAM_reg_bram_0_14,
    RAM_reg_bram_0_15,
    RAM_reg_bram_0_16,
    RAM_reg_bram_0_17,
    RAM_reg_bram_0_18,
    RAM_reg_bram_0_19,
    RAM_reg_bram_0_20,
    RAM_reg_bram_0_21,
    ACLK,
    E,
    ADDRARDADDR,
    Q,
    S_AXIS_TDATA,
    S_AXIS_TREADY,
    S_AXIS_TVALID,
    A_write_en13_out,
    B,
    O,
    mul0__60_carry,
    mul0__60_carry_0,
    CO,
    mul0__60_carry_1,
    mul0__60_carry_2,
    mul0__60_carry_3);
  output [7:0]DOUTADOUT;
  output RAM_reg_bram_0_0;
  output RAM_reg_bram_0_1;
  output RAM_reg_bram_0_2;
  output RAM_reg_bram_0_3;
  output [2:0]S;
  output [0:0]DI;
  output RAM_reg_bram_0_4;
  output RAM_reg_bram_0_5;
  output RAM_reg_bram_0_6;
  output RAM_reg_bram_0_7;
  output [2:0]RAM_reg_bram_0_8;
  output [0:0]RAM_reg_bram_0_9;
  output [0:0]RAM_reg_bram_0_10;
  output RAM_reg_bram_0_11;
  output RAM_reg_bram_0_12;
  output RAM_reg_bram_0_13;
  output RAM_reg_bram_0_14;
  output RAM_reg_bram_0_15;
  output RAM_reg_bram_0_16;
  output RAM_reg_bram_0_17;
  output [0:0]RAM_reg_bram_0_18;
  output [0:0]RAM_reg_bram_0_19;
  output [0:0]RAM_reg_bram_0_20;
  output [0:0]RAM_reg_bram_0_21;
  input ACLK;
  input [0:0]E;
  input [8:0]ADDRARDADDR;
  input [9:0]Q;
  input [7:0]S_AXIS_TDATA;
  input S_AXIS_TREADY;
  input S_AXIS_TVALID;
  input A_write_en13_out;
  input [7:0]B;
  input [1:0]O;
  input [0:0]mul0__60_carry;
  input mul0__60_carry_0;
  input [0:0]CO;
  input mul0__60_carry_1;
  input mul0__60_carry_2;
  input [0:0]mul0__60_carry_3;

  wire ACLK;
  wire [8:0]ADDRARDADDR;
  wire A_write_en;
  wire A_write_en13_out;
  wire [7:0]B;
  wire [0:0]CO;
  wire [0:0]DI;
  wire [7:0]DOUTADOUT;
  wire [0:0]E;
  wire [1:0]O;
  wire [9:0]Q;
  wire RAM_reg_bram_0_0;
  wire RAM_reg_bram_0_1;
  wire [0:0]RAM_reg_bram_0_10;
  wire RAM_reg_bram_0_11;
  wire RAM_reg_bram_0_12;
  wire RAM_reg_bram_0_13;
  wire RAM_reg_bram_0_14;
  wire RAM_reg_bram_0_15;
  wire RAM_reg_bram_0_16;
  wire RAM_reg_bram_0_17;
  wire [0:0]RAM_reg_bram_0_18;
  wire [0:0]RAM_reg_bram_0_19;
  wire RAM_reg_bram_0_2;
  wire [0:0]RAM_reg_bram_0_20;
  wire [0:0]RAM_reg_bram_0_21;
  wire RAM_reg_bram_0_3;
  wire RAM_reg_bram_0_4;
  wire RAM_reg_bram_0_5;
  wire RAM_reg_bram_0_6;
  wire RAM_reg_bram_0_7;
  wire [2:0]RAM_reg_bram_0_8;
  wire [0:0]RAM_reg_bram_0_9;
  wire [2:0]S;
  wire [7:0]S_AXIS_TDATA;
  wire S_AXIS_TREADY;
  wire S_AXIS_TVALID;
  wire mul0__0_carry_i_20_n_0;
  wire mul0__30_carry_i_20_n_0;
  wire [0:0]mul0__60_carry;
  wire mul0__60_carry_0;
  wire mul0__60_carry_1;
  wire mul0__60_carry_2;
  wire [0:0]mul0__60_carry_3;
  wire mul0__60_carry_i_21_n_0;
  wire [15:0]NLW_RAM_reg_bram_0_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_RAM_reg_bram_0_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_bram_0_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_bram_0_CASDOUTPB_UNCONNECTED;
  wire [15:8]NLW_RAM_reg_bram_0_DOUTADOUT_UNCONNECTED;
  wire [15:0]NLW_RAM_reg_bram_0_DOUTBDOUT_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_bram_0_DOUTPADOUTP_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_bram_0_DOUTPBDOUTP_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "4096" *) 
  (* RTL_RAM_NAME = "design_1_pl_matmul_0_0/inst/A_RAM/RAM_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "7" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    RAM_reg_bram_0
       (.ADDRARDADDR({1'b1,ADDRARDADDR,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,Q[8:0],1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_RAM_reg_bram_0_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_RAM_reg_bram_0_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_RAM_reg_bram_0_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_RAM_reg_bram_0_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ACLK),
        .CLKBWRCLK(ACLK),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S_AXIS_TDATA}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0}),
        .DOUTADOUT({NLW_RAM_reg_bram_0_DOUTADOUT_UNCONNECTED[15:8],DOUTADOUT}),
        .DOUTBDOUT(NLW_RAM_reg_bram_0_DOUTBDOUT_UNCONNECTED[15:0]),
        .DOUTPADOUTP(NLW_RAM_reg_bram_0_DOUTPADOUTP_UNCONNECTED[1:0]),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_0_DOUTPBDOUTP_UNCONNECTED[1:0]),
        .ENARDEN(E),
        .ENBWREN(1'b1),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,A_write_en,A_write_en}));
  LUT4 #(
    .INIT(16'h0040)) 
    RAM_reg_bram_0_i_2
       (.I0(Q[9]),
        .I1(S_AXIS_TREADY),
        .I2(S_AXIS_TVALID),
        .I3(A_write_en13_out),
        .O(A_write_en));
  LUT6 #(
    .INIT(64'hE73F50007800F000)) 
    mul0__0_carry__0_i_4
       (.I0(DOUTADOUT[5]),
        .I1(B[0]),
        .I2(DOUTADOUT[6]),
        .I3(B[2]),
        .I4(DOUTADOUT[7]),
        .I5(B[1]),
        .O(RAM_reg_bram_0_19));
  LUT6 #(
    .INIT(64'h9C936C9393939393)) 
    mul0__0_carry_i_12
       (.I0(DOUTADOUT[2]),
        .I1(mul0__0_carry_i_20_n_0),
        .I2(B[1]),
        .I3(B[2]),
        .I4(DOUTADOUT[0]),
        .I5(DOUTADOUT[1]),
        .O(S[2]));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    mul0__0_carry_i_13
       (.I0(DOUTADOUT[0]),
        .I1(B[2]),
        .I2(DOUTADOUT[1]),
        .I3(B[1]),
        .I4(B[0]),
        .I5(DOUTADOUT[2]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h8)) 
    mul0__0_carry_i_15
       (.I0(DOUTADOUT[0]),
        .I1(B[0]),
        .O(S[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__0_carry_i_16
       (.I0(DOUTADOUT[5]),
        .I1(B[2]),
        .O(RAM_reg_bram_0_3));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__0_carry_i_17
       (.I0(DOUTADOUT[4]),
        .I1(B[2]),
        .O(RAM_reg_bram_0_2));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__0_carry_i_18
       (.I0(DOUTADOUT[3]),
        .I1(B[2]),
        .O(RAM_reg_bram_0_1));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__0_carry_i_19
       (.I0(DOUTADOUT[2]),
        .I1(B[2]),
        .O(RAM_reg_bram_0_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__0_carry_i_20
       (.I0(DOUTADOUT[3]),
        .I1(B[0]),
        .O(mul0__0_carry_i_20_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    mul0__0_carry_i_7
       (.I0(DOUTADOUT[1]),
        .I1(B[0]),
        .O(DI));
  LUT6 #(
    .INIT(64'hE73F50007800F000)) 
    mul0__30_carry__0_i_4
       (.I0(DOUTADOUT[5]),
        .I1(B[3]),
        .I2(DOUTADOUT[6]),
        .I3(B[5]),
        .I4(DOUTADOUT[7]),
        .I5(B[4]),
        .O(RAM_reg_bram_0_20));
  LUT6 #(
    .INIT(64'h9C936C9393939393)) 
    mul0__30_carry_i_12
       (.I0(DOUTADOUT[2]),
        .I1(mul0__30_carry_i_20_n_0),
        .I2(B[4]),
        .I3(B[5]),
        .I4(DOUTADOUT[0]),
        .I5(DOUTADOUT[1]),
        .O(RAM_reg_bram_0_8[2]));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    mul0__30_carry_i_13
       (.I0(DOUTADOUT[0]),
        .I1(B[5]),
        .I2(DOUTADOUT[1]),
        .I3(B[4]),
        .I4(B[3]),
        .I5(DOUTADOUT[2]),
        .O(RAM_reg_bram_0_8[1]));
  LUT2 #(
    .INIT(4'h8)) 
    mul0__30_carry_i_15
       (.I0(DOUTADOUT[0]),
        .I1(B[3]),
        .O(RAM_reg_bram_0_8[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__30_carry_i_16
       (.I0(DOUTADOUT[5]),
        .I1(B[5]),
        .O(RAM_reg_bram_0_7));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__30_carry_i_17
       (.I0(DOUTADOUT[4]),
        .I1(B[5]),
        .O(RAM_reg_bram_0_6));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__30_carry_i_18
       (.I0(DOUTADOUT[3]),
        .I1(B[5]),
        .O(RAM_reg_bram_0_5));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__30_carry_i_19
       (.I0(DOUTADOUT[2]),
        .I1(B[5]),
        .O(RAM_reg_bram_0_4));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__30_carry_i_20
       (.I0(DOUTADOUT[3]),
        .I1(B[3]),
        .O(mul0__30_carry_i_20_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    mul0__30_carry_i_7
       (.I0(DOUTADOUT[1]),
        .I1(B[3]),
        .O(RAM_reg_bram_0_9));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__60_carry__0_i_17
       (.I0(DOUTADOUT[5]),
        .I1(B[7]),
        .O(RAM_reg_bram_0_17));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__60_carry__0_i_19
       (.I0(DOUTADOUT[4]),
        .I1(B[7]),
        .O(RAM_reg_bram_0_16));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__60_carry__0_i_20
       (.I0(DOUTADOUT[4]),
        .I1(B[6]),
        .O(RAM_reg_bram_0_14));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__60_carry__0_i_23
       (.I0(DOUTADOUT[3]),
        .I1(B[7]),
        .O(RAM_reg_bram_0_15));
  LUT4 #(
    .INIT(16'h8000)) 
    mul0__60_carry__0_i_5
       (.I0(DOUTADOUT[7]),
        .I1(DOUTADOUT[6]),
        .I2(B[7]),
        .I3(CO),
        .O(RAM_reg_bram_0_18));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__60_carry_i_14
       (.I0(DOUTADOUT[1]),
        .I1(B[7]),
        .O(RAM_reg_bram_0_11));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__60_carry_i_17
       (.I0(DOUTADOUT[3]),
        .I1(B[6]),
        .O(RAM_reg_bram_0_12));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__60_carry_i_20
       (.I0(DOUTADOUT[2]),
        .I1(B[7]),
        .O(RAM_reg_bram_0_13));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h7)) 
    mul0__60_carry_i_21
       (.I0(DOUTADOUT[2]),
        .I1(B[6]),
        .O(mul0__60_carry_i_21_n_0));
  LUT6 #(
    .INIT(64'h807FFF007F80FF00)) 
    mul0__60_carry_i_3
       (.I0(DOUTADOUT[1]),
        .I1(O[0]),
        .I2(mul0__60_carry),
        .I3(mul0__60_carry_0),
        .I4(B[6]),
        .I5(DOUTADOUT[2]),
        .O(RAM_reg_bram_0_10));
  LUT6 #(
    .INIT(64'hB42DD2B4D2B44BD2)) 
    mul0__60_carry_i_7
       (.I0(mul0__60_carry_i_21_n_0),
        .I1(mul0__60_carry_1),
        .I2(mul0__60_carry_2),
        .I3(RAM_reg_bram_0_11),
        .I4(O[1]),
        .I5(mul0__60_carry_3),
        .O(RAM_reg_bram_0_21));
endmodule

(* ORIG_REF_NAME = "memory_RAM" *) 
module design_1_pl_matmul_0_0_memory_RAM__parameterized0
   (A_write_en13_out,
    DI,
    \dob_reg[7]_0 ,
    \dob_reg[2]_0 ,
    \dob_reg[3]_0 ,
    \dob_reg[5]_0 ,
    RAM_reg_bram_0,
    \dob_reg[7]_1 ,
    \dob_reg[6]_0 ,
    RAM_reg_bram_0_0,
    \dob_reg[7]_2 ,
    S,
    \dob_reg[1]_0 ,
    \dob_reg[4]_0 ,
    \dob_reg[4]_1 ,
    RAM_reg_bram_0_1,
    \dob_reg[6]_1 ,
    S_AXIS_TVALID,
    S_AXIS_TREADY,
    Q,
    RAM_reg_bram_0_2,
    DOUTADOUT,
    O,
    mul0__60_carry__0_i_9_0,
    mul0__60_carry,
    mul0__60_carry__0,
    CO,
    mul0__60_carry__0_i_2_0,
    mul0__60_carry__0_i_1_0,
    mul0__0_carry,
    mul0__0_carry_0,
    mul0__0_carry_1,
    mul0__0_carry_2,
    mul0__30_carry,
    mul0__30_carry_0,
    mul0__30_carry_1,
    mul0__30_carry_2,
    mul0__60_carry_0,
    mul0__60_carry__0_0,
    mul0__60_carry__0_1,
    mul0__60_carry__0_2,
    mul0__60_carry__0_3,
    E,
    ACLK,
    S_AXIS_TDATA,
    \dob_reg[1]_1 );
  output A_write_en13_out;
  output [5:0]DI;
  output [7:0]\dob_reg[7]_0 ;
  output [1:0]\dob_reg[2]_0 ;
  output [5:0]\dob_reg[3]_0 ;
  output [1:0]\dob_reg[5]_0 ;
  output RAM_reg_bram_0;
  output \dob_reg[7]_1 ;
  output [0:0]\dob_reg[6]_0 ;
  output RAM_reg_bram_0_0;
  output [3:0]\dob_reg[7]_2 ;
  output [4:0]S;
  output [0:0]\dob_reg[1]_0 ;
  output [4:0]\dob_reg[4]_0 ;
  output [0:0]\dob_reg[4]_1 ;
  output [0:0]RAM_reg_bram_0_1;
  output [3:0]\dob_reg[6]_1 ;
  input S_AXIS_TVALID;
  input S_AXIS_TREADY;
  input [7:0]Q;
  input RAM_reg_bram_0_2;
  input [7:0]DOUTADOUT;
  input [2:0]O;
  input [1:0]mul0__60_carry__0_i_9_0;
  input mul0__60_carry;
  input mul0__60_carry__0;
  input [0:0]CO;
  input [1:0]mul0__60_carry__0_i_2_0;
  input [0:0]mul0__60_carry__0_i_1_0;
  input mul0__0_carry;
  input mul0__0_carry_0;
  input mul0__0_carry_1;
  input mul0__0_carry_2;
  input mul0__30_carry;
  input mul0__30_carry_0;
  input mul0__30_carry_1;
  input mul0__30_carry_2;
  input mul0__60_carry_0;
  input mul0__60_carry__0_0;
  input mul0__60_carry__0_1;
  input mul0__60_carry__0_2;
  input mul0__60_carry__0_3;
  input [0:0]E;
  input ACLK;
  input [7:0]S_AXIS_TDATA;
  input [2:0]\dob_reg[1]_1 ;

  wire ACLK;
  wire A_write_en13_out;
  wire B_write_en;
  wire [0:0]CO;
  wire [5:0]DI;
  wire [7:0]DOUTADOUT;
  wire [0:0]E;
  wire [2:0]O;
  wire [7:0]Q;
  wire RAM_reg_bram_0;
  wire RAM_reg_bram_0_0;
  wire [0:0]RAM_reg_bram_0_1;
  wire RAM_reg_bram_0_2;
  wire [4:0]S;
  wire [7:0]S_AXIS_TDATA;
  wire S_AXIS_TREADY;
  wire S_AXIS_TVALID;
  wire [7:0]dob0__0;
  wire [0:0]\dob_reg[1]_0 ;
  wire [2:0]\dob_reg[1]_1 ;
  wire [1:0]\dob_reg[2]_0 ;
  wire [5:0]\dob_reg[3]_0 ;
  wire [4:0]\dob_reg[4]_0 ;
  wire [0:0]\dob_reg[4]_1 ;
  wire [1:0]\dob_reg[5]_0 ;
  wire [0:0]\dob_reg[6]_0 ;
  wire [3:0]\dob_reg[6]_1 ;
  wire [7:0]\dob_reg[7]_0 ;
  wire \dob_reg[7]_1 ;
  wire [3:0]\dob_reg[7]_2 ;
  wire mul0__0_carry;
  wire mul0__0_carry_0;
  wire mul0__0_carry_1;
  wire mul0__0_carry_2;
  wire mul0__30_carry;
  wire mul0__30_carry_0;
  wire mul0__30_carry_1;
  wire mul0__30_carry_2;
  wire mul0__60_carry;
  wire mul0__60_carry_0;
  wire mul0__60_carry__0;
  wire mul0__60_carry__0_0;
  wire mul0__60_carry__0_1;
  wire mul0__60_carry__0_2;
  wire mul0__60_carry__0_3;
  wire mul0__60_carry__0_i_10_n_0;
  wire mul0__60_carry__0_i_11_n_0;
  wire mul0__60_carry__0_i_12_n_0;
  wire mul0__60_carry__0_i_13_n_0;
  wire mul0__60_carry__0_i_14_n_0;
  wire mul0__60_carry__0_i_15_n_0;
  wire mul0__60_carry__0_i_16_n_0;
  wire mul0__60_carry__0_i_18_n_0;
  wire [0:0]mul0__60_carry__0_i_1_0;
  wire mul0__60_carry__0_i_21_n_0;
  wire mul0__60_carry__0_i_22_n_0;
  wire [1:0]mul0__60_carry__0_i_2_0;
  wire [1:0]mul0__60_carry__0_i_9_0;
  wire mul0__60_carry_i_15_n_0;
  wire mul0__60_carry_i_18_n_0;
  wire mul0__60_carry_i_19_n_0;
  wire [1:0]NLW_RAM_reg_0_7_0_7_DOE_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_7_0_7_DOF_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_7_0_7_DOG_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_7_0_7_DOH_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "64" *) 
  (* RTL_RAM_NAME = "design_1_pl_matmul_0_0/inst/B_RAM/RAM_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "7" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "7" *) 
  RAM32M16 RAM_reg_0_7_0_7
       (.ADDRA({1'b0,1'b0,\dob_reg[1]_1 }),
        .ADDRB({1'b0,1'b0,\dob_reg[1]_1 }),
        .ADDRC({1'b0,1'b0,\dob_reg[1]_1 }),
        .ADDRD({1'b0,1'b0,\dob_reg[1]_1 }),
        .ADDRE({1'b0,1'b0,\dob_reg[1]_1 }),
        .ADDRF({1'b0,1'b0,\dob_reg[1]_1 }),
        .ADDRG({1'b0,1'b0,\dob_reg[1]_1 }),
        .ADDRH({1'b0,1'b0,Q[2:0]}),
        .DIA(S_AXIS_TDATA[1:0]),
        .DIB(S_AXIS_TDATA[3:2]),
        .DIC(S_AXIS_TDATA[5:4]),
        .DID(S_AXIS_TDATA[7:6]),
        .DIE({1'b0,1'b0}),
        .DIF({1'b0,1'b0}),
        .DIG({1'b0,1'b0}),
        .DIH({1'b0,1'b0}),
        .DOA(dob0__0[1:0]),
        .DOB(dob0__0[3:2]),
        .DOC(dob0__0[5:4]),
        .DOD(dob0__0[7:6]),
        .DOE(NLW_RAM_reg_0_7_0_7_DOE_UNCONNECTED[1:0]),
        .DOF(NLW_RAM_reg_0_7_0_7_DOF_UNCONNECTED[1:0]),
        .DOG(NLW_RAM_reg_0_7_0_7_DOG_UNCONNECTED[1:0]),
        .DOH(NLW_RAM_reg_0_7_0_7_DOH_UNCONNECTED[1:0]),
        .WCLK(ACLK),
        .WE(B_write_en));
  LUT3 #(
    .INIT(8'h80)) 
    RAM_reg_0_7_0_7_i_1
       (.I0(S_AXIS_TVALID),
        .I1(S_AXIS_TREADY),
        .I2(A_write_en13_out),
        .O(B_write_en));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    RAM_reg_bram_0_i_4
       (.I0(Q[4]),
        .I1(Q[5]),
        .I2(Q[7]),
        .I3(Q[6]),
        .I4(Q[3]),
        .I5(RAM_reg_bram_0_2),
        .O(A_write_en13_out));
  FDRE \dob_reg[0] 
       (.C(ACLK),
        .CE(E),
        .D(dob0__0[0]),
        .Q(\dob_reg[7]_0 [0]),
        .R(1'b0));
  FDRE \dob_reg[1] 
       (.C(ACLK),
        .CE(E),
        .D(dob0__0[1]),
        .Q(\dob_reg[7]_0 [1]),
        .R(1'b0));
  FDRE \dob_reg[2] 
       (.C(ACLK),
        .CE(E),
        .D(dob0__0[2]),
        .Q(\dob_reg[7]_0 [2]),
        .R(1'b0));
  FDRE \dob_reg[3] 
       (.C(ACLK),
        .CE(E),
        .D(dob0__0[3]),
        .Q(\dob_reg[7]_0 [3]),
        .R(1'b0));
  FDRE \dob_reg[4] 
       (.C(ACLK),
        .CE(E),
        .D(dob0__0[4]),
        .Q(\dob_reg[7]_0 [4]),
        .R(1'b0));
  FDRE \dob_reg[5] 
       (.C(ACLK),
        .CE(E),
        .D(dob0__0[5]),
        .Q(\dob_reg[7]_0 [5]),
        .R(1'b0));
  FDRE \dob_reg[6] 
       (.C(ACLK),
        .CE(E),
        .D(dob0__0[6]),
        .Q(\dob_reg[7]_0 [6]),
        .R(1'b0));
  FDRE \dob_reg[7] 
       (.C(ACLK),
        .CE(E),
        .D(dob0__0[7]),
        .Q(\dob_reg[7]_0 [7]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h8000)) 
    mul0__0_carry__0_i_1
       (.I0(\dob_reg[7]_0 [2]),
        .I1(DOUTADOUT[6]),
        .I2(\dob_reg[7]_0 [1]),
        .I3(DOUTADOUT[7]),
        .O(\dob_reg[2]_0 [1]));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    mul0__0_carry__0_i_2
       (.I0(\dob_reg[7]_0 [0]),
        .I1(DOUTADOUT[7]),
        .I2(DOUTADOUT[5]),
        .I3(\dob_reg[7]_0 [2]),
        .I4(DOUTADOUT[6]),
        .I5(\dob_reg[7]_0 [1]),
        .O(\dob_reg[2]_0 [0]));
  LUT4 #(
    .INIT(16'h7000)) 
    mul0__0_carry__0_i_3
       (.I0(\dob_reg[7]_0 [1]),
        .I1(DOUTADOUT[6]),
        .I2(\dob_reg[7]_0 [2]),
        .I3(DOUTADOUT[7]),
        .O(\dob_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    mul0__0_carry_i_1
       (.I0(\dob_reg[7]_0 [0]),
        .I1(DOUTADOUT[6]),
        .I2(DOUTADOUT[4]),
        .I3(\dob_reg[7]_0 [2]),
        .I4(DOUTADOUT[5]),
        .I5(\dob_reg[7]_0 [1]),
        .O(DI[5]));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    mul0__0_carry_i_10
       (.I0(DI[3]),
        .I1(\dob_reg[7]_0 [1]),
        .I2(DOUTADOUT[4]),
        .I3(mul0__0_carry_0),
        .I4(DOUTADOUT[5]),
        .I5(\dob_reg[7]_0 [0]),
        .O(S[2]));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    mul0__0_carry_i_11
       (.I0(DI[2]),
        .I1(\dob_reg[7]_0 [1]),
        .I2(DOUTADOUT[3]),
        .I3(mul0__0_carry),
        .I4(DOUTADOUT[4]),
        .I5(\dob_reg[7]_0 [0]),
        .O(S[1]));
  LUT4 #(
    .INIT(16'h7888)) 
    mul0__0_carry_i_14
       (.I0(\dob_reg[7]_0 [0]),
        .I1(DOUTADOUT[1]),
        .I2(\dob_reg[7]_0 [1]),
        .I3(DOUTADOUT[0]),
        .O(S[0]));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    mul0__0_carry_i_2
       (.I0(\dob_reg[7]_0 [0]),
        .I1(DOUTADOUT[5]),
        .I2(DOUTADOUT[3]),
        .I3(\dob_reg[7]_0 [2]),
        .I4(DOUTADOUT[4]),
        .I5(\dob_reg[7]_0 [1]),
        .O(DI[4]));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    mul0__0_carry_i_3
       (.I0(\dob_reg[7]_0 [0]),
        .I1(DOUTADOUT[4]),
        .I2(DOUTADOUT[2]),
        .I3(\dob_reg[7]_0 [2]),
        .I4(DOUTADOUT[3]),
        .I5(\dob_reg[7]_0 [1]),
        .O(DI[3]));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    mul0__0_carry_i_4
       (.I0(\dob_reg[7]_0 [0]),
        .I1(DOUTADOUT[3]),
        .I2(DOUTADOUT[1]),
        .I3(\dob_reg[7]_0 [2]),
        .I4(DOUTADOUT[2]),
        .I5(\dob_reg[7]_0 [1]),
        .O(DI[2]));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    mul0__0_carry_i_5
       (.I0(\dob_reg[7]_0 [0]),
        .I1(DOUTADOUT[3]),
        .I2(DOUTADOUT[1]),
        .I3(\dob_reg[7]_0 [2]),
        .I4(DOUTADOUT[2]),
        .I5(\dob_reg[7]_0 [1]),
        .O(DI[1]));
  LUT4 #(
    .INIT(16'h7888)) 
    mul0__0_carry_i_6
       (.I0(\dob_reg[7]_0 [1]),
        .I1(DOUTADOUT[1]),
        .I2(\dob_reg[7]_0 [2]),
        .I3(DOUTADOUT[0]),
        .O(DI[0]));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    mul0__0_carry_i_8
       (.I0(DI[5]),
        .I1(\dob_reg[7]_0 [1]),
        .I2(DOUTADOUT[6]),
        .I3(mul0__0_carry_2),
        .I4(DOUTADOUT[7]),
        .I5(\dob_reg[7]_0 [0]),
        .O(S[4]));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    mul0__0_carry_i_9
       (.I0(DI[4]),
        .I1(\dob_reg[7]_0 [1]),
        .I2(DOUTADOUT[5]),
        .I3(mul0__0_carry_1),
        .I4(DOUTADOUT[6]),
        .I5(\dob_reg[7]_0 [0]),
        .O(S[3]));
  LUT4 #(
    .INIT(16'h8000)) 
    mul0__30_carry__0_i_1
       (.I0(\dob_reg[7]_0 [5]),
        .I1(DOUTADOUT[6]),
        .I2(\dob_reg[7]_0 [4]),
        .I3(DOUTADOUT[7]),
        .O(\dob_reg[5]_0 [1]));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    mul0__30_carry__0_i_2
       (.I0(\dob_reg[7]_0 [3]),
        .I1(DOUTADOUT[7]),
        .I2(DOUTADOUT[5]),
        .I3(\dob_reg[7]_0 [5]),
        .I4(DOUTADOUT[6]),
        .I5(\dob_reg[7]_0 [4]),
        .O(\dob_reg[5]_0 [0]));
  LUT4 #(
    .INIT(16'h7000)) 
    mul0__30_carry__0_i_3
       (.I0(\dob_reg[7]_0 [4]),
        .I1(DOUTADOUT[6]),
        .I2(\dob_reg[7]_0 [5]),
        .I3(DOUTADOUT[7]),
        .O(\dob_reg[4]_1 ));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    mul0__30_carry_i_1
       (.I0(\dob_reg[7]_0 [3]),
        .I1(DOUTADOUT[6]),
        .I2(DOUTADOUT[4]),
        .I3(\dob_reg[7]_0 [5]),
        .I4(DOUTADOUT[5]),
        .I5(\dob_reg[7]_0 [4]),
        .O(\dob_reg[3]_0 [5]));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    mul0__30_carry_i_10
       (.I0(\dob_reg[3]_0 [3]),
        .I1(\dob_reg[7]_0 [4]),
        .I2(DOUTADOUT[4]),
        .I3(mul0__30_carry_0),
        .I4(DOUTADOUT[5]),
        .I5(\dob_reg[7]_0 [3]),
        .O(\dob_reg[4]_0 [2]));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    mul0__30_carry_i_11
       (.I0(\dob_reg[3]_0 [2]),
        .I1(\dob_reg[7]_0 [4]),
        .I2(DOUTADOUT[3]),
        .I3(mul0__30_carry),
        .I4(DOUTADOUT[4]),
        .I5(\dob_reg[7]_0 [3]),
        .O(\dob_reg[4]_0 [1]));
  LUT4 #(
    .INIT(16'h7888)) 
    mul0__30_carry_i_14
       (.I0(\dob_reg[7]_0 [3]),
        .I1(DOUTADOUT[1]),
        .I2(\dob_reg[7]_0 [4]),
        .I3(DOUTADOUT[0]),
        .O(\dob_reg[4]_0 [0]));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    mul0__30_carry_i_2
       (.I0(\dob_reg[7]_0 [3]),
        .I1(DOUTADOUT[5]),
        .I2(DOUTADOUT[3]),
        .I3(\dob_reg[7]_0 [5]),
        .I4(DOUTADOUT[4]),
        .I5(\dob_reg[7]_0 [4]),
        .O(\dob_reg[3]_0 [4]));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    mul0__30_carry_i_3
       (.I0(\dob_reg[7]_0 [3]),
        .I1(DOUTADOUT[4]),
        .I2(DOUTADOUT[2]),
        .I3(\dob_reg[7]_0 [5]),
        .I4(DOUTADOUT[3]),
        .I5(\dob_reg[7]_0 [4]),
        .O(\dob_reg[3]_0 [3]));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    mul0__30_carry_i_4
       (.I0(\dob_reg[7]_0 [3]),
        .I1(DOUTADOUT[3]),
        .I2(DOUTADOUT[1]),
        .I3(\dob_reg[7]_0 [5]),
        .I4(DOUTADOUT[2]),
        .I5(\dob_reg[7]_0 [4]),
        .O(\dob_reg[3]_0 [2]));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    mul0__30_carry_i_5
       (.I0(\dob_reg[7]_0 [3]),
        .I1(DOUTADOUT[3]),
        .I2(DOUTADOUT[1]),
        .I3(\dob_reg[7]_0 [5]),
        .I4(DOUTADOUT[2]),
        .I5(\dob_reg[7]_0 [4]),
        .O(\dob_reg[3]_0 [1]));
  LUT4 #(
    .INIT(16'h7888)) 
    mul0__30_carry_i_6
       (.I0(\dob_reg[7]_0 [4]),
        .I1(DOUTADOUT[1]),
        .I2(\dob_reg[7]_0 [5]),
        .I3(DOUTADOUT[0]),
        .O(\dob_reg[3]_0 [0]));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    mul0__30_carry_i_8
       (.I0(\dob_reg[3]_0 [5]),
        .I1(\dob_reg[7]_0 [4]),
        .I2(DOUTADOUT[6]),
        .I3(mul0__30_carry_2),
        .I4(DOUTADOUT[7]),
        .I5(\dob_reg[7]_0 [3]),
        .O(\dob_reg[4]_0 [4]));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    mul0__30_carry_i_9
       (.I0(\dob_reg[3]_0 [4]),
        .I1(\dob_reg[7]_0 [4]),
        .I2(DOUTADOUT[5]),
        .I3(mul0__30_carry_1),
        .I4(DOUTADOUT[6]),
        .I5(\dob_reg[7]_0 [3]),
        .O(\dob_reg[4]_0 [3]));
  LUT6 #(
    .INIT(64'hFF80800080008000)) 
    mul0__60_carry__0_i_1
       (.I0(mul0__60_carry__0_i_2_0[1]),
        .I1(\dob_reg[7]_0 [7]),
        .I2(DOUTADOUT[5]),
        .I3(mul0__60_carry__0_i_10_n_0),
        .I4(\dob_reg[7]_0 [6]),
        .I5(DOUTADOUT[7]),
        .O(\dob_reg[7]_2 [3]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h78)) 
    mul0__60_carry__0_i_10
       (.I0(\dob_reg[7]_0 [7]),
        .I1(DOUTADOUT[6]),
        .I2(mul0__60_carry__0_i_1_0),
        .O(mul0__60_carry__0_i_10_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    mul0__60_carry__0_i_11
       (.I0(\dob_reg[7]_0 [7]),
        .I1(DOUTADOUT[5]),
        .I2(mul0__60_carry__0_i_2_0[1]),
        .O(mul0__60_carry__0_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hF880)) 
    mul0__60_carry__0_i_12
       (.I0(\dob_reg[7]_0 [7]),
        .I1(DOUTADOUT[3]),
        .I2(O[2]),
        .I3(CO),
        .O(mul0__60_carry__0_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    mul0__60_carry__0_i_13
       (.I0(\dob_reg[7]_0 [7]),
        .I1(DOUTADOUT[3]),
        .I2(O[2]),
        .I3(CO),
        .O(mul0__60_carry__0_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h80)) 
    mul0__60_carry__0_i_14
       (.I0(mul0__60_carry__0_i_2_0[1]),
        .I1(\dob_reg[7]_0 [7]),
        .I2(DOUTADOUT[5]),
        .O(mul0__60_carry__0_i_14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    mul0__60_carry__0_i_15
       (.I0(mul0__60_carry__0_i_2_0[0]),
        .I1(\dob_reg[7]_0 [7]),
        .I2(DOUTADOUT[4]),
        .O(mul0__60_carry__0_i_15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h78888777)) 
    mul0__60_carry__0_i_16
       (.I0(DOUTADOUT[7]),
        .I1(\dob_reg[7]_0 [6]),
        .I2(\dob_reg[7]_0 [7]),
        .I3(DOUTADOUT[6]),
        .I4(mul0__60_carry__0_i_1_0),
        .O(mul0__60_carry__0_i_16_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h78888777)) 
    mul0__60_carry__0_i_18
       (.I0(DOUTADOUT[6]),
        .I1(\dob_reg[7]_0 [6]),
        .I2(\dob_reg[7]_0 [7]),
        .I3(DOUTADOUT[5]),
        .I4(mul0__60_carry__0_i_2_0[1]),
        .O(mul0__60_carry__0_i_18_n_0));
  LUT6 #(
    .INIT(64'hFF80800080008000)) 
    mul0__60_carry__0_i_2
       (.I0(mul0__60_carry__0_i_2_0[0]),
        .I1(\dob_reg[7]_0 [7]),
        .I2(DOUTADOUT[4]),
        .I3(mul0__60_carry__0_i_11_n_0),
        .I4(\dob_reg[7]_0 [6]),
        .I5(DOUTADOUT[6]),
        .O(\dob_reg[7]_2 [2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hF880)) 
    mul0__60_carry__0_i_21
       (.I0(\dob_reg[7]_0 [7]),
        .I1(DOUTADOUT[2]),
        .I2(O[1]),
        .I3(mul0__60_carry__0_i_9_0[1]),
        .O(mul0__60_carry__0_i_21_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h78888777)) 
    mul0__60_carry__0_i_22
       (.I0(DOUTADOUT[5]),
        .I1(\dob_reg[7]_0 [6]),
        .I2(\dob_reg[7]_0 [7]),
        .I3(DOUTADOUT[4]),
        .I4(mul0__60_carry__0_i_2_0[0]),
        .O(mul0__60_carry__0_i_22_n_0));
  LUT6 #(
    .INIT(64'hBEEE288828882888)) 
    mul0__60_carry__0_i_3
       (.I0(mul0__60_carry__0_i_12_n_0),
        .I1(mul0__60_carry__0_i_2_0[0]),
        .I2(DOUTADOUT[4]),
        .I3(\dob_reg[7]_0 [7]),
        .I4(\dob_reg[7]_0 [6]),
        .I5(DOUTADOUT[5]),
        .O(\dob_reg[7]_2 [1]));
  LUT6 #(
    .INIT(64'hFFD4D400D400D400)) 
    mul0__60_carry__0_i_4
       (.I0(mul0__60_carry__0),
        .I1(O[1]),
        .I2(mul0__60_carry__0_i_9_0[1]),
        .I3(mul0__60_carry__0_i_13_n_0),
        .I4(\dob_reg[7]_0 [6]),
        .I5(DOUTADOUT[4]),
        .O(\dob_reg[7]_2 [0]));
  LUT6 #(
    .INIT(64'h8FEC1C801CEC7080)) 
    mul0__60_carry__0_i_6
       (.I0(\dob_reg[7]_0 [6]),
        .I1(mul0__60_carry__0_i_14_n_0),
        .I2(DOUTADOUT[7]),
        .I3(\dob_reg[7]_0 [7]),
        .I4(mul0__60_carry__0_i_1_0),
        .I5(DOUTADOUT[6]),
        .O(\dob_reg[6]_1 [3]));
  LUT6 #(
    .INIT(64'hF807807F7F80F807)) 
    mul0__60_carry__0_i_7
       (.I0(DOUTADOUT[6]),
        .I1(\dob_reg[7]_0 [6]),
        .I2(mul0__60_carry__0_i_15_n_0),
        .I3(mul0__60_carry__0_i_16_n_0),
        .I4(mul0__60_carry__0_i_2_0[1]),
        .I5(mul0__60_carry__0_3),
        .O(\dob_reg[6]_1 [2]));
  LUT6 #(
    .INIT(64'hF807807F7F80F807)) 
    mul0__60_carry__0_i_8
       (.I0(DOUTADOUT[5]),
        .I1(\dob_reg[7]_0 [6]),
        .I2(mul0__60_carry__0_i_12_n_0),
        .I3(mul0__60_carry__0_i_18_n_0),
        .I4(mul0__60_carry__0_i_2_0[0]),
        .I5(mul0__60_carry__0_2),
        .O(\dob_reg[6]_1 [1]));
  LUT6 #(
    .INIT(64'hB42DD2B4D2B44BD2)) 
    mul0__60_carry__0_i_9
       (.I0(mul0__60_carry__0_0),
        .I1(mul0__60_carry__0_i_21_n_0),
        .I2(mul0__60_carry__0_i_22_n_0),
        .I3(mul0__60_carry__0_1),
        .I4(O[2]),
        .I5(CO),
        .O(\dob_reg[6]_1 [0]));
  LUT6 #(
    .INIT(64'hFFD4D400D400D400)) 
    mul0__60_carry_i_1
       (.I0(mul0__60_carry),
        .I1(O[0]),
        .I2(mul0__60_carry__0_i_9_0[0]),
        .I3(mul0__60_carry_i_15_n_0),
        .I4(\dob_reg[7]_0 [6]),
        .I5(DOUTADOUT[3]),
        .O(\dob_reg[6]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    mul0__60_carry_i_15
       (.I0(\dob_reg[7]_0 [7]),
        .I1(DOUTADOUT[2]),
        .I2(O[1]),
        .I3(mul0__60_carry__0_i_9_0[1]),
        .O(mul0__60_carry_i_15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    mul0__60_carry_i_16
       (.I0(\dob_reg[7]_0 [7]),
        .I1(DOUTADOUT[1]),
        .I2(O[0]),
        .I3(mul0__60_carry__0_i_9_0[0]),
        .O(\dob_reg[7]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hF880)) 
    mul0__60_carry_i_18
       (.I0(\dob_reg[7]_0 [7]),
        .I1(DOUTADOUT[1]),
        .I2(O[0]),
        .I3(mul0__60_carry__0_i_9_0[0]),
        .O(mul0__60_carry_i_18_n_0));
  LUT6 #(
    .INIT(64'h8777788878888777)) 
    mul0__60_carry_i_19
       (.I0(DOUTADOUT[4]),
        .I1(\dob_reg[7]_0 [6]),
        .I2(\dob_reg[7]_0 [7]),
        .I3(DOUTADOUT[3]),
        .I4(O[2]),
        .I5(CO),
        .O(mul0__60_carry_i_19_n_0));
  LUT6 #(
    .INIT(64'h8777788878888777)) 
    mul0__60_carry_i_23
       (.I0(DOUTADOUT[3]),
        .I1(\dob_reg[7]_0 [6]),
        .I2(\dob_reg[7]_0 [7]),
        .I3(DOUTADOUT[2]),
        .I4(O[1]),
        .I5(mul0__60_carry__0_i_9_0[1]),
        .O(RAM_reg_bram_0_0));
  LUT6 #(
    .INIT(64'h8777788878888777)) 
    mul0__60_carry_i_24
       (.I0(DOUTADOUT[2]),
        .I1(\dob_reg[7]_0 [6]),
        .I2(\dob_reg[7]_0 [7]),
        .I3(DOUTADOUT[1]),
        .I4(O[0]),
        .I5(mul0__60_carry__0_i_9_0[0]),
        .O(RAM_reg_bram_0));
  LUT6 #(
    .INIT(64'hB42DD2B4D2B44BD2)) 
    mul0__60_carry_i_6
       (.I0(mul0__60_carry_0),
        .I1(mul0__60_carry_i_18_n_0),
        .I2(mul0__60_carry_i_19_n_0),
        .I3(mul0__60_carry__0),
        .I4(O[1]),
        .I5(mul0__60_carry__0_i_9_0[1]),
        .O(RAM_reg_bram_0_1));
endmodule

(* ORIG_REF_NAME = "memory_RAM" *) 
module design_1_pl_matmul_0_0_memory_RAM__parameterized1
   (M_AXIS_TDATA,
    ACLK,
    dia,
    RES_write_en,
    Q,
    \dob_reg[0]_0 ,
    \dob_reg[0]_1 ,
    \dob_reg[0]_2 ,
    \dob_reg[0]_3 ,
    \dob_reg[0]_4 ,
    \dob_reg[0]_5 ,
    E);
  output [7:0]M_AXIS_TDATA;
  input ACLK;
  input [7:0]dia;
  input RES_write_en;
  input [5:0]Q;
  input \dob_reg[0]_0 ;
  input \dob_reg[0]_1 ;
  input \dob_reg[0]_2 ;
  input \dob_reg[0]_3 ;
  input \dob_reg[0]_4 ;
  input \dob_reg[0]_5 ;
  input [0:0]E;

  wire ACLK;
  wire [0:0]E;
  wire [7:0]M_AXIS_TDATA;
  wire [5:0]Q;
  wire RES_write_en;
  wire [7:0]dia;
  wire [7:0]dob0;
  wire \dob_reg[0]_0 ;
  wire \dob_reg[0]_1 ;
  wire \dob_reg[0]_2 ;
  wire \dob_reg[0]_3 ;
  wire \dob_reg[0]_4 ;
  wire \dob_reg[0]_5 ;
  wire NLW_RAM_reg_0_63_0_6_DOH_UNCONNECTED;
  wire NLW_RAM_reg_0_63_7_7_SPO_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "512" *) 
  (* RTL_RAM_NAME = "design_1_pl_matmul_0_0/inst/RES_RAM/RAM_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "6" *) 
  RAM64M8 RAM_reg_0_63_0_6
       (.ADDRA({\dob_reg[0]_5 ,\dob_reg[0]_4 ,\dob_reg[0]_3 ,\dob_reg[0]_2 ,\dob_reg[0]_1 ,\dob_reg[0]_0 }),
        .ADDRB({\dob_reg[0]_5 ,\dob_reg[0]_4 ,\dob_reg[0]_3 ,\dob_reg[0]_2 ,\dob_reg[0]_1 ,\dob_reg[0]_0 }),
        .ADDRC({\dob_reg[0]_5 ,\dob_reg[0]_4 ,\dob_reg[0]_3 ,\dob_reg[0]_2 ,\dob_reg[0]_1 ,\dob_reg[0]_0 }),
        .ADDRD({\dob_reg[0]_5 ,\dob_reg[0]_4 ,\dob_reg[0]_3 ,\dob_reg[0]_2 ,\dob_reg[0]_1 ,\dob_reg[0]_0 }),
        .ADDRE({\dob_reg[0]_5 ,\dob_reg[0]_4 ,\dob_reg[0]_3 ,\dob_reg[0]_2 ,\dob_reg[0]_1 ,\dob_reg[0]_0 }),
        .ADDRF({\dob_reg[0]_5 ,\dob_reg[0]_4 ,\dob_reg[0]_3 ,\dob_reg[0]_2 ,\dob_reg[0]_1 ,\dob_reg[0]_0 }),
        .ADDRG({\dob_reg[0]_5 ,\dob_reg[0]_4 ,\dob_reg[0]_3 ,\dob_reg[0]_2 ,\dob_reg[0]_1 ,\dob_reg[0]_0 }),
        .ADDRH(Q),
        .DIA(dia[0]),
        .DIB(dia[1]),
        .DIC(dia[2]),
        .DID(dia[3]),
        .DIE(dia[4]),
        .DIF(dia[5]),
        .DIG(dia[6]),
        .DIH(1'b0),
        .DOA(dob0[0]),
        .DOB(dob0[1]),
        .DOC(dob0[2]),
        .DOD(dob0[3]),
        .DOE(dob0[4]),
        .DOF(dob0[5]),
        .DOG(dob0[6]),
        .DOH(NLW_RAM_reg_0_63_0_6_DOH_UNCONNECTED),
        .WCLK(ACLK),
        .WE(RES_write_en));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "512" *) 
  (* RTL_RAM_NAME = "design_1_pl_matmul_0_0/inst/RES_RAM/RAM_reg_0_63_7_7" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D RAM_reg_0_63_7_7
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .A4(Q[4]),
        .A5(Q[5]),
        .D(dia[7]),
        .DPO(dob0[7]),
        .DPRA0(\dob_reg[0]_0 ),
        .DPRA1(\dob_reg[0]_1 ),
        .DPRA2(\dob_reg[0]_2 ),
        .DPRA3(\dob_reg[0]_3 ),
        .DPRA4(\dob_reg[0]_4 ),
        .DPRA5(\dob_reg[0]_5 ),
        .SPO(NLW_RAM_reg_0_63_7_7_SPO_UNCONNECTED),
        .WCLK(ACLK),
        .WE(RES_write_en));
  FDRE \dob_reg[0] 
       (.C(ACLK),
        .CE(E),
        .D(dob0[0]),
        .Q(M_AXIS_TDATA[0]),
        .R(1'b0));
  FDRE \dob_reg[1] 
       (.C(ACLK),
        .CE(E),
        .D(dob0[1]),
        .Q(M_AXIS_TDATA[1]),
        .R(1'b0));
  FDRE \dob_reg[2] 
       (.C(ACLK),
        .CE(E),
        .D(dob0[2]),
        .Q(M_AXIS_TDATA[2]),
        .R(1'b0));
  FDRE \dob_reg[3] 
       (.C(ACLK),
        .CE(E),
        .D(dob0[3]),
        .Q(M_AXIS_TDATA[3]),
        .R(1'b0));
  FDRE \dob_reg[4] 
       (.C(ACLK),
        .CE(E),
        .D(dob0[4]),
        .Q(M_AXIS_TDATA[4]),
        .R(1'b0));
  FDRE \dob_reg[5] 
       (.C(ACLK),
        .CE(E),
        .D(dob0[5]),
        .Q(M_AXIS_TDATA[5]),
        .R(1'b0));
  FDRE \dob_reg[6] 
       (.C(ACLK),
        .CE(E),
        .D(dob0[6]),
        .Q(M_AXIS_TDATA[6]),
        .R(1'b0));
  FDRE \dob_reg[7] 
       (.C(ACLK),
        .CE(E),
        .D(dob0[7]),
        .Q(M_AXIS_TDATA[7]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "myip_v1_0" *) 
module design_1_pl_matmul_0_0_myip_v1_0
   (S_AXIS_TREADY,
    M_AXIS_TDATA,
    M_AXIS_TVALID,
    M_AXIS_TLAST,
    ACLK,
    S_AXIS_TDATA,
    S_AXIS_TVALID,
    ARESETN,
    M_AXIS_TREADY,
    S_AXIS_TLAST);
  output S_AXIS_TREADY;
  output [7:0]M_AXIS_TDATA;
  output M_AXIS_TVALID;
  output M_AXIS_TLAST;
  input ACLK;
  input [7:0]S_AXIS_TDATA;
  input S_AXIS_TVALID;
  input ARESETN;
  input M_AXIS_TREADY;
  input S_AXIS_TLAST;

  wire ACLK;
  wire ARESETN;
  wire A_RAM_n_10;
  wire A_RAM_n_11;
  wire A_RAM_n_12;
  wire A_RAM_n_13;
  wire A_RAM_n_14;
  wire A_RAM_n_15;
  wire A_RAM_n_16;
  wire A_RAM_n_17;
  wire A_RAM_n_18;
  wire A_RAM_n_19;
  wire A_RAM_n_20;
  wire A_RAM_n_21;
  wire A_RAM_n_22;
  wire A_RAM_n_23;
  wire A_RAM_n_24;
  wire A_RAM_n_25;
  wire A_RAM_n_26;
  wire A_RAM_n_27;
  wire A_RAM_n_28;
  wire A_RAM_n_29;
  wire A_RAM_n_30;
  wire A_RAM_n_31;
  wire A_RAM_n_32;
  wire A_RAM_n_33;
  wire A_RAM_n_34;
  wire A_RAM_n_35;
  wire A_RAM_n_8;
  wire A_RAM_n_9;
  wire [8:0]A_read_address;
  wire [7:0]A_read_data_out;
  wire A_write_en13_out;
  wire [7:0]B;
  wire B_RAM_n_1;
  wire B_RAM_n_15;
  wire B_RAM_n_16;
  wire B_RAM_n_17;
  wire B_RAM_n_18;
  wire B_RAM_n_19;
  wire B_RAM_n_2;
  wire B_RAM_n_20;
  wire B_RAM_n_21;
  wire B_RAM_n_22;
  wire B_RAM_n_23;
  wire B_RAM_n_24;
  wire B_RAM_n_25;
  wire B_RAM_n_26;
  wire B_RAM_n_27;
  wire B_RAM_n_28;
  wire B_RAM_n_29;
  wire B_RAM_n_3;
  wire B_RAM_n_30;
  wire B_RAM_n_31;
  wire B_RAM_n_32;
  wire B_RAM_n_33;
  wire B_RAM_n_34;
  wire B_RAM_n_35;
  wire B_RAM_n_36;
  wire B_RAM_n_37;
  wire B_RAM_n_38;
  wire B_RAM_n_39;
  wire B_RAM_n_4;
  wire B_RAM_n_40;
  wire B_RAM_n_41;
  wire B_RAM_n_42;
  wire B_RAM_n_43;
  wire B_RAM_n_44;
  wire B_RAM_n_45;
  wire B_RAM_n_46;
  wire B_RAM_n_47;
  wire B_RAM_n_48;
  wire B_RAM_n_49;
  wire B_RAM_n_5;
  wire B_RAM_n_6;
  wire B_read_en;
  wire \FSM_onehot_state[2]_i_3_n_0 ;
  wire \FSM_onehot_state[2]_i_4_n_0 ;
  wire \FSM_onehot_state[3]_i_2_n_0 ;
  wire [7:0]M_AXIS_TDATA;
  wire M_AXIS_TLAST;
  wire M_AXIS_TLAST_i_1_n_0;
  wire M_AXIS_TLAST_i_2_n_0;
  wire M_AXIS_TREADY;
  wire M_AXIS_TVALID;
  wire RES_read_en;
  wire RES_write_en;
  wire [7:0]S_AXIS_TDATA;
  wire S_AXIS_TLAST;
  wire S_AXIS_TREADY;
  wire S_AXIS_TVALID;
  wire [5:0]addra;
  wire [7:0]dia;
  wire matrix_multiply_0_n_10;
  wire matrix_multiply_0_n_11;
  wire matrix_multiply_0_n_12;
  wire matrix_multiply_0_n_13;
  wire matrix_multiply_0_n_14;
  wire matrix_multiply_0_n_15;
  wire matrix_multiply_0_n_16;
  wire matrix_multiply_0_n_17;
  wire matrix_multiply_0_n_18;
  wire matrix_multiply_0_n_19;
  wire matrix_multiply_0_n_31;
  wire matrix_multiply_0_n_32;
  wire matrix_multiply_0_n_34;
  wire matrix_multiply_0_n_42;
  wire matrix_multiply_0_n_9;
  wire [3:0]next_state;
  wire [0:0]read_counter;
  wire \read_counter[0]_i_1_n_0 ;
  wire \read_counter[1]_i_1_n_0 ;
  wire \read_counter[2]_i_1_n_0 ;
  wire \read_counter[3]_i_1_n_0 ;
  wire \read_counter[4]_i_1_n_0 ;
  wire \read_counter[5]_i_1_n_0 ;
  wire \read_counter[5]_i_2_n_0 ;
  wire \read_counter[6]_i_1_n_0 ;
  wire \read_counter[7]_i_1_n_0 ;
  wire \read_counter[8]_i_1_n_0 ;
  wire \read_counter[9]_i_2_n_0 ;
  wire \read_counter[9]_i_3_n_0 ;
  wire \read_counter_reg_n_0_[0] ;
  wire \read_counter_reg_n_0_[1] ;
  wire \read_counter_reg_n_0_[2] ;
  wire \read_counter_reg_n_0_[3] ;
  wire \read_counter_reg_n_0_[4] ;
  wire \read_counter_reg_n_0_[5] ;
  wire \read_counter_reg_n_0_[6] ;
  wire \read_counter_reg_n_0_[7] ;
  wire \read_counter_reg_n_0_[8] ;
  wire \read_counter_reg_n_0_[9] ;
  wire [3:0]state;
  wire [0:0]write_counter;
  wire \write_counter[0]_i_2_n_0 ;
  wire \write_counter[1]_i_1_n_0 ;
  wire \write_counter[2]_i_1_n_0 ;
  wire \write_counter[3]_i_1_n_0 ;
  wire \write_counter[4]_i_1_n_0 ;
  wire \write_counter[4]_i_2_n_0 ;
  wire \write_counter[5]_i_1_n_0 ;
  wire \write_counter[5]_i_2_n_0 ;
  wire \write_counter_reg_n_0_[0] ;
  wire \write_counter_reg_n_0_[1] ;
  wire \write_counter_reg_n_0_[2] ;
  wire \write_counter_reg_n_0_[3] ;
  wire \write_counter_reg_n_0_[4] ;
  wire \write_counter_reg_n_0_[5] ;

  design_1_pl_matmul_0_0_memory_RAM A_RAM
       (.ACLK(ACLK),
        .ADDRARDADDR(A_read_address),
        .A_write_en13_out(A_write_en13_out),
        .B(B),
        .CO(matrix_multiply_0_n_17),
        .DI(A_RAM_n_15),
        .DOUTADOUT(A_read_data_out),
        .E(B_read_en),
        .O({matrix_multiply_0_n_15,matrix_multiply_0_n_16}),
        .Q({\read_counter_reg_n_0_[9] ,\read_counter_reg_n_0_[8] ,\read_counter_reg_n_0_[7] ,\read_counter_reg_n_0_[6] ,\read_counter_reg_n_0_[5] ,\read_counter_reg_n_0_[4] ,\read_counter_reg_n_0_[3] ,\read_counter_reg_n_0_[2] ,\read_counter_reg_n_0_[1] ,\read_counter_reg_n_0_[0] }),
        .RAM_reg_bram_0_0(A_RAM_n_8),
        .RAM_reg_bram_0_1(A_RAM_n_9),
        .RAM_reg_bram_0_10(A_RAM_n_24),
        .RAM_reg_bram_0_11(A_RAM_n_25),
        .RAM_reg_bram_0_12(A_RAM_n_26),
        .RAM_reg_bram_0_13(A_RAM_n_27),
        .RAM_reg_bram_0_14(A_RAM_n_28),
        .RAM_reg_bram_0_15(A_RAM_n_29),
        .RAM_reg_bram_0_16(A_RAM_n_30),
        .RAM_reg_bram_0_17(A_RAM_n_31),
        .RAM_reg_bram_0_18(A_RAM_n_32),
        .RAM_reg_bram_0_19(A_RAM_n_33),
        .RAM_reg_bram_0_2(A_RAM_n_10),
        .RAM_reg_bram_0_20(A_RAM_n_34),
        .RAM_reg_bram_0_21(A_RAM_n_35),
        .RAM_reg_bram_0_3(A_RAM_n_11),
        .RAM_reg_bram_0_4(A_RAM_n_16),
        .RAM_reg_bram_0_5(A_RAM_n_17),
        .RAM_reg_bram_0_6(A_RAM_n_18),
        .RAM_reg_bram_0_7(A_RAM_n_19),
        .RAM_reg_bram_0_8({A_RAM_n_20,A_RAM_n_21,A_RAM_n_22}),
        .RAM_reg_bram_0_9(A_RAM_n_23),
        .S({A_RAM_n_12,A_RAM_n_13,A_RAM_n_14}),
        .S_AXIS_TDATA(S_AXIS_TDATA),
        .S_AXIS_TREADY(S_AXIS_TREADY),
        .S_AXIS_TVALID(S_AXIS_TVALID),
        .mul0__60_carry(matrix_multiply_0_n_9),
        .mul0__60_carry_0(B_RAM_n_26),
        .mul0__60_carry_1(matrix_multiply_0_n_32),
        .mul0__60_carry_2(B_RAM_n_28),
        .mul0__60_carry_3(matrix_multiply_0_n_12));
  design_1_pl_matmul_0_0_memory_RAM__parameterized0 B_RAM
       (.ACLK(ACLK),
        .A_write_en13_out(A_write_en13_out),
        .CO(matrix_multiply_0_n_10),
        .DI({B_RAM_n_1,B_RAM_n_2,B_RAM_n_3,B_RAM_n_4,B_RAM_n_5,B_RAM_n_6}),
        .DOUTADOUT(A_read_data_out),
        .E(B_read_en),
        .O({matrix_multiply_0_n_13,matrix_multiply_0_n_14,matrix_multiply_0_n_15}),
        .Q({\read_counter_reg_n_0_[9] ,\read_counter_reg_n_0_[8] ,\read_counter_reg_n_0_[7] ,\read_counter_reg_n_0_[6] ,\read_counter_reg_n_0_[3] ,\read_counter_reg_n_0_[2] ,\read_counter_reg_n_0_[1] ,\read_counter_reg_n_0_[0] }),
        .RAM_reg_bram_0(B_RAM_n_25),
        .RAM_reg_bram_0_0(B_RAM_n_28),
        .RAM_reg_bram_0_1(B_RAM_n_45),
        .RAM_reg_bram_0_2(matrix_multiply_0_n_34),
        .S({B_RAM_n_33,B_RAM_n_34,B_RAM_n_35,B_RAM_n_36,B_RAM_n_37}),
        .S_AXIS_TDATA(S_AXIS_TDATA),
        .S_AXIS_TREADY(S_AXIS_TREADY),
        .S_AXIS_TVALID(S_AXIS_TVALID),
        .\dob_reg[1]_0 (B_RAM_n_38),
        .\dob_reg[1]_1 (A_read_address[2:0]),
        .\dob_reg[2]_0 ({B_RAM_n_15,B_RAM_n_16}),
        .\dob_reg[3]_0 ({B_RAM_n_17,B_RAM_n_18,B_RAM_n_19,B_RAM_n_20,B_RAM_n_21,B_RAM_n_22}),
        .\dob_reg[4]_0 ({B_RAM_n_39,B_RAM_n_40,B_RAM_n_41,B_RAM_n_42,B_RAM_n_43}),
        .\dob_reg[4]_1 (B_RAM_n_44),
        .\dob_reg[5]_0 ({B_RAM_n_23,B_RAM_n_24}),
        .\dob_reg[6]_0 (B_RAM_n_27),
        .\dob_reg[6]_1 ({B_RAM_n_46,B_RAM_n_47,B_RAM_n_48,B_RAM_n_49}),
        .\dob_reg[7]_0 (B),
        .\dob_reg[7]_1 (B_RAM_n_26),
        .\dob_reg[7]_2 ({B_RAM_n_29,B_RAM_n_30,B_RAM_n_31,B_RAM_n_32}),
        .mul0__0_carry(A_RAM_n_8),
        .mul0__0_carry_0(A_RAM_n_9),
        .mul0__0_carry_1(A_RAM_n_10),
        .mul0__0_carry_2(A_RAM_n_11),
        .mul0__30_carry(A_RAM_n_16),
        .mul0__30_carry_0(A_RAM_n_17),
        .mul0__30_carry_1(A_RAM_n_18),
        .mul0__30_carry_2(A_RAM_n_19),
        .mul0__60_carry(A_RAM_n_25),
        .mul0__60_carry_0(A_RAM_n_26),
        .mul0__60_carry__0(A_RAM_n_27),
        .mul0__60_carry__0_0(A_RAM_n_28),
        .mul0__60_carry__0_1(A_RAM_n_29),
        .mul0__60_carry__0_2(A_RAM_n_30),
        .mul0__60_carry__0_3(A_RAM_n_31),
        .mul0__60_carry__0_i_1_0(matrix_multiply_0_n_17),
        .mul0__60_carry__0_i_2_0({matrix_multiply_0_n_18,matrix_multiply_0_n_19}),
        .mul0__60_carry__0_i_9_0({matrix_multiply_0_n_11,matrix_multiply_0_n_12}));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(S_AXIS_TVALID),
        .I1(state[3]),
        .I2(\FSM_onehot_state[2]_i_3_n_0 ),
        .I3(S_AXIS_TREADY),
        .O(next_state[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFF08000000)) 
    \FSM_onehot_state[2]_i_3 
       (.I0(\read_counter_reg_n_0_[1] ),
        .I1(\read_counter_reg_n_0_[0] ),
        .I2(\read_counter_reg_n_0_[3] ),
        .I3(\read_counter_reg_n_0_[2] ),
        .I4(\FSM_onehot_state[2]_i_4_n_0 ),
        .I5(S_AXIS_TLAST),
        .O(\FSM_onehot_state[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \FSM_onehot_state[2]_i_4 
       (.I0(\read_counter_reg_n_0_[4] ),
        .I1(\read_counter_reg_n_0_[5] ),
        .I2(\read_counter_reg_n_0_[6] ),
        .I3(\read_counter_reg_n_0_[7] ),
        .I4(\read_counter_reg_n_0_[8] ),
        .I5(\read_counter_reg_n_0_[9] ),
        .O(\FSM_onehot_state[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h4F44)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(S_AXIS_TVALID),
        .I1(state[3]),
        .I2(\FSM_onehot_state[3]_i_2_n_0 ),
        .I3(state[0]),
        .O(next_state[3]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \FSM_onehot_state[3]_i_2 
       (.I0(\write_counter_reg_n_0_[2] ),
        .I1(\write_counter_reg_n_0_[0] ),
        .I2(\write_counter_reg_n_0_[1] ),
        .I3(\write_counter_reg_n_0_[3] ),
        .I4(\write_counter_reg_n_0_[4] ),
        .I5(\write_counter_reg_n_0_[5] ),
        .O(\FSM_onehot_state[3]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "Read_Inputs:0100,Compute:0010,Write_Outputs:0001,Idle:1000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[0] 
       (.C(ACLK),
        .CE(1'b1),
        .D(next_state[0]),
        .Q(state[0]),
        .R(matrix_multiply_0_n_31));
  (* FSM_ENCODED_STATES = "Read_Inputs:0100,Compute:0010,Write_Outputs:0001,Idle:1000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(ACLK),
        .CE(1'b1),
        .D(next_state[1]),
        .Q(state[1]),
        .R(matrix_multiply_0_n_31));
  (* FSM_ENCODED_STATES = "Read_Inputs:0100,Compute:0010,Write_Outputs:0001,Idle:1000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(ACLK),
        .CE(1'b1),
        .D(next_state[2]),
        .Q(S_AXIS_TREADY),
        .R(matrix_multiply_0_n_31));
  (* FSM_ENCODED_STATES = "Read_Inputs:0100,Compute:0010,Write_Outputs:0001,Idle:1000" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[3] 
       (.C(ACLK),
        .CE(1'b1),
        .D(next_state[3]),
        .Q(state[3]),
        .S(matrix_multiply_0_n_31));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    M_AXIS_TLAST_i_1
       (.I0(state[0]),
        .I1(\write_counter_reg_n_0_[5] ),
        .I2(\write_counter_reg_n_0_[4] ),
        .I3(\write_counter_reg_n_0_[3] ),
        .I4(M_AXIS_TLAST_i_2_n_0),
        .I5(\write_counter_reg_n_0_[2] ),
        .O(M_AXIS_TLAST_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h7)) 
    M_AXIS_TLAST_i_2
       (.I0(\write_counter_reg_n_0_[0] ),
        .I1(\write_counter_reg_n_0_[1] ),
        .O(M_AXIS_TLAST_i_2_n_0));
  FDRE M_AXIS_TLAST_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(M_AXIS_TLAST_i_1_n_0),
        .Q(M_AXIS_TLAST),
        .R(1'b0));
  FDRE M_AXIS_TVALID_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(matrix_multiply_0_n_42),
        .Q(M_AXIS_TVALID),
        .R(1'b0));
  design_1_pl_matmul_0_0_memory_RAM__parameterized1 RES_RAM
       (.ACLK(ACLK),
        .E(RES_read_en),
        .M_AXIS_TDATA(M_AXIS_TDATA),
        .Q(addra),
        .RES_write_en(RES_write_en),
        .dia(dia),
        .\dob_reg[0]_0 (\write_counter_reg_n_0_[0] ),
        .\dob_reg[0]_1 (\write_counter_reg_n_0_[1] ),
        .\dob_reg[0]_2 (\write_counter_reg_n_0_[2] ),
        .\dob_reg[0]_3 (\write_counter_reg_n_0_[3] ),
        .\dob_reg[0]_4 (\write_counter_reg_n_0_[4] ),
        .\dob_reg[0]_5 (\write_counter_reg_n_0_[5] ));
  design_1_pl_matmul_0_0_matrix_multiply matrix_multiply_0
       (.ACLK(ACLK),
        .ADDRARDADDR(A_read_address),
        .ARESETN(ARESETN),
        .ARESETN_0(matrix_multiply_0_n_31),
        .CO(matrix_multiply_0_n_10),
        .D(next_state[1:0]),
        .DI({B_RAM_n_1,B_RAM_n_2,B_RAM_n_3,B_RAM_n_4,B_RAM_n_5,B_RAM_n_6,A_RAM_n_15}),
        .DOUTADOUT(A_read_data_out[2:0]),
        .E(B_read_en),
        .\FSM_onehot_state_reg[0]_0 (matrix_multiply_0_n_42),
        .\FSM_onehot_state_reg[0]_1 (\FSM_onehot_state[3]_i_2_n_0 ),
        .\FSM_onehot_state_reg[1]_0 (\FSM_onehot_state[2]_i_3_n_0 ),
        .M_AXIS_TREADY(M_AXIS_TREADY),
        .M_AXIS_TREADY_0(RES_read_en),
        .O({matrix_multiply_0_n_13,matrix_multiply_0_n_14,matrix_multiply_0_n_15,matrix_multiply_0_n_16}),
        .Q({state[3],S_AXIS_TREADY,state[1:0]}),
        .RAM_reg_bram_0_i_3_0({\read_counter_reg_n_0_[9] ,\read_counter_reg_n_0_[8] ,\read_counter_reg_n_0_[7] ,\read_counter_reg_n_0_[6] ,\read_counter_reg_n_0_[5] ,\read_counter_reg_n_0_[4] ,\read_counter_reg_n_0_[3] ,\read_counter_reg_n_0_[2] ,\read_counter_reg_n_0_[1] ,\read_counter_reg_n_0_[0] }),
        .\RES_write_address_reg[5]_0 (addra),
        .RES_write_en(RES_write_en),
        .S({B_RAM_n_33,B_RAM_n_34,B_RAM_n_35,B_RAM_n_36,A_RAM_n_12,A_RAM_n_13,B_RAM_n_37,A_RAM_n_14}),
        .\acc[0]_i_6_0 ({B_RAM_n_27,A_RAM_n_24}),
        .\acc[0]_i_6_1 ({B_RAM_n_45,A_RAM_n_35}),
        .\acc[8]_i_5_0 ({B_RAM_n_29,B_RAM_n_30,B_RAM_n_31,B_RAM_n_32}),
        .\acc[8]_i_5_1 ({A_RAM_n_32,B_RAM_n_46,B_RAM_n_47,B_RAM_n_48,B_RAM_n_49}),
        .dia(dia),
        .\dob_reg[0] (matrix_multiply_0_n_9),
        .\dob_reg[2] ({matrix_multiply_0_n_11,matrix_multiply_0_n_12}),
        .\dob_reg[5] (matrix_multiply_0_n_17),
        .\dob_reg[5]_0 ({matrix_multiply_0_n_18,matrix_multiply_0_n_19}),
        .\dob_reg[6] (matrix_multiply_0_n_32),
        .mul0__60_carry_0(B[7:6]),
        .mul0__60_carry_1(B_RAM_n_26),
        .mul0__60_carry_2(B_RAM_n_25),
        .mul0__60_carry__0_i_15({B_RAM_n_23,B_RAM_n_24}),
        .mul0__60_carry__0_i_15_0({B_RAM_n_44,A_RAM_n_34}),
        .mul0__60_carry_i_13_0({B_RAM_n_17,B_RAM_n_18,B_RAM_n_19,B_RAM_n_20,B_RAM_n_21,B_RAM_n_22,A_RAM_n_23}),
        .mul0__60_carry_i_13_1({B_RAM_n_39,B_RAM_n_40,B_RAM_n_41,B_RAM_n_42,A_RAM_n_20,A_RAM_n_21,B_RAM_n_43,A_RAM_n_22}),
        .mul0__60_carry_i_7({B_RAM_n_15,B_RAM_n_16}),
        .mul0__60_carry_i_7_0({B_RAM_n_38,A_RAM_n_33}),
        .\read_counter_reg[4] (matrix_multiply_0_n_34),
        .write_counter(write_counter));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \read_counter[0]_i_1 
       (.I0(S_AXIS_TREADY),
        .I1(\read_counter_reg_n_0_[0] ),
        .O(\read_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \read_counter[1]_i_1 
       (.I0(\read_counter_reg_n_0_[0] ),
        .I1(S_AXIS_TREADY),
        .I2(\read_counter_reg_n_0_[1] ),
        .O(\read_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \read_counter[2]_i_1 
       (.I0(\read_counter_reg_n_0_[1] ),
        .I1(\read_counter_reg_n_0_[0] ),
        .I2(S_AXIS_TREADY),
        .I3(\read_counter_reg_n_0_[2] ),
        .O(\read_counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \read_counter[3]_i_1 
       (.I0(\read_counter_reg_n_0_[2] ),
        .I1(\read_counter_reg_n_0_[0] ),
        .I2(\read_counter_reg_n_0_[1] ),
        .I3(S_AXIS_TREADY),
        .I4(\read_counter_reg_n_0_[3] ),
        .O(\read_counter[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \read_counter[4]_i_1 
       (.I0(\read_counter_reg_n_0_[3] ),
        .I1(\read_counter_reg_n_0_[1] ),
        .I2(\read_counter_reg_n_0_[0] ),
        .I3(\read_counter_reg_n_0_[2] ),
        .I4(S_AXIS_TREADY),
        .I5(\read_counter_reg_n_0_[4] ),
        .O(\read_counter[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \read_counter[5]_i_1 
       (.I0(\read_counter[5]_i_2_n_0 ),
        .I1(S_AXIS_TREADY),
        .I2(\read_counter_reg_n_0_[5] ),
        .O(\read_counter[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \read_counter[5]_i_2 
       (.I0(\read_counter_reg_n_0_[4] ),
        .I1(\read_counter_reg_n_0_[2] ),
        .I2(\read_counter_reg_n_0_[0] ),
        .I3(\read_counter_reg_n_0_[1] ),
        .I4(\read_counter_reg_n_0_[3] ),
        .O(\read_counter[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \read_counter[6]_i_1 
       (.I0(\read_counter[9]_i_3_n_0 ),
        .I1(S_AXIS_TREADY),
        .I2(\read_counter_reg_n_0_[6] ),
        .O(\read_counter[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \read_counter[7]_i_1 
       (.I0(\read_counter_reg_n_0_[6] ),
        .I1(\read_counter[9]_i_3_n_0 ),
        .I2(S_AXIS_TREADY),
        .I3(\read_counter_reg_n_0_[7] ),
        .O(\read_counter[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \read_counter[8]_i_1 
       (.I0(\read_counter_reg_n_0_[7] ),
        .I1(\read_counter[9]_i_3_n_0 ),
        .I2(\read_counter_reg_n_0_[6] ),
        .I3(S_AXIS_TREADY),
        .I4(\read_counter_reg_n_0_[8] ),
        .O(\read_counter[8]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hF8)) 
    \read_counter[9]_i_1 
       (.I0(S_AXIS_TVALID),
        .I1(S_AXIS_TREADY),
        .I2(state[3]),
        .O(read_counter));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \read_counter[9]_i_2 
       (.I0(\read_counter_reg_n_0_[8] ),
        .I1(\read_counter_reg_n_0_[6] ),
        .I2(\read_counter[9]_i_3_n_0 ),
        .I3(\read_counter_reg_n_0_[7] ),
        .I4(S_AXIS_TREADY),
        .I5(\read_counter_reg_n_0_[9] ),
        .O(\read_counter[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \read_counter[9]_i_3 
       (.I0(\read_counter_reg_n_0_[5] ),
        .I1(\read_counter_reg_n_0_[3] ),
        .I2(\read_counter_reg_n_0_[1] ),
        .I3(\read_counter_reg_n_0_[0] ),
        .I4(\read_counter_reg_n_0_[2] ),
        .I5(\read_counter_reg_n_0_[4] ),
        .O(\read_counter[9]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \read_counter_reg[0] 
       (.C(ACLK),
        .CE(read_counter),
        .D(\read_counter[0]_i_1_n_0 ),
        .Q(\read_counter_reg_n_0_[0] ),
        .R(matrix_multiply_0_n_31));
  FDRE #(
    .INIT(1'b0)) 
    \read_counter_reg[1] 
       (.C(ACLK),
        .CE(read_counter),
        .D(\read_counter[1]_i_1_n_0 ),
        .Q(\read_counter_reg_n_0_[1] ),
        .R(matrix_multiply_0_n_31));
  FDRE #(
    .INIT(1'b0)) 
    \read_counter_reg[2] 
       (.C(ACLK),
        .CE(read_counter),
        .D(\read_counter[2]_i_1_n_0 ),
        .Q(\read_counter_reg_n_0_[2] ),
        .R(matrix_multiply_0_n_31));
  FDRE #(
    .INIT(1'b0)) 
    \read_counter_reg[3] 
       (.C(ACLK),
        .CE(read_counter),
        .D(\read_counter[3]_i_1_n_0 ),
        .Q(\read_counter_reg_n_0_[3] ),
        .R(matrix_multiply_0_n_31));
  FDRE #(
    .INIT(1'b0)) 
    \read_counter_reg[4] 
       (.C(ACLK),
        .CE(read_counter),
        .D(\read_counter[4]_i_1_n_0 ),
        .Q(\read_counter_reg_n_0_[4] ),
        .R(matrix_multiply_0_n_31));
  FDRE #(
    .INIT(1'b0)) 
    \read_counter_reg[5] 
       (.C(ACLK),
        .CE(read_counter),
        .D(\read_counter[5]_i_1_n_0 ),
        .Q(\read_counter_reg_n_0_[5] ),
        .R(matrix_multiply_0_n_31));
  FDRE #(
    .INIT(1'b0)) 
    \read_counter_reg[6] 
       (.C(ACLK),
        .CE(read_counter),
        .D(\read_counter[6]_i_1_n_0 ),
        .Q(\read_counter_reg_n_0_[6] ),
        .R(matrix_multiply_0_n_31));
  FDRE #(
    .INIT(1'b0)) 
    \read_counter_reg[7] 
       (.C(ACLK),
        .CE(read_counter),
        .D(\read_counter[7]_i_1_n_0 ),
        .Q(\read_counter_reg_n_0_[7] ),
        .R(matrix_multiply_0_n_31));
  FDRE #(
    .INIT(1'b0)) 
    \read_counter_reg[8] 
       (.C(ACLK),
        .CE(read_counter),
        .D(\read_counter[8]_i_1_n_0 ),
        .Q(\read_counter_reg_n_0_[8] ),
        .R(matrix_multiply_0_n_31));
  FDRE #(
    .INIT(1'b0)) 
    \read_counter_reg[9] 
       (.C(ACLK),
        .CE(read_counter),
        .D(\read_counter[9]_i_2_n_0 ),
        .Q(\read_counter_reg_n_0_[9] ),
        .R(matrix_multiply_0_n_31));
  LUT3 #(
    .INIT(8'h0E)) 
    \write_counter[0]_i_2 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(\write_counter_reg_n_0_[0] ),
        .O(\write_counter[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h0EE0)) 
    \write_counter[1]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(\write_counter_reg_n_0_[0] ),
        .I3(\write_counter_reg_n_0_[1] ),
        .O(\write_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h0EEEE000)) 
    \write_counter[2]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(\write_counter_reg_n_0_[1] ),
        .I3(\write_counter_reg_n_0_[0] ),
        .I4(\write_counter_reg_n_0_[2] ),
        .O(\write_counter[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7F7F7F0080808000)) 
    \write_counter[3]_i_1 
       (.I0(\write_counter_reg_n_0_[2] ),
        .I1(\write_counter_reg_n_0_[0] ),
        .I2(\write_counter_reg_n_0_[1] ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\write_counter_reg_n_0_[3] ),
        .O(\write_counter[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \write_counter[4]_i_1 
       (.I0(\write_counter_reg_n_0_[3] ),
        .I1(\write_counter_reg_n_0_[1] ),
        .I2(\write_counter_reg_n_0_[0] ),
        .I3(\write_counter_reg_n_0_[2] ),
        .I4(\write_counter[4]_i_2_n_0 ),
        .I5(\write_counter_reg_n_0_[4] ),
        .O(\write_counter[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \write_counter[4]_i_2 
       (.I0(state[0]),
        .I1(state[1]),
        .O(\write_counter[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h77708880)) 
    \write_counter[5]_i_1 
       (.I0(\write_counter_reg_n_0_[4] ),
        .I1(\write_counter[5]_i_2_n_0 ),
        .I2(state[1]),
        .I3(state[0]),
        .I4(\write_counter_reg_n_0_[5] ),
        .O(\write_counter[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \write_counter[5]_i_2 
       (.I0(\write_counter_reg_n_0_[3] ),
        .I1(\write_counter_reg_n_0_[1] ),
        .I2(\write_counter_reg_n_0_[0] ),
        .I3(\write_counter_reg_n_0_[2] ),
        .O(\write_counter[5]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_counter_reg[0] 
       (.C(ACLK),
        .CE(write_counter),
        .D(\write_counter[0]_i_2_n_0 ),
        .Q(\write_counter_reg_n_0_[0] ),
        .R(matrix_multiply_0_n_31));
  FDRE #(
    .INIT(1'b0)) 
    \write_counter_reg[1] 
       (.C(ACLK),
        .CE(write_counter),
        .D(\write_counter[1]_i_1_n_0 ),
        .Q(\write_counter_reg_n_0_[1] ),
        .R(matrix_multiply_0_n_31));
  FDRE #(
    .INIT(1'b0)) 
    \write_counter_reg[2] 
       (.C(ACLK),
        .CE(write_counter),
        .D(\write_counter[2]_i_1_n_0 ),
        .Q(\write_counter_reg_n_0_[2] ),
        .R(matrix_multiply_0_n_31));
  FDRE #(
    .INIT(1'b0)) 
    \write_counter_reg[3] 
       (.C(ACLK),
        .CE(write_counter),
        .D(\write_counter[3]_i_1_n_0 ),
        .Q(\write_counter_reg_n_0_[3] ),
        .R(matrix_multiply_0_n_31));
  FDRE #(
    .INIT(1'b0)) 
    \write_counter_reg[4] 
       (.C(ACLK),
        .CE(write_counter),
        .D(\write_counter[4]_i_1_n_0 ),
        .Q(\write_counter_reg_n_0_[4] ),
        .R(matrix_multiply_0_n_31));
  FDRE #(
    .INIT(1'b0)) 
    \write_counter_reg[5] 
       (.C(ACLK),
        .CE(write_counter),
        .D(\write_counter[5]_i_1_n_0 ),
        .Q(\write_counter_reg_n_0_[5] ),
        .R(matrix_multiply_0_n_31));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
