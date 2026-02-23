-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
-- Date        : Mon Feb 23 16:52:17 2026
-- Host        : leeeyG14 running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/leeey/Downloads/ee4218-labs/lab3/hardware/fifo_matmul_platform/fifo_matmul_platform.gen/sources_1/bd/design_1/ip/design_1_pl_matmul_0_0/design_1_pl_matmul_0_0_sim_netlist.vhdl
-- Design      : design_1_pl_matmul_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xck26-sfvc784-2LV-c
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_pl_matmul_0_0_matrix_multiply is
  port (
    RES_write_en : out STD_LOGIC;
    dia : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \dob_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    \dob_reg[2]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dob_reg[5]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \dob_reg[5]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ADDRARDADDR : out STD_LOGIC_VECTOR ( 8 downto 0 );
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ARESETN_0 : out STD_LOGIC;
    \dob_reg[6]\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \read_counter_reg[4]\ : out STD_LOGIC;
    \RES_write_address_reg[5]_0\ : out STD_LOGIC_VECTOR ( 5 downto 0 );
    write_counter : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_onehot_state_reg[0]_0\ : out STD_LOGIC;
    M_AXIS_TREADY_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    ACLK : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \mul0__60_carry_i_7\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \mul0__60_carry_i_7_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \mul0__60_carry_i_13_0\ : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \mul0__60_carry_i_13_1\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \mul0__60_carry__0_i_15\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \mul0__60_carry__0_i_15_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \acc[0]_i_6_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \acc[0]_i_6_1\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \acc[8]_i_5_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \acc[8]_i_5_1\ : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \FSM_onehot_state_reg[0]_1\ : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    \mul0__60_carry_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DOUTADOUT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \mul0__60_carry_1\ : in STD_LOGIC;
    RAM_reg_bram_0_i_3_0 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    M_AXIS_TREADY : in STD_LOGIC;
    \FSM_onehot_state_reg[1]_0\ : in STD_LOGIC;
    \mul0__60_carry_2\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_pl_matmul_0_0_matrix_multiply : entity is "matrix_multiply";
end design_1_pl_matmul_0_0_matrix_multiply;

architecture STRUCTURE of design_1_pl_matmul_0_0_matrix_multiply is
  signal \^addrardaddr\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \^aresetn_0\ : STD_LOGIC;
  signal Done : STD_LOGIC;
  signal Done_i_1_n_0 : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \^o\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal RAM_reg_bram_0_i_5_n_0 : STD_LOGIC;
  signal RAM_reg_bram_0_i_6_n_0 : STD_LOGIC;
  signal RES_write_address0 : STD_LOGIC;
  signal \RES_write_address[5]_i_1_n_0\ : STD_LOGIC;
  signal \^res_write_address_reg[5]_0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \^res_write_en\ : STD_LOGIC;
  signal RES_write_en0 : STD_LOGIC;
  signal \Start__20\ : STD_LOGIC;
  signal \__10\ : STD_LOGIC;
  signal acc : STD_LOGIC_VECTOR ( 0 to 0 );
  signal acc0 : STD_LOGIC;
  signal \acc[0]_i_10_n_0\ : STD_LOGIC;
  signal \acc[0]_i_11_n_0\ : STD_LOGIC;
  signal \acc[0]_i_12_n_0\ : STD_LOGIC;
  signal \acc[0]_i_13_n_0\ : STD_LOGIC;
  signal \acc[0]_i_14_n_0\ : STD_LOGIC;
  signal \acc[0]_i_15_n_0\ : STD_LOGIC;
  signal \acc[0]_i_16_n_0\ : STD_LOGIC;
  signal \acc[0]_i_17_n_0\ : STD_LOGIC;
  signal \acc[0]_i_2_n_0\ : STD_LOGIC;
  signal \acc[0]_i_3_n_0\ : STD_LOGIC;
  signal \acc[0]_i_4_n_0\ : STD_LOGIC;
  signal \acc[0]_i_5_n_0\ : STD_LOGIC;
  signal \acc[0]_i_6_n_0\ : STD_LOGIC;
  signal \acc[0]_i_7_n_0\ : STD_LOGIC;
  signal \acc[0]_i_8_n_0\ : STD_LOGIC;
  signal \acc[0]_i_9_n_0\ : STD_LOGIC;
  signal \acc[8]_i_10_n_0\ : STD_LOGIC;
  signal \acc[8]_i_11_n_0\ : STD_LOGIC;
  signal \acc[8]_i_12_n_0\ : STD_LOGIC;
  signal \acc[8]_i_13_n_0\ : STD_LOGIC;
  signal \acc[8]_i_14_n_0\ : STD_LOGIC;
  signal \acc[8]_i_15_n_0\ : STD_LOGIC;
  signal \acc[8]_i_16_n_0\ : STD_LOGIC;
  signal \acc[8]_i_2_n_0\ : STD_LOGIC;
  signal \acc[8]_i_3_n_0\ : STD_LOGIC;
  signal \acc[8]_i_4_n_0\ : STD_LOGIC;
  signal \acc[8]_i_5_n_0\ : STD_LOGIC;
  signal \acc[8]_i_6_n_0\ : STD_LOGIC;
  signal \acc[8]_i_7_n_0\ : STD_LOGIC;
  signal \acc[8]_i_8_n_0\ : STD_LOGIC;
  signal \acc[8]_i_9_n_0\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_10\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_11\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_12\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_13\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_14\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_15\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_8\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_9\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_10\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_11\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_12\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_8\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_9\ : STD_LOGIC;
  signal \acc_reg_n_0_[0]\ : STD_LOGIC;
  signal \acc_reg_n_0_[1]\ : STD_LOGIC;
  signal \acc_reg_n_0_[2]\ : STD_LOGIC;
  signal \acc_reg_n_0_[3]\ : STD_LOGIC;
  signal \acc_reg_n_0_[4]\ : STD_LOGIC;
  signal \acc_reg_n_0_[5]\ : STD_LOGIC;
  signal \acc_reg_n_0_[6]\ : STD_LOGIC;
  signal \acc_reg_n_0_[7]\ : STD_LOGIC;
  signal \^dia\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^dob_reg[0]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^dob_reg[6]\ : STD_LOGIC;
  signal first_mac_cycle_i_1_n_0 : STD_LOGIC;
  signal first_mac_cycle_reg_n_0 : STD_LOGIC;
  signal last_mac_cycle28_in : STD_LOGIC;
  signal last_mac_cycle_i_1_n_0 : STD_LOGIC;
  signal last_mac_cycle_reg_n_0 : STD_LOGIC;
  signal \m_counter0__1\ : STD_LOGIC;
  signal \m_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \m_counter[1]_i_1_n_0\ : STD_LOGIC;
  signal \m_counter[2]_i_1_n_0\ : STD_LOGIC;
  signal \m_counter[3]_i_1_n_0\ : STD_LOGIC;
  signal \m_counter[4]_i_1_n_0\ : STD_LOGIC;
  signal \m_counter[5]_i_1_n_0\ : STD_LOGIC;
  signal \m_counter[5]_i_2_n_0\ : STD_LOGIC;
  signal \m_counter[5]_i_3_n_0\ : STD_LOGIC;
  signal \m_counter[5]_i_4_n_0\ : STD_LOGIC;
  signal mul0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \mul0__0_carry__0_n_7\ : STD_LOGIC;
  signal \mul0__0_carry_n_0\ : STD_LOGIC;
  signal \mul0__0_carry_n_1\ : STD_LOGIC;
  signal \mul0__0_carry_n_10\ : STD_LOGIC;
  signal \mul0__0_carry_n_11\ : STD_LOGIC;
  signal \mul0__0_carry_n_12\ : STD_LOGIC;
  signal \mul0__0_carry_n_2\ : STD_LOGIC;
  signal \mul0__0_carry_n_3\ : STD_LOGIC;
  signal \mul0__0_carry_n_4\ : STD_LOGIC;
  signal \mul0__0_carry_n_5\ : STD_LOGIC;
  signal \mul0__0_carry_n_6\ : STD_LOGIC;
  signal \mul0__0_carry_n_7\ : STD_LOGIC;
  signal \mul0__0_carry_n_8\ : STD_LOGIC;
  signal \mul0__30_carry__0_n_7\ : STD_LOGIC;
  signal \mul0__30_carry_n_0\ : STD_LOGIC;
  signal \mul0__30_carry_n_1\ : STD_LOGIC;
  signal \mul0__30_carry_n_11\ : STD_LOGIC;
  signal \mul0__30_carry_n_13\ : STD_LOGIC;
  signal \mul0__30_carry_n_14\ : STD_LOGIC;
  signal \mul0__30_carry_n_15\ : STD_LOGIC;
  signal \mul0__30_carry_n_2\ : STD_LOGIC;
  signal \mul0__30_carry_n_3\ : STD_LOGIC;
  signal \mul0__30_carry_n_4\ : STD_LOGIC;
  signal \mul0__30_carry_n_5\ : STD_LOGIC;
  signal \mul0__30_carry_n_6\ : STD_LOGIC;
  signal \mul0__30_carry_n_7\ : STD_LOGIC;
  signal \mul0__60_carry__0_n_4\ : STD_LOGIC;
  signal \mul0__60_carry__0_n_5\ : STD_LOGIC;
  signal \mul0__60_carry__0_n_6\ : STD_LOGIC;
  signal \mul0__60_carry__0_n_7\ : STD_LOGIC;
  signal \mul0__60_carry_i_10_n_0\ : STD_LOGIC;
  signal \mul0__60_carry_i_11_n_0\ : STD_LOGIC;
  signal \mul0__60_carry_i_12_n_0\ : STD_LOGIC;
  signal \mul0__60_carry_i_13_n_0\ : STD_LOGIC;
  signal \mul0__60_carry_i_2_n_0\ : STD_LOGIC;
  signal \mul0__60_carry_i_4_n_0\ : STD_LOGIC;
  signal \mul0__60_carry_i_5_n_0\ : STD_LOGIC;
  signal \mul0__60_carry_i_8_n_0\ : STD_LOGIC;
  signal \mul0__60_carry_i_9_n_0\ : STD_LOGIC;
  signal \mul0__60_carry_n_0\ : STD_LOGIC;
  signal \mul0__60_carry_n_1\ : STD_LOGIC;
  signal \mul0__60_carry_n_2\ : STD_LOGIC;
  signal \mul0__60_carry_n_3\ : STD_LOGIC;
  signal \mul0__60_carry_n_4\ : STD_LOGIC;
  signal \mul0__60_carry_n_5\ : STD_LOGIC;
  signal \mul0__60_carry_n_6\ : STD_LOGIC;
  signal \mul0__60_carry_n_7\ : STD_LOGIC;
  signal \n_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \n_counter[1]_i_1_n_0\ : STD_LOGIC;
  signal \n_counter[2]_i_2_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \^read_counter_reg[4]\ : STD_LOGIC;
  signal \NLW_acc_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_mul0__0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_mul0__0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_mul0__30_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_mul0__30_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_mul0__60_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal \NLW_mul0__60_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 5 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[0]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \FSM_onehot_state[1]_i_1__0\ : label is "soft_lutpair24";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "Idle:01,MAC:10,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "Idle:01,MAC:10,";
  attribute SOFT_HLUTNM of M_AXIS_TVALID_i_1 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_1 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_6 : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \RES_write_address[1]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \RES_write_address[2]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \RES_write_address[3]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \RES_write_address[4]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of RES_write_en_i_1 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \dob[7]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of first_mac_cycle_i_1 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of last_mac_cycle_i_2 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \m_counter[0]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \m_counter[1]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \m_counter[2]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \m_counter[3]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \m_counter[5]_i_2\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \m_counter[5]_i_3\ : label is "soft_lutpair23";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \mul0__60_carry\ : label is 35;
  attribute ADDER_THRESHOLD of \mul0__60_carry__0\ : label is 35;
  attribute SOFT_HLUTNM of \n_counter[0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \n_counter[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \write_counter[0]_i_1\ : label is "soft_lutpair19";
begin
  ADDRARDADDR(8 downto 0) <= \^addrardaddr\(8 downto 0);
  ARESETN_0 <= \^aresetn_0\;
  O(3 downto 0) <= \^o\(3 downto 0);
  \RES_write_address_reg[5]_0\(5 downto 0) <= \^res_write_address_reg[5]_0\(5 downto 0);
  RES_write_en <= \^res_write_en\;
  dia(7 downto 0) <= \^dia\(7 downto 0);
  \dob_reg[0]\(0) <= \^dob_reg[0]\(0);
  \dob_reg[6]\ <= \^dob_reg[6]\;
  \read_counter_reg[4]\ <= \^read_counter_reg[4]\;
Done_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D5FFC000"
    )
        port map (
      I0 => acc0,
      I1 => acc(0),
      I2 => last_mac_cycle_reg_n_0,
      I3 => ARESETN,
      I4 => Done,
      O => Done_i_1_n_0
    );
Done_reg: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => '1',
      D => Done_i_1_n_0,
      Q => Done,
      R => '0'
    );
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => Q(0),
      I1 => \FSM_onehot_state_reg[0]_1\,
      I2 => Done,
      I3 => Q(1),
      O => D(0)
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => acc(0),
      I1 => last_mac_cycle_reg_n_0,
      I2 => acc0,
      I3 => \Start__20\,
      O => \FSM_onehot_state[1]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => \FSM_onehot_state_reg[1]_0\,
      I1 => Q(2),
      I2 => Done,
      I3 => Q(1),
      O => D(1)
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ARESETN,
      O => \^aresetn_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => ACLK,
      CE => \FSM_onehot_state[1]_i_1_n_0\,
      D => acc(0),
      Q => acc0,
      S => \^aresetn_0\
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \FSM_onehot_state[1]_i_1_n_0\,
      D => acc0,
      Q => acc(0),
      R => \^aresetn_0\
    );
M_AXIS_TVALID_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => Q(0),
      I1 => Done,
      I2 => Q(1),
      O => \FSM_onehot_state_reg[0]_0\
    );
RAM_reg_bram_0_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => \Start__20\,
      I1 => acc0,
      I2 => acc(0),
      O => E(0)
    );
RAM_reg_bram_0_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000004000000000"
    )
        port map (
      I0 => RAM_reg_bram_0_i_3_0(6),
      I1 => RAM_reg_bram_0_i_5_n_0,
      I2 => RAM_reg_bram_0_i_6_n_0,
      I3 => RAM_reg_bram_0_i_3_0(8),
      I4 => RAM_reg_bram_0_i_3_0(7),
      I5 => \^read_counter_reg[4]\,
      O => \Start__20\
    );
RAM_reg_bram_0_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2300000000000000"
    )
        port map (
      I0 => RAM_reg_bram_0_i_3_0(4),
      I1 => RAM_reg_bram_0_i_3_0(5),
      I2 => RAM_reg_bram_0_i_3_0(3),
      I3 => RAM_reg_bram_0_i_3_0(0),
      I4 => RAM_reg_bram_0_i_3_0(1),
      I5 => RAM_reg_bram_0_i_3_0(2),
      O => RAM_reg_bram_0_i_5_n_0
    );
RAM_reg_bram_0_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RAM_reg_bram_0_i_3_0(9),
      I1 => Q(2),
      O => RAM_reg_bram_0_i_6_n_0
    );
RAM_reg_bram_0_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => RAM_reg_bram_0_i_3_0(4),
      I1 => RAM_reg_bram_0_i_3_0(5),
      O => \^read_counter_reg[4]\
    );
\RES_write_address[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^res_write_address_reg[5]_0\(0),
      O => p_0_in(0)
    );
\RES_write_address[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^res_write_address_reg[5]_0\(0),
      I1 => \^res_write_address_reg[5]_0\(1),
      O => p_0_in(1)
    );
\RES_write_address[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^res_write_address_reg[5]_0\(0),
      I1 => \^res_write_address_reg[5]_0\(1),
      I2 => \^res_write_address_reg[5]_0\(2),
      O => p_0_in(2)
    );
\RES_write_address[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^res_write_address_reg[5]_0\(1),
      I1 => \^res_write_address_reg[5]_0\(0),
      I2 => \^res_write_address_reg[5]_0\(2),
      I3 => \^res_write_address_reg[5]_0\(3),
      O => p_0_in(3)
    );
\RES_write_address[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^res_write_address_reg[5]_0\(2),
      I1 => \^res_write_address_reg[5]_0\(0),
      I2 => \^res_write_address_reg[5]_0\(1),
      I3 => \^res_write_address_reg[5]_0\(3),
      I4 => \^res_write_address_reg[5]_0\(4),
      O => p_0_in(4)
    );
\RES_write_address[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => acc0,
      I1 => \^res_write_en\,
      I2 => acc(0),
      O => \RES_write_address[5]_i_1_n_0\
    );
\RES_write_address[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => acc(0),
      I1 => \^res_write_en\,
      O => RES_write_address0
    );
\RES_write_address[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^res_write_address_reg[5]_0\(3),
      I1 => \^res_write_address_reg[5]_0\(1),
      I2 => \^res_write_address_reg[5]_0\(0),
      I3 => \^res_write_address_reg[5]_0\(2),
      I4 => \^res_write_address_reg[5]_0\(4),
      I5 => \^res_write_address_reg[5]_0\(5),
      O => p_0_in(5)
    );
\RES_write_address_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => RES_write_address0,
      D => p_0_in(0),
      Q => \^res_write_address_reg[5]_0\(0),
      R => \RES_write_address[5]_i_1_n_0\
    );
\RES_write_address_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => RES_write_address0,
      D => p_0_in(1),
      Q => \^res_write_address_reg[5]_0\(1),
      R => \RES_write_address[5]_i_1_n_0\
    );
\RES_write_address_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => RES_write_address0,
      D => p_0_in(2),
      Q => \^res_write_address_reg[5]_0\(2),
      R => \RES_write_address[5]_i_1_n_0\
    );
\RES_write_address_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => RES_write_address0,
      D => p_0_in(3),
      Q => \^res_write_address_reg[5]_0\(3),
      R => \RES_write_address[5]_i_1_n_0\
    );
\RES_write_address_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => RES_write_address0,
      D => p_0_in(4),
      Q => \^res_write_address_reg[5]_0\(4),
      R => \RES_write_address[5]_i_1_n_0\
    );
\RES_write_address_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => RES_write_address0,
      D => p_0_in(5),
      Q => \^res_write_address_reg[5]_0\(5),
      R => \RES_write_address[5]_i_1_n_0\
    );
RES_write_en_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => first_mac_cycle_reg_n_0,
      I1 => \^addrardaddr\(0),
      I2 => \^addrardaddr\(1),
      I3 => \^addrardaddr\(2),
      I4 => acc(0),
      O => RES_write_en0
    );
RES_write_en_reg: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => '1',
      D => RES_write_en0,
      Q => \^res_write_en\,
      R => '0'
    );
\acc[0]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(7),
      I3 => \^res_write_en\,
      I4 => \acc_reg_n_0_[7]\,
      O => \acc[0]_i_10_n_0\
    );
\acc[0]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(6),
      I3 => \^res_write_en\,
      I4 => \acc_reg_n_0_[6]\,
      O => \acc[0]_i_11_n_0\
    );
\acc[0]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(5),
      I3 => \^res_write_en\,
      I4 => \acc_reg_n_0_[5]\,
      O => \acc[0]_i_12_n_0\
    );
\acc[0]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(4),
      I3 => \^res_write_en\,
      I4 => \acc_reg_n_0_[4]\,
      O => \acc[0]_i_13_n_0\
    );
\acc[0]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(3),
      I3 => \^res_write_en\,
      I4 => \acc_reg_n_0_[3]\,
      O => \acc[0]_i_14_n_0\
    );
\acc[0]_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(2),
      I3 => \^res_write_en\,
      I4 => \acc_reg_n_0_[2]\,
      O => \acc[0]_i_15_n_0\
    );
\acc[0]_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(1),
      I3 => \^res_write_en\,
      I4 => \acc_reg_n_0_[1]\,
      O => \acc[0]_i_16_n_0\
    );
\acc[0]_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(0),
      I3 => \^res_write_en\,
      I4 => \acc_reg_n_0_[0]\,
      O => \acc[0]_i_17_n_0\
    );
\acc[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(7),
      O => \acc[0]_i_2_n_0\
    );
\acc[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(6),
      O => \acc[0]_i_3_n_0\
    );
\acc[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(5),
      O => \acc[0]_i_4_n_0\
    );
\acc[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(4),
      O => \acc[0]_i_5_n_0\
    );
\acc[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(3),
      O => \acc[0]_i_6_n_0\
    );
\acc[0]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(2),
      O => \acc[0]_i_7_n_0\
    );
\acc[0]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(1),
      O => \acc[0]_i_8_n_0\
    );
\acc[0]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(0),
      O => \acc[0]_i_9_n_0\
    );
\acc[8]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(14),
      I3 => \^res_write_en\,
      I4 => \^dia\(6),
      O => \acc[8]_i_10_n_0\
    );
\acc[8]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(13),
      I3 => \^res_write_en\,
      I4 => \^dia\(5),
      O => \acc[8]_i_11_n_0\
    );
\acc[8]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(12),
      I3 => \^res_write_en\,
      I4 => \^dia\(4),
      O => \acc[8]_i_12_n_0\
    );
\acc[8]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(11),
      I3 => \^res_write_en\,
      I4 => \^dia\(3),
      O => \acc[8]_i_13_n_0\
    );
\acc[8]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(10),
      I3 => \^res_write_en\,
      I4 => \^dia\(2),
      O => \acc[8]_i_14_n_0\
    );
\acc[8]_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(9),
      I3 => \^res_write_en\,
      I4 => \^dia\(1),
      O => \acc[8]_i_15_n_0\
    );
\acc[8]_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(8),
      I3 => \^res_write_en\,
      I4 => \^dia\(0),
      O => \acc[8]_i_16_n_0\
    );
\acc[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(14),
      O => \acc[8]_i_2_n_0\
    );
\acc[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(13),
      O => \acc[8]_i_3_n_0\
    );
\acc[8]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(12),
      O => \acc[8]_i_4_n_0\
    );
\acc[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(11),
      O => \acc[8]_i_5_n_0\
    );
\acc[8]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(10),
      O => \acc[8]_i_6_n_0\
    );
\acc[8]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(9),
      O => \acc[8]_i_7_n_0\
    );
\acc[8]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(8),
      O => \acc[8]_i_8_n_0\
    );
\acc[8]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20DF2020"
    )
        port map (
      I0 => acc(0),
      I1 => \Start__20\,
      I2 => mul0(15),
      I3 => \^res_write_en\,
      I4 => \^dia\(7),
      O => \acc[8]_i_9_n_0\
    );
\acc_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[0]_i_1_n_15\,
      Q => \acc_reg_n_0_[0]\,
      R => acc0
    );
\acc_reg[0]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \acc_reg[0]_i_1_n_0\,
      CO(6) => \acc_reg[0]_i_1_n_1\,
      CO(5) => \acc_reg[0]_i_1_n_2\,
      CO(4) => \acc_reg[0]_i_1_n_3\,
      CO(3) => \acc_reg[0]_i_1_n_4\,
      CO(2) => \acc_reg[0]_i_1_n_5\,
      CO(1) => \acc_reg[0]_i_1_n_6\,
      CO(0) => \acc_reg[0]_i_1_n_7\,
      DI(7) => \acc[0]_i_2_n_0\,
      DI(6) => \acc[0]_i_3_n_0\,
      DI(5) => \acc[0]_i_4_n_0\,
      DI(4) => \acc[0]_i_5_n_0\,
      DI(3) => \acc[0]_i_6_n_0\,
      DI(2) => \acc[0]_i_7_n_0\,
      DI(1) => \acc[0]_i_8_n_0\,
      DI(0) => \acc[0]_i_9_n_0\,
      O(7) => \acc_reg[0]_i_1_n_8\,
      O(6) => \acc_reg[0]_i_1_n_9\,
      O(5) => \acc_reg[0]_i_1_n_10\,
      O(4) => \acc_reg[0]_i_1_n_11\,
      O(3) => \acc_reg[0]_i_1_n_12\,
      O(2) => \acc_reg[0]_i_1_n_13\,
      O(1) => \acc_reg[0]_i_1_n_14\,
      O(0) => \acc_reg[0]_i_1_n_15\,
      S(7) => \acc[0]_i_10_n_0\,
      S(6) => \acc[0]_i_11_n_0\,
      S(5) => \acc[0]_i_12_n_0\,
      S(4) => \acc[0]_i_13_n_0\,
      S(3) => \acc[0]_i_14_n_0\,
      S(2) => \acc[0]_i_15_n_0\,
      S(1) => \acc[0]_i_16_n_0\,
      S(0) => \acc[0]_i_17_n_0\
    );
\acc_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[8]_i_1_n_13\,
      Q => \^dia\(2),
      R => acc0
    );
\acc_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[8]_i_1_n_12\,
      Q => \^dia\(3),
      R => acc0
    );
\acc_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[8]_i_1_n_11\,
      Q => \^dia\(4),
      R => acc0
    );
\acc_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[8]_i_1_n_10\,
      Q => \^dia\(5),
      R => acc0
    );
\acc_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[8]_i_1_n_9\,
      Q => \^dia\(6),
      R => acc0
    );
\acc_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[8]_i_1_n_8\,
      Q => \^dia\(7),
      R => acc0
    );
\acc_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[0]_i_1_n_14\,
      Q => \acc_reg_n_0_[1]\,
      R => acc0
    );
\acc_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[0]_i_1_n_13\,
      Q => \acc_reg_n_0_[2]\,
      R => acc0
    );
\acc_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[0]_i_1_n_12\,
      Q => \acc_reg_n_0_[3]\,
      R => acc0
    );
\acc_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[0]_i_1_n_11\,
      Q => \acc_reg_n_0_[4]\,
      R => acc0
    );
\acc_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[0]_i_1_n_10\,
      Q => \acc_reg_n_0_[5]\,
      R => acc0
    );
\acc_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[0]_i_1_n_9\,
      Q => \acc_reg_n_0_[6]\,
      R => acc0
    );
\acc_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[0]_i_1_n_8\,
      Q => \acc_reg_n_0_[7]\,
      R => acc0
    );
\acc_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[8]_i_1_n_15\,
      Q => \^dia\(0),
      R => acc0
    );
\acc_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \acc_reg[0]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_acc_reg[8]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \acc_reg[8]_i_1_n_1\,
      CO(5) => \acc_reg[8]_i_1_n_2\,
      CO(4) => \acc_reg[8]_i_1_n_3\,
      CO(3) => \acc_reg[8]_i_1_n_4\,
      CO(2) => \acc_reg[8]_i_1_n_5\,
      CO(1) => \acc_reg[8]_i_1_n_6\,
      CO(0) => \acc_reg[8]_i_1_n_7\,
      DI(7) => '0',
      DI(6) => \acc[8]_i_2_n_0\,
      DI(5) => \acc[8]_i_3_n_0\,
      DI(4) => \acc[8]_i_4_n_0\,
      DI(3) => \acc[8]_i_5_n_0\,
      DI(2) => \acc[8]_i_6_n_0\,
      DI(1) => \acc[8]_i_7_n_0\,
      DI(0) => \acc[8]_i_8_n_0\,
      O(7) => \acc_reg[8]_i_1_n_8\,
      O(6) => \acc_reg[8]_i_1_n_9\,
      O(5) => \acc_reg[8]_i_1_n_10\,
      O(4) => \acc_reg[8]_i_1_n_11\,
      O(3) => \acc_reg[8]_i_1_n_12\,
      O(2) => \acc_reg[8]_i_1_n_13\,
      O(1) => \acc_reg[8]_i_1_n_14\,
      O(0) => \acc_reg[8]_i_1_n_15\,
      S(7) => \acc[8]_i_9_n_0\,
      S(6) => \acc[8]_i_10_n_0\,
      S(5) => \acc[8]_i_11_n_0\,
      S(4) => \acc[8]_i_12_n_0\,
      S(3) => \acc[8]_i_13_n_0\,
      S(2) => \acc[8]_i_14_n_0\,
      S(1) => \acc[8]_i_15_n_0\,
      S(0) => \acc[8]_i_16_n_0\
    );
\acc_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => acc(0),
      D => \acc_reg[8]_i_1_n_14\,
      Q => \^dia\(1),
      R => acc0
    );
\dob[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => M_AXIS_TREADY,
      I1 => Q(0),
      I2 => Done,
      I3 => Q(1),
      O => M_AXIS_TREADY_0(0)
    );
first_mac_cycle_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA0CCCCC"
    )
        port map (
      I0 => \Start__20\,
      I1 => first_mac_cycle_reg_n_0,
      I2 => acc(0),
      I3 => acc0,
      I4 => ARESETN,
      O => first_mac_cycle_i_1_n_0
    );
first_mac_cycle_reg: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => '1',
      D => first_mac_cycle_i_1_n_0,
      Q => first_mac_cycle_reg_n_0,
      R => '0'
    );
last_mac_cycle_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"46020202AAAAAAAA"
    )
        port map (
      I0 => last_mac_cycle_reg_n_0,
      I1 => acc(0),
      I2 => acc0,
      I3 => \m_counter0__1\,
      I4 => last_mac_cycle28_in,
      I5 => ARESETN,
      O => last_mac_cycle_i_1_n_0
    );
last_mac_cycle_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^addrardaddr\(2),
      I1 => \^addrardaddr\(1),
      I2 => \^addrardaddr\(0),
      O => \m_counter0__1\
    );
last_mac_cycle_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^addrardaddr\(5),
      I1 => \^addrardaddr\(6),
      I2 => \^addrardaddr\(3),
      I3 => \^addrardaddr\(4),
      I4 => \^addrardaddr\(8),
      I5 => \^addrardaddr\(7),
      O => last_mac_cycle28_in
    );
last_mac_cycle_reg: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => '1',
      D => last_mac_cycle_i_1_n_0,
      Q => last_mac_cycle_reg_n_0,
      R => '0'
    );
\m_counter[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \m_counter[5]_i_4_n_0\,
      I1 => \^addrardaddr\(3),
      O => \m_counter[0]_i_1_n_0\
    );
\m_counter[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \m_counter[5]_i_4_n_0\,
      I1 => \^addrardaddr\(3),
      I2 => \^addrardaddr\(4),
      O => \m_counter[1]_i_1_n_0\
    );
\m_counter[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => \m_counter[5]_i_4_n_0\,
      I1 => \^addrardaddr\(3),
      I2 => \^addrardaddr\(4),
      I3 => \^addrardaddr\(5),
      O => \m_counter[2]_i_1_n_0\
    );
\m_counter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => \m_counter[5]_i_4_n_0\,
      I1 => \^addrardaddr\(4),
      I2 => \^addrardaddr\(3),
      I3 => \^addrardaddr\(5),
      I4 => \^addrardaddr\(6),
      O => \m_counter[3]_i_1_n_0\
    );
\m_counter[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
        port map (
      I0 => \^addrardaddr\(6),
      I1 => \^addrardaddr\(4),
      I2 => \^addrardaddr\(3),
      I3 => \^addrardaddr\(5),
      I4 => \m_counter[5]_i_4_n_0\,
      I5 => \^addrardaddr\(7),
      O => \m_counter[4]_i_1_n_0\
    );
\m_counter[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => \^addrardaddr\(2),
      I1 => \^addrardaddr\(1),
      I2 => \^addrardaddr\(0),
      I3 => acc(0),
      I4 => acc0,
      O => \m_counter[5]_i_1_n_0\
    );
\m_counter[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
        port map (
      I0 => \^addrardaddr\(7),
      I1 => \m_counter[5]_i_3_n_0\,
      I2 => \m_counter[5]_i_4_n_0\,
      I3 => \^addrardaddr\(8),
      O => \m_counter[5]_i_2_n_0\
    );
\m_counter[5]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^addrardaddr\(6),
      I1 => \^addrardaddr\(4),
      I2 => \^addrardaddr\(3),
      I3 => \^addrardaddr\(5),
      O => \m_counter[5]_i_3_n_0\
    );
\m_counter[5]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc(0),
      I1 => last_mac_cycle28_in,
      O => \m_counter[5]_i_4_n_0\
    );
\m_counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \m_counter[5]_i_1_n_0\,
      D => \m_counter[0]_i_1_n_0\,
      Q => \^addrardaddr\(3),
      R => '0'
    );
\m_counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \m_counter[5]_i_1_n_0\,
      D => \m_counter[1]_i_1_n_0\,
      Q => \^addrardaddr\(4),
      R => '0'
    );
\m_counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \m_counter[5]_i_1_n_0\,
      D => \m_counter[2]_i_1_n_0\,
      Q => \^addrardaddr\(5),
      R => '0'
    );
\m_counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \m_counter[5]_i_1_n_0\,
      D => \m_counter[3]_i_1_n_0\,
      Q => \^addrardaddr\(6),
      R => '0'
    );
\m_counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \m_counter[5]_i_1_n_0\,
      D => \m_counter[4]_i_1_n_0\,
      Q => \^addrardaddr\(7),
      R => '0'
    );
\m_counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \m_counter[5]_i_1_n_0\,
      D => \m_counter[5]_i_2_n_0\,
      Q => \^addrardaddr\(8),
      R => '0'
    );
\mul0__0_carry\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \mul0__0_carry_n_0\,
      CO(6) => \mul0__0_carry_n_1\,
      CO(5) => \mul0__0_carry_n_2\,
      CO(4) => \mul0__0_carry_n_3\,
      CO(3) => \mul0__0_carry_n_4\,
      CO(2) => \mul0__0_carry_n_5\,
      CO(1) => \mul0__0_carry_n_6\,
      CO(0) => \mul0__0_carry_n_7\,
      DI(7 downto 1) => DI(6 downto 0),
      DI(0) => '0',
      O(7) => \mul0__0_carry_n_8\,
      O(6) => \^dob_reg[0]\(0),
      O(5) => \mul0__0_carry_n_10\,
      O(4) => \mul0__0_carry_n_11\,
      O(3) => \mul0__0_carry_n_12\,
      O(2 downto 0) => mul0(2 downto 0),
      S(7 downto 0) => S(7 downto 0)
    );
\mul0__0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => \mul0__0_carry_n_0\,
      CI_TOP => '0',
      CO(7 downto 2) => \NLW_mul0__0_carry__0_CO_UNCONNECTED\(7 downto 2),
      CO(1) => CO(0),
      CO(0) => \mul0__0_carry__0_n_7\,
      DI(7 downto 2) => B"000000",
      DI(1 downto 0) => \mul0__60_carry_i_7\(1 downto 0),
      O(7 downto 2) => \NLW_mul0__0_carry__0_O_UNCONNECTED\(7 downto 2),
      O(1 downto 0) => \dob_reg[2]\(1 downto 0),
      S(7 downto 2) => B"000000",
      S(1 downto 0) => \mul0__60_carry_i_7_0\(1 downto 0)
    );
\mul0__30_carry\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \mul0__30_carry_n_0\,
      CO(6) => \mul0__30_carry_n_1\,
      CO(5) => \mul0__30_carry_n_2\,
      CO(4) => \mul0__30_carry_n_3\,
      CO(3) => \mul0__30_carry_n_4\,
      CO(2) => \mul0__30_carry_n_5\,
      CO(1) => \mul0__30_carry_n_6\,
      CO(0) => \mul0__30_carry_n_7\,
      DI(7 downto 1) => \mul0__60_carry_i_13_0\(6 downto 0),
      DI(0) => '0',
      O(7 downto 5) => \^o\(3 downto 1),
      O(4) => \mul0__30_carry_n_11\,
      O(3) => \^o\(0),
      O(2) => \mul0__30_carry_n_13\,
      O(1) => \mul0__30_carry_n_14\,
      O(0) => \mul0__30_carry_n_15\,
      S(7 downto 0) => \mul0__60_carry_i_13_1\(7 downto 0)
    );
\mul0__30_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => \mul0__30_carry_n_0\,
      CI_TOP => '0',
      CO(7 downto 2) => \NLW_mul0__30_carry__0_CO_UNCONNECTED\(7 downto 2),
      CO(1) => \dob_reg[5]\(0),
      CO(0) => \mul0__30_carry__0_n_7\,
      DI(7 downto 2) => B"000000",
      DI(1 downto 0) => \mul0__60_carry__0_i_15\(1 downto 0),
      O(7 downto 2) => \NLW_mul0__30_carry__0_O_UNCONNECTED\(7 downto 2),
      O(1 downto 0) => \dob_reg[5]_0\(1 downto 0),
      S(7 downto 2) => B"000000",
      S(1 downto 0) => \mul0__60_carry__0_i_15_0\(1 downto 0)
    );
\mul0__60_carry\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \mul0__60_carry_n_0\,
      CO(6) => \mul0__60_carry_n_1\,
      CO(5) => \mul0__60_carry_n_2\,
      CO(4) => \mul0__60_carry_n_3\,
      CO(3) => \mul0__60_carry_n_4\,
      CO(2) => \mul0__60_carry_n_5\,
      CO(1) => \mul0__60_carry_n_6\,
      CO(0) => \mul0__60_carry_n_7\,
      DI(7) => \acc[0]_i_6_0\(1),
      DI(6) => \mul0__60_carry_i_2_n_0\,
      DI(5) => \acc[0]_i_6_0\(0),
      DI(4) => \mul0__60_carry_i_4_n_0\,
      DI(3) => \mul0__60_carry_i_5_n_0\,
      DI(2) => \mul0__0_carry_n_10\,
      DI(1) => \mul0__0_carry_n_11\,
      DI(0) => \mul0__0_carry_n_12\,
      O(7 downto 0) => mul0(10 downto 3),
      S(7 downto 6) => \acc[0]_i_6_1\(1 downto 0),
      S(5) => \mul0__60_carry_i_8_n_0\,
      S(4) => \mul0__60_carry_i_9_n_0\,
      S(3) => \mul0__60_carry_i_10_n_0\,
      S(2) => \mul0__60_carry_i_11_n_0\,
      S(1) => \mul0__60_carry_i_12_n_0\,
      S(0) => \mul0__60_carry_i_13_n_0\
    );
\mul0__60_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => \mul0__60_carry_n_0\,
      CI_TOP => '0',
      CO(7 downto 4) => \NLW_mul0__60_carry__0_CO_UNCONNECTED\(7 downto 4),
      CO(3) => \mul0__60_carry__0_n_4\,
      CO(2) => \mul0__60_carry__0_n_5\,
      CO(1) => \mul0__60_carry__0_n_6\,
      CO(0) => \mul0__60_carry__0_n_7\,
      DI(7 downto 4) => B"0000",
      DI(3 downto 0) => \acc[8]_i_5_0\(3 downto 0),
      O(7 downto 5) => \NLW_mul0__60_carry__0_O_UNCONNECTED\(7 downto 5),
      O(4 downto 0) => mul0(15 downto 11),
      S(7 downto 5) => B"000",
      S(4 downto 0) => \acc[8]_i_5_1\(4 downto 0)
    );
\mul0__60_carry_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9666"
    )
        port map (
      I0 => \^o\(0),
      I1 => \^dob_reg[0]\(0),
      I2 => \mul0__60_carry_0\(0),
      I3 => DOUTADOUT(0),
      O => \mul0__60_carry_i_10_n_0\
    );
\mul0__60_carry_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \mul0__0_carry_n_10\,
      I1 => \mul0__30_carry_n_13\,
      O => \mul0__60_carry_i_11_n_0\
    );
\mul0__60_carry_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \mul0__0_carry_n_11\,
      I1 => \mul0__30_carry_n_14\,
      O => \mul0__60_carry_i_12_n_0\
    );
\mul0__60_carry_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \mul0__0_carry_n_12\,
      I1 => \mul0__30_carry_n_15\,
      O => \mul0__60_carry_i_13_n_0\
    );
\mul0__60_carry_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0800080000000"
    )
        port map (
      I0 => \^dob_reg[0]\(0),
      I1 => \^o\(0),
      I2 => \mul0__60_carry_0\(0),
      I3 => DOUTADOUT(1),
      I4 => \mul0__60_carry_1\,
      I5 => DOUTADOUT(2),
      O => \mul0__60_carry_i_2_n_0\
    );
\mul0__60_carry_i_22\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^dob_reg[0]\(0),
      I1 => \^o\(0),
      I2 => \mul0__60_carry_0\(0),
      I3 => DOUTADOUT(1),
      O => \^dob_reg[6]\
    );
\mul0__60_carry_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \mul0__60_carry_0\(1),
      I1 => DOUTADOUT(0),
      I2 => \mul0__30_carry_n_11\,
      I3 => \mul0__0_carry_n_8\,
      O => \mul0__60_carry_i_4_n_0\
    );
\mul0__60_carry_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^dob_reg[0]\(0),
      I1 => \^o\(0),
      O => \mul0__60_carry_i_5_n_0\
    );
\mul0__60_carry_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669699969996999"
    )
        port map (
      I0 => \mul0__60_carry_2\,
      I1 => \^dob_reg[6]\,
      I2 => \mul0__0_carry_n_8\,
      I3 => \mul0__30_carry_n_11\,
      I4 => DOUTADOUT(0),
      I5 => \mul0__60_carry_0\(1),
      O => \mul0__60_carry_i_8_n_0\
    );
\mul0__60_carry_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"956A6A6A"
    )
        port map (
      I0 => \mul0__60_carry_i_4_n_0\,
      I1 => DOUTADOUT(1),
      I2 => \mul0__60_carry_0\(0),
      I3 => \^o\(0),
      I4 => \^dob_reg[0]\(0),
      O => \mul0__60_carry_i_9_n_0\
    );
\n_counter[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0F08"
    )
        port map (
      I0 => acc0,
      I1 => \Start__20\,
      I2 => \^addrardaddr\(0),
      I3 => acc(0),
      O => \n_counter[0]_i_1_n_0\
    );
\n_counter[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FF00880"
    )
        port map (
      I0 => acc0,
      I1 => \Start__20\,
      I2 => \^addrardaddr\(1),
      I3 => \^addrardaddr\(0),
      I4 => acc(0),
      O => \n_counter[1]_i_1_n_0\
    );
\n_counter[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => acc0,
      I1 => acc(0),
      O => \__10\
    );
\n_counter[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FF0F0F008808080"
    )
        port map (
      I0 => acc0,
      I1 => \Start__20\,
      I2 => \^addrardaddr\(2),
      I3 => \^addrardaddr\(1),
      I4 => \^addrardaddr\(0),
      I5 => acc(0),
      O => \n_counter[2]_i_2_n_0\
    );
\n_counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \__10\,
      D => \n_counter[0]_i_1_n_0\,
      Q => \^addrardaddr\(0),
      R => '0'
    );
\n_counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \__10\,
      D => \n_counter[1]_i_1_n_0\,
      Q => \^addrardaddr\(1),
      R => '0'
    );
\n_counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \__10\,
      D => \n_counter[2]_i_2_n_0\,
      Q => \^addrardaddr\(2),
      R => '0'
    );
\write_counter[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FAEAEAEA"
    )
        port map (
      I0 => Q(3),
      I1 => Q(0),
      I2 => M_AXIS_TREADY,
      I3 => Q(1),
      I4 => Done,
      O => write_counter(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_pl_matmul_0_0_memory_RAM is
  port (
    DOUTADOUT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    RAM_reg_bram_0_0 : out STD_LOGIC;
    RAM_reg_bram_0_1 : out STD_LOGIC;
    RAM_reg_bram_0_2 : out STD_LOGIC;
    RAM_reg_bram_0_3 : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DI : out STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_0_4 : out STD_LOGIC;
    RAM_reg_bram_0_5 : out STD_LOGIC;
    RAM_reg_bram_0_6 : out STD_LOGIC;
    RAM_reg_bram_0_7 : out STD_LOGIC;
    RAM_reg_bram_0_8 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    RAM_reg_bram_0_9 : out STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_0_10 : out STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_0_11 : out STD_LOGIC;
    RAM_reg_bram_0_12 : out STD_LOGIC;
    RAM_reg_bram_0_13 : out STD_LOGIC;
    RAM_reg_bram_0_14 : out STD_LOGIC;
    RAM_reg_bram_0_15 : out STD_LOGIC;
    RAM_reg_bram_0_16 : out STD_LOGIC;
    RAM_reg_bram_0_17 : out STD_LOGIC;
    RAM_reg_bram_0_18 : out STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_0_19 : out STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_0_20 : out STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_0_21 : out STD_LOGIC_VECTOR ( 0 to 0 );
    ACLK : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    ADDRARDADDR : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXIS_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXIS_TREADY : in STD_LOGIC;
    S_AXIS_TVALID : in STD_LOGIC;
    A_write_en13_out : in STD_LOGIC;
    B : in STD_LOGIC_VECTOR ( 7 downto 0 );
    O : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \mul0__60_carry\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \mul0__60_carry_0\ : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    \mul0__60_carry_1\ : in STD_LOGIC;
    \mul0__60_carry_2\ : in STD_LOGIC;
    \mul0__60_carry_3\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_pl_matmul_0_0_memory_RAM : entity is "memory_RAM";
end design_1_pl_matmul_0_0_memory_RAM;

architecture STRUCTURE of design_1_pl_matmul_0_0_memory_RAM is
  signal A_write_en : STD_LOGIC;
  signal \^doutadout\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^ram_reg_bram_0_11\ : STD_LOGIC;
  signal \mul0__0_carry_i_20_n_0\ : STD_LOGIC;
  signal \mul0__30_carry_i_20_n_0\ : STD_LOGIC;
  signal \mul0__60_carry_i_21_n_0\ : STD_LOGIC;
  signal NLW_RAM_reg_bram_0_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_RAM_reg_bram_0_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_RAM_reg_bram_0_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_bram_0_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_bram_0_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal NLW_RAM_reg_bram_0_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_RAM_reg_bram_0_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_bram_0_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_0 : label is "p0_d8";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of RAM_reg_bram_0 : label is "p0_d8";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_0 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_0 : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of RAM_reg_bram_0 : label is 4096;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of RAM_reg_bram_0 : label is "design_1_pl_matmul_0_0/inst/A_RAM/RAM_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of RAM_reg_bram_0 : label is "auto";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of RAM_reg_bram_0 : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of RAM_reg_bram_0 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of RAM_reg_bram_0 : label is 511;
  attribute ram_offset : integer;
  attribute ram_offset of RAM_reg_bram_0 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of RAM_reg_bram_0 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of RAM_reg_bram_0 : label is 7;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \mul0__0_carry_i_16\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \mul0__0_carry_i_17\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \mul0__0_carry_i_18\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \mul0__0_carry_i_19\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \mul0__0_carry_i_20\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \mul0__30_carry_i_16\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \mul0__30_carry_i_17\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \mul0__30_carry_i_18\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \mul0__30_carry_i_19\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \mul0__30_carry_i_20\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \mul0__60_carry__0_i_17\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \mul0__60_carry__0_i_19\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \mul0__60_carry__0_i_20\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \mul0__60_carry__0_i_23\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \mul0__60_carry_i_14\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \mul0__60_carry_i_17\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \mul0__60_carry_i_20\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \mul0__60_carry_i_21\ : label is "soft_lutpair5";
begin
  DOUTADOUT(7 downto 0) <= \^doutadout\(7 downto 0);
  RAM_reg_bram_0_11 <= \^ram_reg_bram_0_11\;
RAM_reg_bram_0: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INIT_A => B"00" & X"0000",
      INIT_B => B"00" & X"0000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => B"00" & X"0000",
      SRVAL_B => B"00" & X"0000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "READ_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13) => '1',
      ADDRARDADDR(12 downto 4) => ADDRARDADDR(8 downto 0),
      ADDRARDADDR(3 downto 0) => B"1111",
      ADDRBWRADDR(13) => '1',
      ADDRBWRADDR(12 downto 4) => Q(8 downto 0),
      ADDRBWRADDR(3 downto 0) => B"1111",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(15 downto 0) => B"0000000000000000",
      CASDINB(15 downto 0) => B"0000000000000000",
      CASDINPA(1 downto 0) => B"00",
      CASDINPB(1 downto 0) => B"00",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(15 downto 0) => NLW_RAM_reg_bram_0_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_RAM_reg_bram_0_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_RAM_reg_bram_0_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_RAM_reg_bram_0_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CLKARDCLK => ACLK,
      CLKBWRCLK => ACLK,
      DINADIN(15 downto 0) => B"0000000011111111",
      DINBDIN(15 downto 8) => B"00000000",
      DINBDIN(7 downto 0) => S_AXIS_TDATA(7 downto 0),
      DINPADINP(1 downto 0) => B"00",
      DINPBDINP(1 downto 0) => B"00",
      DOUTADOUT(15 downto 8) => NLW_RAM_reg_bram_0_DOUTADOUT_UNCONNECTED(15 downto 8),
      DOUTADOUT(7 downto 0) => \^doutadout\(7 downto 0),
      DOUTBDOUT(15 downto 0) => NLW_RAM_reg_bram_0_DOUTBDOUT_UNCONNECTED(15 downto 0),
      DOUTPADOUTP(1 downto 0) => NLW_RAM_reg_bram_0_DOUTPADOUTP_UNCONNECTED(1 downto 0),
      DOUTPBDOUTP(1 downto 0) => NLW_RAM_reg_bram_0_DOUTPBDOUTP_UNCONNECTED(1 downto 0),
      ENARDEN => E(0),
      ENBWREN => '1',
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 2) => B"00",
      WEBWE(1) => A_write_en,
      WEBWE(0) => A_write_en
    );
RAM_reg_bram_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => Q(9),
      I1 => S_AXIS_TREADY,
      I2 => S_AXIS_TVALID,
      I3 => A_write_en13_out,
      O => A_write_en
    );
\mul0__0_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E73F50007800F000"
    )
        port map (
      I0 => \^doutadout\(5),
      I1 => B(0),
      I2 => \^doutadout\(6),
      I3 => B(2),
      I4 => \^doutadout\(7),
      I5 => B(1),
      O => RAM_reg_bram_0_19(0)
    );
\mul0__0_carry_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9C936C9393939393"
    )
        port map (
      I0 => \^doutadout\(2),
      I1 => \mul0__0_carry_i_20_n_0\,
      I2 => B(1),
      I3 => B(2),
      I4 => \^doutadout\(0),
      I5 => \^doutadout\(1),
      O => S(2)
    );
\mul0__0_carry_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => \^doutadout\(0),
      I1 => B(2),
      I2 => \^doutadout\(1),
      I3 => B(1),
      I4 => B(0),
      I5 => \^doutadout\(2),
      O => S(1)
    );
\mul0__0_carry_i_15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^doutadout\(0),
      I1 => B(0),
      O => S(0)
    );
\mul0__0_carry_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(5),
      I1 => B(2),
      O => RAM_reg_bram_0_3
    );
\mul0__0_carry_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(4),
      I1 => B(2),
      O => RAM_reg_bram_0_2
    );
\mul0__0_carry_i_18\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(3),
      I1 => B(2),
      O => RAM_reg_bram_0_1
    );
\mul0__0_carry_i_19\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(2),
      I1 => B(2),
      O => RAM_reg_bram_0_0
    );
\mul0__0_carry_i_20\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(3),
      I1 => B(0),
      O => \mul0__0_carry_i_20_n_0\
    );
\mul0__0_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^doutadout\(1),
      I1 => B(0),
      O => DI(0)
    );
\mul0__30_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E73F50007800F000"
    )
        port map (
      I0 => \^doutadout\(5),
      I1 => B(3),
      I2 => \^doutadout\(6),
      I3 => B(5),
      I4 => \^doutadout\(7),
      I5 => B(4),
      O => RAM_reg_bram_0_20(0)
    );
\mul0__30_carry_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9C936C9393939393"
    )
        port map (
      I0 => \^doutadout\(2),
      I1 => \mul0__30_carry_i_20_n_0\,
      I2 => B(4),
      I3 => B(5),
      I4 => \^doutadout\(0),
      I5 => \^doutadout\(1),
      O => RAM_reg_bram_0_8(2)
    );
\mul0__30_carry_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => \^doutadout\(0),
      I1 => B(5),
      I2 => \^doutadout\(1),
      I3 => B(4),
      I4 => B(3),
      I5 => \^doutadout\(2),
      O => RAM_reg_bram_0_8(1)
    );
\mul0__30_carry_i_15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^doutadout\(0),
      I1 => B(3),
      O => RAM_reg_bram_0_8(0)
    );
\mul0__30_carry_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(5),
      I1 => B(5),
      O => RAM_reg_bram_0_7
    );
\mul0__30_carry_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(4),
      I1 => B(5),
      O => RAM_reg_bram_0_6
    );
\mul0__30_carry_i_18\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(3),
      I1 => B(5),
      O => RAM_reg_bram_0_5
    );
\mul0__30_carry_i_19\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(2),
      I1 => B(5),
      O => RAM_reg_bram_0_4
    );
\mul0__30_carry_i_20\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(3),
      I1 => B(3),
      O => \mul0__30_carry_i_20_n_0\
    );
\mul0__30_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^doutadout\(1),
      I1 => B(3),
      O => RAM_reg_bram_0_9(0)
    );
\mul0__60_carry__0_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(5),
      I1 => B(7),
      O => RAM_reg_bram_0_17
    );
\mul0__60_carry__0_i_19\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(4),
      I1 => B(7),
      O => RAM_reg_bram_0_16
    );
\mul0__60_carry__0_i_20\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(4),
      I1 => B(6),
      O => RAM_reg_bram_0_14
    );
\mul0__60_carry__0_i_23\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(3),
      I1 => B(7),
      O => RAM_reg_bram_0_15
    );
\mul0__60_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^doutadout\(7),
      I1 => \^doutadout\(6),
      I2 => B(7),
      I3 => CO(0),
      O => RAM_reg_bram_0_18(0)
    );
\mul0__60_carry_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(1),
      I1 => B(7),
      O => \^ram_reg_bram_0_11\
    );
\mul0__60_carry_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(3),
      I1 => B(6),
      O => RAM_reg_bram_0_12
    );
\mul0__60_carry_i_20\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(2),
      I1 => B(7),
      O => RAM_reg_bram_0_13
    );
\mul0__60_carry_i_21\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^doutadout\(2),
      I1 => B(6),
      O => \mul0__60_carry_i_21_n_0\
    );
\mul0__60_carry_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"807FFF007F80FF00"
    )
        port map (
      I0 => \^doutadout\(1),
      I1 => O(0),
      I2 => \mul0__60_carry\(0),
      I3 => \mul0__60_carry_0\,
      I4 => B(6),
      I5 => \^doutadout\(2),
      O => RAM_reg_bram_0_10(0)
    );
\mul0__60_carry_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B42DD2B4D2B44BD2"
    )
        port map (
      I0 => \mul0__60_carry_i_21_n_0\,
      I1 => \mul0__60_carry_1\,
      I2 => \mul0__60_carry_2\,
      I3 => \^ram_reg_bram_0_11\,
      I4 => O(1),
      I5 => \mul0__60_carry_3\(0),
      O => RAM_reg_bram_0_21(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_pl_matmul_0_0_memory_RAM__parameterized0\ is
  port (
    A_write_en13_out : out STD_LOGIC;
    DI : out STD_LOGIC_VECTOR ( 5 downto 0 );
    \dob_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \dob_reg[2]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \dob_reg[3]_0\ : out STD_LOGIC_VECTOR ( 5 downto 0 );
    \dob_reg[5]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    RAM_reg_bram_0 : out STD_LOGIC;
    \dob_reg[7]_1\ : out STD_LOGIC;
    \dob_reg[6]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_0_0 : out STD_LOGIC;
    \dob_reg[7]_2\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \dob_reg[1]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \dob_reg[4]_0\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \dob_reg[4]_1\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_0_1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \dob_reg[6]_1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXIS_TVALID : in STD_LOGIC;
    S_AXIS_TREADY : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RAM_reg_bram_0_2 : in STD_LOGIC;
    DOUTADOUT : in STD_LOGIC_VECTOR ( 7 downto 0 );
    O : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \mul0__60_carry__0_i_9_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \mul0__60_carry\ : in STD_LOGIC;
    \mul0__60_carry__0\ : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    \mul0__60_carry__0_i_2_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \mul0__60_carry__0_i_1_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \mul0__0_carry\ : in STD_LOGIC;
    \mul0__0_carry_0\ : in STD_LOGIC;
    \mul0__0_carry_1\ : in STD_LOGIC;
    \mul0__0_carry_2\ : in STD_LOGIC;
    \mul0__30_carry\ : in STD_LOGIC;
    \mul0__30_carry_0\ : in STD_LOGIC;
    \mul0__30_carry_1\ : in STD_LOGIC;
    \mul0__30_carry_2\ : in STD_LOGIC;
    \mul0__60_carry_0\ : in STD_LOGIC;
    \mul0__60_carry__0_0\ : in STD_LOGIC;
    \mul0__60_carry__0_1\ : in STD_LOGIC;
    \mul0__60_carry__0_2\ : in STD_LOGIC;
    \mul0__60_carry__0_3\ : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    ACLK : in STD_LOGIC;
    S_AXIS_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \dob_reg[1]_1\ : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_pl_matmul_0_0_memory_RAM__parameterized0\ : entity is "memory_RAM";
end \design_1_pl_matmul_0_0_memory_RAM__parameterized0\;

architecture STRUCTURE of \design_1_pl_matmul_0_0_memory_RAM__parameterized0\ is
  signal \^a_write_en13_out\ : STD_LOGIC;
  signal B_write_en : STD_LOGIC;
  signal \^di\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \dob0__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^dob_reg[3]_0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \^dob_reg[7]_0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \mul0__60_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \mul0__60_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \mul0__60_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \mul0__60_carry__0_i_13_n_0\ : STD_LOGIC;
  signal \mul0__60_carry__0_i_14_n_0\ : STD_LOGIC;
  signal \mul0__60_carry__0_i_15_n_0\ : STD_LOGIC;
  signal \mul0__60_carry__0_i_16_n_0\ : STD_LOGIC;
  signal \mul0__60_carry__0_i_18_n_0\ : STD_LOGIC;
  signal \mul0__60_carry__0_i_21_n_0\ : STD_LOGIC;
  signal \mul0__60_carry__0_i_22_n_0\ : STD_LOGIC;
  signal \mul0__60_carry_i_15_n_0\ : STD_LOGIC;
  signal \mul0__60_carry_i_18_n_0\ : STD_LOGIC;
  signal \mul0__60_carry_i_19_n_0\ : STD_LOGIC;
  signal NLW_RAM_reg_0_7_0_7_DOE_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_7_0_7_DOF_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_7_0_7_DOG_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_7_0_7_DOH_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_7_0_7 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of RAM_reg_0_7_0_7 : label is 64;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of RAM_reg_0_7_0_7 : label is "design_1_pl_matmul_0_0/inst/B_RAM/RAM_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of RAM_reg_0_7_0_7 : label is "auto";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of RAM_reg_0_7_0_7 : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of RAM_reg_0_7_0_7 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of RAM_reg_0_7_0_7 : label is 7;
  attribute ram_offset : integer;
  attribute ram_offset of RAM_reg_0_7_0_7 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of RAM_reg_0_7_0_7 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of RAM_reg_0_7_0_7 : label is 7;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \mul0__60_carry__0_i_10\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \mul0__60_carry__0_i_12\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \mul0__60_carry__0_i_13\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \mul0__60_carry__0_i_14\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \mul0__60_carry__0_i_15\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \mul0__60_carry__0_i_16\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \mul0__60_carry__0_i_18\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \mul0__60_carry__0_i_21\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \mul0__60_carry__0_i_22\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \mul0__60_carry_i_15\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \mul0__60_carry_i_16\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \mul0__60_carry_i_18\ : label is "soft_lutpair12";
begin
  A_write_en13_out <= \^a_write_en13_out\;
  DI(5 downto 0) <= \^di\(5 downto 0);
  \dob_reg[3]_0\(5 downto 0) <= \^dob_reg[3]_0\(5 downto 0);
  \dob_reg[7]_0\(7 downto 0) <= \^dob_reg[7]_0\(7 downto 0);
RAM_reg_0_7_0_7: unisim.vcomponents.RAM32M16
     port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2 downto 0) => \dob_reg[1]_1\(2 downto 0),
      ADDRB(4 downto 3) => B"00",
      ADDRB(2 downto 0) => \dob_reg[1]_1\(2 downto 0),
      ADDRC(4 downto 3) => B"00",
      ADDRC(2 downto 0) => \dob_reg[1]_1\(2 downto 0),
      ADDRD(4 downto 3) => B"00",
      ADDRD(2 downto 0) => \dob_reg[1]_1\(2 downto 0),
      ADDRE(4 downto 3) => B"00",
      ADDRE(2 downto 0) => \dob_reg[1]_1\(2 downto 0),
      ADDRF(4 downto 3) => B"00",
      ADDRF(2 downto 0) => \dob_reg[1]_1\(2 downto 0),
      ADDRG(4 downto 3) => B"00",
      ADDRG(2 downto 0) => \dob_reg[1]_1\(2 downto 0),
      ADDRH(4 downto 3) => B"00",
      ADDRH(2 downto 0) => Q(2 downto 0),
      DIA(1 downto 0) => S_AXIS_TDATA(1 downto 0),
      DIB(1 downto 0) => S_AXIS_TDATA(3 downto 2),
      DIC(1 downto 0) => S_AXIS_TDATA(5 downto 4),
      DID(1 downto 0) => S_AXIS_TDATA(7 downto 6),
      DIE(1 downto 0) => B"00",
      DIF(1 downto 0) => B"00",
      DIG(1 downto 0) => B"00",
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => \dob0__0\(1 downto 0),
      DOB(1 downto 0) => \dob0__0\(3 downto 2),
      DOC(1 downto 0) => \dob0__0\(5 downto 4),
      DOD(1 downto 0) => \dob0__0\(7 downto 6),
      DOE(1 downto 0) => NLW_RAM_reg_0_7_0_7_DOE_UNCONNECTED(1 downto 0),
      DOF(1 downto 0) => NLW_RAM_reg_0_7_0_7_DOF_UNCONNECTED(1 downto 0),
      DOG(1 downto 0) => NLW_RAM_reg_0_7_0_7_DOG_UNCONNECTED(1 downto 0),
      DOH(1 downto 0) => NLW_RAM_reg_0_7_0_7_DOH_UNCONNECTED(1 downto 0),
      WCLK => ACLK,
      WE => B_write_en
    );
RAM_reg_0_7_0_7_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => S_AXIS_TVALID,
      I1 => S_AXIS_TREADY,
      I2 => \^a_write_en13_out\,
      O => B_write_en
    );
RAM_reg_bram_0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => Q(4),
      I1 => Q(5),
      I2 => Q(7),
      I3 => Q(6),
      I4 => Q(3),
      I5 => RAM_reg_bram_0_2,
      O => \^a_write_en13_out\
    );
\dob_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => \dob0__0\(0),
      Q => \^dob_reg[7]_0\(0),
      R => '0'
    );
\dob_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => \dob0__0\(1),
      Q => \^dob_reg[7]_0\(1),
      R => '0'
    );
\dob_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => \dob0__0\(2),
      Q => \^dob_reg[7]_0\(2),
      R => '0'
    );
\dob_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => \dob0__0\(3),
      Q => \^dob_reg[7]_0\(3),
      R => '0'
    );
\dob_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => \dob0__0\(4),
      Q => \^dob_reg[7]_0\(4),
      R => '0'
    );
\dob_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => \dob0__0\(5),
      Q => \^dob_reg[7]_0\(5),
      R => '0'
    );
\dob_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => \dob0__0\(6),
      Q => \^dob_reg[7]_0\(6),
      R => '0'
    );
\dob_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => \dob0__0\(7),
      Q => \^dob_reg[7]_0\(7),
      R => '0'
    );
\mul0__0_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^dob_reg[7]_0\(2),
      I1 => DOUTADOUT(6),
      I2 => \^dob_reg[7]_0\(1),
      I3 => DOUTADOUT(7),
      O => \dob_reg[2]_0\(1)
    );
\mul0__0_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => \^dob_reg[7]_0\(0),
      I1 => DOUTADOUT(7),
      I2 => DOUTADOUT(5),
      I3 => \^dob_reg[7]_0\(2),
      I4 => DOUTADOUT(6),
      I5 => \^dob_reg[7]_0\(1),
      O => \dob_reg[2]_0\(0)
    );
\mul0__0_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => \^dob_reg[7]_0\(1),
      I1 => DOUTADOUT(6),
      I2 => \^dob_reg[7]_0\(2),
      I3 => DOUTADOUT(7),
      O => \dob_reg[1]_0\(0)
    );
\mul0__0_carry_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => \^dob_reg[7]_0\(0),
      I1 => DOUTADOUT(6),
      I2 => DOUTADOUT(4),
      I3 => \^dob_reg[7]_0\(2),
      I4 => DOUTADOUT(5),
      I5 => \^dob_reg[7]_0\(1),
      O => \^di\(5)
    );
\mul0__0_carry_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \^di\(3),
      I1 => \^dob_reg[7]_0\(1),
      I2 => DOUTADOUT(4),
      I3 => \mul0__0_carry_0\,
      I4 => DOUTADOUT(5),
      I5 => \^dob_reg[7]_0\(0),
      O => S(2)
    );
\mul0__0_carry_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \^di\(2),
      I1 => \^dob_reg[7]_0\(1),
      I2 => DOUTADOUT(3),
      I3 => \mul0__0_carry\,
      I4 => DOUTADOUT(4),
      I5 => \^dob_reg[7]_0\(0),
      O => S(1)
    );
\mul0__0_carry_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => \^dob_reg[7]_0\(0),
      I1 => DOUTADOUT(1),
      I2 => \^dob_reg[7]_0\(1),
      I3 => DOUTADOUT(0),
      O => S(0)
    );
\mul0__0_carry_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => \^dob_reg[7]_0\(0),
      I1 => DOUTADOUT(5),
      I2 => DOUTADOUT(3),
      I3 => \^dob_reg[7]_0\(2),
      I4 => DOUTADOUT(4),
      I5 => \^dob_reg[7]_0\(1),
      O => \^di\(4)
    );
\mul0__0_carry_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => \^dob_reg[7]_0\(0),
      I1 => DOUTADOUT(4),
      I2 => DOUTADOUT(2),
      I3 => \^dob_reg[7]_0\(2),
      I4 => DOUTADOUT(3),
      I5 => \^dob_reg[7]_0\(1),
      O => \^di\(3)
    );
\mul0__0_carry_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => \^dob_reg[7]_0\(0),
      I1 => DOUTADOUT(3),
      I2 => DOUTADOUT(1),
      I3 => \^dob_reg[7]_0\(2),
      I4 => DOUTADOUT(2),
      I5 => \^dob_reg[7]_0\(1),
      O => \^di\(2)
    );
\mul0__0_carry_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => \^dob_reg[7]_0\(0),
      I1 => DOUTADOUT(3),
      I2 => DOUTADOUT(1),
      I3 => \^dob_reg[7]_0\(2),
      I4 => DOUTADOUT(2),
      I5 => \^dob_reg[7]_0\(1),
      O => \^di\(1)
    );
\mul0__0_carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => \^dob_reg[7]_0\(1),
      I1 => DOUTADOUT(1),
      I2 => \^dob_reg[7]_0\(2),
      I3 => DOUTADOUT(0),
      O => \^di\(0)
    );
\mul0__0_carry_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \^di\(5),
      I1 => \^dob_reg[7]_0\(1),
      I2 => DOUTADOUT(6),
      I3 => \mul0__0_carry_2\,
      I4 => DOUTADOUT(7),
      I5 => \^dob_reg[7]_0\(0),
      O => S(4)
    );
\mul0__0_carry_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \^di\(4),
      I1 => \^dob_reg[7]_0\(1),
      I2 => DOUTADOUT(5),
      I3 => \mul0__0_carry_1\,
      I4 => DOUTADOUT(6),
      I5 => \^dob_reg[7]_0\(0),
      O => S(3)
    );
\mul0__30_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^dob_reg[7]_0\(5),
      I1 => DOUTADOUT(6),
      I2 => \^dob_reg[7]_0\(4),
      I3 => DOUTADOUT(7),
      O => \dob_reg[5]_0\(1)
    );
\mul0__30_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => \^dob_reg[7]_0\(3),
      I1 => DOUTADOUT(7),
      I2 => DOUTADOUT(5),
      I3 => \^dob_reg[7]_0\(5),
      I4 => DOUTADOUT(6),
      I5 => \^dob_reg[7]_0\(4),
      O => \dob_reg[5]_0\(0)
    );
\mul0__30_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => \^dob_reg[7]_0\(4),
      I1 => DOUTADOUT(6),
      I2 => \^dob_reg[7]_0\(5),
      I3 => DOUTADOUT(7),
      O => \dob_reg[4]_1\(0)
    );
\mul0__30_carry_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => \^dob_reg[7]_0\(3),
      I1 => DOUTADOUT(6),
      I2 => DOUTADOUT(4),
      I3 => \^dob_reg[7]_0\(5),
      I4 => DOUTADOUT(5),
      I5 => \^dob_reg[7]_0\(4),
      O => \^dob_reg[3]_0\(5)
    );
\mul0__30_carry_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \^dob_reg[3]_0\(3),
      I1 => \^dob_reg[7]_0\(4),
      I2 => DOUTADOUT(4),
      I3 => \mul0__30_carry_0\,
      I4 => DOUTADOUT(5),
      I5 => \^dob_reg[7]_0\(3),
      O => \dob_reg[4]_0\(2)
    );
\mul0__30_carry_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \^dob_reg[3]_0\(2),
      I1 => \^dob_reg[7]_0\(4),
      I2 => DOUTADOUT(3),
      I3 => \mul0__30_carry\,
      I4 => DOUTADOUT(4),
      I5 => \^dob_reg[7]_0\(3),
      O => \dob_reg[4]_0\(1)
    );
\mul0__30_carry_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => \^dob_reg[7]_0\(3),
      I1 => DOUTADOUT(1),
      I2 => \^dob_reg[7]_0\(4),
      I3 => DOUTADOUT(0),
      O => \dob_reg[4]_0\(0)
    );
\mul0__30_carry_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => \^dob_reg[7]_0\(3),
      I1 => DOUTADOUT(5),
      I2 => DOUTADOUT(3),
      I3 => \^dob_reg[7]_0\(5),
      I4 => DOUTADOUT(4),
      I5 => \^dob_reg[7]_0\(4),
      O => \^dob_reg[3]_0\(4)
    );
\mul0__30_carry_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => \^dob_reg[7]_0\(3),
      I1 => DOUTADOUT(4),
      I2 => DOUTADOUT(2),
      I3 => \^dob_reg[7]_0\(5),
      I4 => DOUTADOUT(3),
      I5 => \^dob_reg[7]_0\(4),
      O => \^dob_reg[3]_0\(3)
    );
\mul0__30_carry_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => \^dob_reg[7]_0\(3),
      I1 => DOUTADOUT(3),
      I2 => DOUTADOUT(1),
      I3 => \^dob_reg[7]_0\(5),
      I4 => DOUTADOUT(2),
      I5 => \^dob_reg[7]_0\(4),
      O => \^dob_reg[3]_0\(2)
    );
\mul0__30_carry_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => \^dob_reg[7]_0\(3),
      I1 => DOUTADOUT(3),
      I2 => DOUTADOUT(1),
      I3 => \^dob_reg[7]_0\(5),
      I4 => DOUTADOUT(2),
      I5 => \^dob_reg[7]_0\(4),
      O => \^dob_reg[3]_0\(1)
    );
\mul0__30_carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => \^dob_reg[7]_0\(4),
      I1 => DOUTADOUT(1),
      I2 => \^dob_reg[7]_0\(5),
      I3 => DOUTADOUT(0),
      O => \^dob_reg[3]_0\(0)
    );
\mul0__30_carry_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \^dob_reg[3]_0\(5),
      I1 => \^dob_reg[7]_0\(4),
      I2 => DOUTADOUT(6),
      I3 => \mul0__30_carry_2\,
      I4 => DOUTADOUT(7),
      I5 => \^dob_reg[7]_0\(3),
      O => \dob_reg[4]_0\(4)
    );
\mul0__30_carry_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \^dob_reg[3]_0\(4),
      I1 => \^dob_reg[7]_0\(4),
      I2 => DOUTADOUT(5),
      I3 => \mul0__30_carry_1\,
      I4 => DOUTADOUT(6),
      I5 => \^dob_reg[7]_0\(3),
      O => \dob_reg[4]_0\(3)
    );
\mul0__60_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF80800080008000"
    )
        port map (
      I0 => \mul0__60_carry__0_i_2_0\(1),
      I1 => \^dob_reg[7]_0\(7),
      I2 => DOUTADOUT(5),
      I3 => \mul0__60_carry__0_i_10_n_0\,
      I4 => \^dob_reg[7]_0\(6),
      I5 => DOUTADOUT(7),
      O => \dob_reg[7]_2\(3)
    );
\mul0__60_carry__0_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^dob_reg[7]_0\(7),
      I1 => DOUTADOUT(6),
      I2 => \mul0__60_carry__0_i_1_0\(0),
      O => \mul0__60_carry__0_i_10_n_0\
    );
\mul0__60_carry__0_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^dob_reg[7]_0\(7),
      I1 => DOUTADOUT(5),
      I2 => \mul0__60_carry__0_i_2_0\(1),
      O => \mul0__60_carry__0_i_11_n_0\
    );
\mul0__60_carry__0_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F880"
    )
        port map (
      I0 => \^dob_reg[7]_0\(7),
      I1 => DOUTADOUT(3),
      I2 => O(2),
      I3 => CO(0),
      O => \mul0__60_carry__0_i_12_n_0\
    );
\mul0__60_carry__0_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \^dob_reg[7]_0\(7),
      I1 => DOUTADOUT(3),
      I2 => O(2),
      I3 => CO(0),
      O => \mul0__60_carry__0_i_13_n_0\
    );
\mul0__60_carry__0_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \mul0__60_carry__0_i_2_0\(1),
      I1 => \^dob_reg[7]_0\(7),
      I2 => DOUTADOUT(5),
      O => \mul0__60_carry__0_i_14_n_0\
    );
\mul0__60_carry__0_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \mul0__60_carry__0_i_2_0\(0),
      I1 => \^dob_reg[7]_0\(7),
      I2 => DOUTADOUT(4),
      O => \mul0__60_carry__0_i_15_n_0\
    );
\mul0__60_carry__0_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"78888777"
    )
        port map (
      I0 => DOUTADOUT(7),
      I1 => \^dob_reg[7]_0\(6),
      I2 => \^dob_reg[7]_0\(7),
      I3 => DOUTADOUT(6),
      I4 => \mul0__60_carry__0_i_1_0\(0),
      O => \mul0__60_carry__0_i_16_n_0\
    );
\mul0__60_carry__0_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"78888777"
    )
        port map (
      I0 => DOUTADOUT(6),
      I1 => \^dob_reg[7]_0\(6),
      I2 => \^dob_reg[7]_0\(7),
      I3 => DOUTADOUT(5),
      I4 => \mul0__60_carry__0_i_2_0\(1),
      O => \mul0__60_carry__0_i_18_n_0\
    );
\mul0__60_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF80800080008000"
    )
        port map (
      I0 => \mul0__60_carry__0_i_2_0\(0),
      I1 => \^dob_reg[7]_0\(7),
      I2 => DOUTADOUT(4),
      I3 => \mul0__60_carry__0_i_11_n_0\,
      I4 => \^dob_reg[7]_0\(6),
      I5 => DOUTADOUT(6),
      O => \dob_reg[7]_2\(2)
    );
\mul0__60_carry__0_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F880"
    )
        port map (
      I0 => \^dob_reg[7]_0\(7),
      I1 => DOUTADOUT(2),
      I2 => O(1),
      I3 => \mul0__60_carry__0_i_9_0\(1),
      O => \mul0__60_carry__0_i_21_n_0\
    );
\mul0__60_carry__0_i_22\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"78888777"
    )
        port map (
      I0 => DOUTADOUT(5),
      I1 => \^dob_reg[7]_0\(6),
      I2 => \^dob_reg[7]_0\(7),
      I3 => DOUTADOUT(4),
      I4 => \mul0__60_carry__0_i_2_0\(0),
      O => \mul0__60_carry__0_i_22_n_0\
    );
\mul0__60_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEEE288828882888"
    )
        port map (
      I0 => \mul0__60_carry__0_i_12_n_0\,
      I1 => \mul0__60_carry__0_i_2_0\(0),
      I2 => DOUTADOUT(4),
      I3 => \^dob_reg[7]_0\(7),
      I4 => \^dob_reg[7]_0\(6),
      I5 => DOUTADOUT(5),
      O => \dob_reg[7]_2\(1)
    );
\mul0__60_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFD4D400D400D400"
    )
        port map (
      I0 => \mul0__60_carry__0\,
      I1 => O(1),
      I2 => \mul0__60_carry__0_i_9_0\(1),
      I3 => \mul0__60_carry__0_i_13_n_0\,
      I4 => \^dob_reg[7]_0\(6),
      I5 => DOUTADOUT(4),
      O => \dob_reg[7]_2\(0)
    );
\mul0__60_carry__0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8FEC1C801CEC7080"
    )
        port map (
      I0 => \^dob_reg[7]_0\(6),
      I1 => \mul0__60_carry__0_i_14_n_0\,
      I2 => DOUTADOUT(7),
      I3 => \^dob_reg[7]_0\(7),
      I4 => \mul0__60_carry__0_i_1_0\(0),
      I5 => DOUTADOUT(6),
      O => \dob_reg[6]_1\(3)
    );
\mul0__60_carry__0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F807807F7F80F807"
    )
        port map (
      I0 => DOUTADOUT(6),
      I1 => \^dob_reg[7]_0\(6),
      I2 => \mul0__60_carry__0_i_15_n_0\,
      I3 => \mul0__60_carry__0_i_16_n_0\,
      I4 => \mul0__60_carry__0_i_2_0\(1),
      I5 => \mul0__60_carry__0_3\,
      O => \dob_reg[6]_1\(2)
    );
\mul0__60_carry__0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F807807F7F80F807"
    )
        port map (
      I0 => DOUTADOUT(5),
      I1 => \^dob_reg[7]_0\(6),
      I2 => \mul0__60_carry__0_i_12_n_0\,
      I3 => \mul0__60_carry__0_i_18_n_0\,
      I4 => \mul0__60_carry__0_i_2_0\(0),
      I5 => \mul0__60_carry__0_2\,
      O => \dob_reg[6]_1\(1)
    );
\mul0__60_carry__0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B42DD2B4D2B44BD2"
    )
        port map (
      I0 => \mul0__60_carry__0_0\,
      I1 => \mul0__60_carry__0_i_21_n_0\,
      I2 => \mul0__60_carry__0_i_22_n_0\,
      I3 => \mul0__60_carry__0_1\,
      I4 => O(2),
      I5 => CO(0),
      O => \dob_reg[6]_1\(0)
    );
\mul0__60_carry_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFD4D400D400D400"
    )
        port map (
      I0 => \mul0__60_carry\,
      I1 => O(0),
      I2 => \mul0__60_carry__0_i_9_0\(0),
      I3 => \mul0__60_carry_i_15_n_0\,
      I4 => \^dob_reg[7]_0\(6),
      I5 => DOUTADOUT(3),
      O => \dob_reg[6]_0\(0)
    );
\mul0__60_carry_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \^dob_reg[7]_0\(7),
      I1 => DOUTADOUT(2),
      I2 => O(1),
      I3 => \mul0__60_carry__0_i_9_0\(1),
      O => \mul0__60_carry_i_15_n_0\
    );
\mul0__60_carry_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \^dob_reg[7]_0\(7),
      I1 => DOUTADOUT(1),
      I2 => O(0),
      I3 => \mul0__60_carry__0_i_9_0\(0),
      O => \dob_reg[7]_1\
    );
\mul0__60_carry_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F880"
    )
        port map (
      I0 => \^dob_reg[7]_0\(7),
      I1 => DOUTADOUT(1),
      I2 => O(0),
      I3 => \mul0__60_carry__0_i_9_0\(0),
      O => \mul0__60_carry_i_18_n_0\
    );
\mul0__60_carry_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878888777"
    )
        port map (
      I0 => DOUTADOUT(4),
      I1 => \^dob_reg[7]_0\(6),
      I2 => \^dob_reg[7]_0\(7),
      I3 => DOUTADOUT(3),
      I4 => O(2),
      I5 => CO(0),
      O => \mul0__60_carry_i_19_n_0\
    );
\mul0__60_carry_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878888777"
    )
        port map (
      I0 => DOUTADOUT(3),
      I1 => \^dob_reg[7]_0\(6),
      I2 => \^dob_reg[7]_0\(7),
      I3 => DOUTADOUT(2),
      I4 => O(1),
      I5 => \mul0__60_carry__0_i_9_0\(1),
      O => RAM_reg_bram_0_0
    );
\mul0__60_carry_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878888777"
    )
        port map (
      I0 => DOUTADOUT(2),
      I1 => \^dob_reg[7]_0\(6),
      I2 => \^dob_reg[7]_0\(7),
      I3 => DOUTADOUT(1),
      I4 => O(0),
      I5 => \mul0__60_carry__0_i_9_0\(0),
      O => RAM_reg_bram_0
    );
\mul0__60_carry_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B42DD2B4D2B44BD2"
    )
        port map (
      I0 => \mul0__60_carry_0\,
      I1 => \mul0__60_carry_i_18_n_0\,
      I2 => \mul0__60_carry_i_19_n_0\,
      I3 => \mul0__60_carry__0\,
      I4 => O(1),
      I5 => \mul0__60_carry__0_i_9_0\(1),
      O => RAM_reg_bram_0_1(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_pl_matmul_0_0_memory_RAM__parameterized1\ is
  port (
    M_AXIS_TDATA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ACLK : in STD_LOGIC;
    dia : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RES_write_en : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \dob_reg[0]_0\ : in STD_LOGIC;
    \dob_reg[0]_1\ : in STD_LOGIC;
    \dob_reg[0]_2\ : in STD_LOGIC;
    \dob_reg[0]_3\ : in STD_LOGIC;
    \dob_reg[0]_4\ : in STD_LOGIC;
    \dob_reg[0]_5\ : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_pl_matmul_0_0_memory_RAM__parameterized1\ : entity is "memory_RAM";
end \design_1_pl_matmul_0_0_memory_RAM__parameterized1\;

architecture STRUCTURE of \design_1_pl_matmul_0_0_memory_RAM__parameterized1\ is
  signal dob0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_0_63_0_6_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_7_7_SPO_UNCONNECTED : STD_LOGIC;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_0_6 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of RAM_reg_0_63_0_6 : label is 512;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of RAM_reg_0_63_0_6 : label is "design_1_pl_matmul_0_0/inst/RES_RAM/RAM_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of RAM_reg_0_63_0_6 : label is "auto";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of RAM_reg_0_63_0_6 : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of RAM_reg_0_63_0_6 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of RAM_reg_0_63_0_6 : label is 63;
  attribute ram_offset : integer;
  attribute ram_offset of RAM_reg_0_63_0_6 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of RAM_reg_0_63_0_6 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of RAM_reg_0_63_0_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_7_7 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_7_7 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_63_7_7 : label is "design_1_pl_matmul_0_0/inst/RES_RAM/RAM_reg_0_63_7_7";
  attribute RTL_RAM_STYLE of RAM_reg_0_63_7_7 : label is "NONE";
  attribute RTL_RAM_TYPE of RAM_reg_0_63_7_7 : label is "RAM_SDP";
  attribute ram_addr_begin of RAM_reg_0_63_7_7 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_7_7 : label is 63;
  attribute ram_offset of RAM_reg_0_63_7_7 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_7_7 : label is 7;
  attribute ram_slice_end of RAM_reg_0_63_7_7 : label is 7;
begin
RAM_reg_0_63_0_6: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => \dob_reg[0]_5\,
      ADDRA(4) => \dob_reg[0]_4\,
      ADDRA(3) => \dob_reg[0]_3\,
      ADDRA(2) => \dob_reg[0]_2\,
      ADDRA(1) => \dob_reg[0]_1\,
      ADDRA(0) => \dob_reg[0]_0\,
      ADDRB(5) => \dob_reg[0]_5\,
      ADDRB(4) => \dob_reg[0]_4\,
      ADDRB(3) => \dob_reg[0]_3\,
      ADDRB(2) => \dob_reg[0]_2\,
      ADDRB(1) => \dob_reg[0]_1\,
      ADDRB(0) => \dob_reg[0]_0\,
      ADDRC(5) => \dob_reg[0]_5\,
      ADDRC(4) => \dob_reg[0]_4\,
      ADDRC(3) => \dob_reg[0]_3\,
      ADDRC(2) => \dob_reg[0]_2\,
      ADDRC(1) => \dob_reg[0]_1\,
      ADDRC(0) => \dob_reg[0]_0\,
      ADDRD(5) => \dob_reg[0]_5\,
      ADDRD(4) => \dob_reg[0]_4\,
      ADDRD(3) => \dob_reg[0]_3\,
      ADDRD(2) => \dob_reg[0]_2\,
      ADDRD(1) => \dob_reg[0]_1\,
      ADDRD(0) => \dob_reg[0]_0\,
      ADDRE(5) => \dob_reg[0]_5\,
      ADDRE(4) => \dob_reg[0]_4\,
      ADDRE(3) => \dob_reg[0]_3\,
      ADDRE(2) => \dob_reg[0]_2\,
      ADDRE(1) => \dob_reg[0]_1\,
      ADDRE(0) => \dob_reg[0]_0\,
      ADDRF(5) => \dob_reg[0]_5\,
      ADDRF(4) => \dob_reg[0]_4\,
      ADDRF(3) => \dob_reg[0]_3\,
      ADDRF(2) => \dob_reg[0]_2\,
      ADDRF(1) => \dob_reg[0]_1\,
      ADDRF(0) => \dob_reg[0]_0\,
      ADDRG(5) => \dob_reg[0]_5\,
      ADDRG(4) => \dob_reg[0]_4\,
      ADDRG(3) => \dob_reg[0]_3\,
      ADDRG(2) => \dob_reg[0]_2\,
      ADDRG(1) => \dob_reg[0]_1\,
      ADDRG(0) => \dob_reg[0]_0\,
      ADDRH(5 downto 0) => Q(5 downto 0),
      DIA => dia(0),
      DIB => dia(1),
      DIC => dia(2),
      DID => dia(3),
      DIE => dia(4),
      DIF => dia(5),
      DIG => dia(6),
      DIH => '0',
      DOA => dob0(0),
      DOB => dob0(1),
      DOC => dob0(2),
      DOD => dob0(3),
      DOE => dob0(4),
      DOF => dob0(5),
      DOG => dob0(6),
      DOH => NLW_RAM_reg_0_63_0_6_DOH_UNCONNECTED,
      WCLK => ACLK,
      WE => RES_write_en
    );
RAM_reg_0_63_7_7: unisim.vcomponents.RAM64X1D
     port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      A4 => Q(4),
      A5 => Q(5),
      D => dia(7),
      DPO => dob0(7),
      DPRA0 => \dob_reg[0]_0\,
      DPRA1 => \dob_reg[0]_1\,
      DPRA2 => \dob_reg[0]_2\,
      DPRA3 => \dob_reg[0]_3\,
      DPRA4 => \dob_reg[0]_4\,
      DPRA5 => \dob_reg[0]_5\,
      SPO => NLW_RAM_reg_0_63_7_7_SPO_UNCONNECTED,
      WCLK => ACLK,
      WE => RES_write_en
    );
\dob_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => dob0(0),
      Q => M_AXIS_TDATA(0),
      R => '0'
    );
\dob_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => dob0(1),
      Q => M_AXIS_TDATA(1),
      R => '0'
    );
\dob_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => dob0(2),
      Q => M_AXIS_TDATA(2),
      R => '0'
    );
\dob_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => dob0(3),
      Q => M_AXIS_TDATA(3),
      R => '0'
    );
\dob_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => dob0(4),
      Q => M_AXIS_TDATA(4),
      R => '0'
    );
\dob_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => dob0(5),
      Q => M_AXIS_TDATA(5),
      R => '0'
    );
\dob_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => dob0(6),
      Q => M_AXIS_TDATA(6),
      R => '0'
    );
\dob_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => E(0),
      D => dob0(7),
      Q => M_AXIS_TDATA(7),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_pl_matmul_0_0_myip_v1_0 is
  port (
    S_AXIS_TREADY : out STD_LOGIC;
    M_AXIS_TDATA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXIS_TVALID : out STD_LOGIC;
    M_AXIS_TLAST : out STD_LOGIC;
    ACLK : in STD_LOGIC;
    S_AXIS_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXIS_TVALID : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M_AXIS_TREADY : in STD_LOGIC;
    S_AXIS_TLAST : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_pl_matmul_0_0_myip_v1_0 : entity is "myip_v1_0";
end design_1_pl_matmul_0_0_myip_v1_0;

architecture STRUCTURE of design_1_pl_matmul_0_0_myip_v1_0 is
  signal A_RAM_n_10 : STD_LOGIC;
  signal A_RAM_n_11 : STD_LOGIC;
  signal A_RAM_n_12 : STD_LOGIC;
  signal A_RAM_n_13 : STD_LOGIC;
  signal A_RAM_n_14 : STD_LOGIC;
  signal A_RAM_n_15 : STD_LOGIC;
  signal A_RAM_n_16 : STD_LOGIC;
  signal A_RAM_n_17 : STD_LOGIC;
  signal A_RAM_n_18 : STD_LOGIC;
  signal A_RAM_n_19 : STD_LOGIC;
  signal A_RAM_n_20 : STD_LOGIC;
  signal A_RAM_n_21 : STD_LOGIC;
  signal A_RAM_n_22 : STD_LOGIC;
  signal A_RAM_n_23 : STD_LOGIC;
  signal A_RAM_n_24 : STD_LOGIC;
  signal A_RAM_n_25 : STD_LOGIC;
  signal A_RAM_n_26 : STD_LOGIC;
  signal A_RAM_n_27 : STD_LOGIC;
  signal A_RAM_n_28 : STD_LOGIC;
  signal A_RAM_n_29 : STD_LOGIC;
  signal A_RAM_n_30 : STD_LOGIC;
  signal A_RAM_n_31 : STD_LOGIC;
  signal A_RAM_n_32 : STD_LOGIC;
  signal A_RAM_n_33 : STD_LOGIC;
  signal A_RAM_n_34 : STD_LOGIC;
  signal A_RAM_n_35 : STD_LOGIC;
  signal A_RAM_n_8 : STD_LOGIC;
  signal A_RAM_n_9 : STD_LOGIC;
  signal A_read_address : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal A_read_data_out : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal A_write_en13_out : STD_LOGIC;
  signal B : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal B_RAM_n_1 : STD_LOGIC;
  signal B_RAM_n_15 : STD_LOGIC;
  signal B_RAM_n_16 : STD_LOGIC;
  signal B_RAM_n_17 : STD_LOGIC;
  signal B_RAM_n_18 : STD_LOGIC;
  signal B_RAM_n_19 : STD_LOGIC;
  signal B_RAM_n_2 : STD_LOGIC;
  signal B_RAM_n_20 : STD_LOGIC;
  signal B_RAM_n_21 : STD_LOGIC;
  signal B_RAM_n_22 : STD_LOGIC;
  signal B_RAM_n_23 : STD_LOGIC;
  signal B_RAM_n_24 : STD_LOGIC;
  signal B_RAM_n_25 : STD_LOGIC;
  signal B_RAM_n_26 : STD_LOGIC;
  signal B_RAM_n_27 : STD_LOGIC;
  signal B_RAM_n_28 : STD_LOGIC;
  signal B_RAM_n_29 : STD_LOGIC;
  signal B_RAM_n_3 : STD_LOGIC;
  signal B_RAM_n_30 : STD_LOGIC;
  signal B_RAM_n_31 : STD_LOGIC;
  signal B_RAM_n_32 : STD_LOGIC;
  signal B_RAM_n_33 : STD_LOGIC;
  signal B_RAM_n_34 : STD_LOGIC;
  signal B_RAM_n_35 : STD_LOGIC;
  signal B_RAM_n_36 : STD_LOGIC;
  signal B_RAM_n_37 : STD_LOGIC;
  signal B_RAM_n_38 : STD_LOGIC;
  signal B_RAM_n_39 : STD_LOGIC;
  signal B_RAM_n_4 : STD_LOGIC;
  signal B_RAM_n_40 : STD_LOGIC;
  signal B_RAM_n_41 : STD_LOGIC;
  signal B_RAM_n_42 : STD_LOGIC;
  signal B_RAM_n_43 : STD_LOGIC;
  signal B_RAM_n_44 : STD_LOGIC;
  signal B_RAM_n_45 : STD_LOGIC;
  signal B_RAM_n_46 : STD_LOGIC;
  signal B_RAM_n_47 : STD_LOGIC;
  signal B_RAM_n_48 : STD_LOGIC;
  signal B_RAM_n_49 : STD_LOGIC;
  signal B_RAM_n_5 : STD_LOGIC;
  signal B_RAM_n_6 : STD_LOGIC;
  signal B_read_en : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[3]_i_2_n_0\ : STD_LOGIC;
  signal M_AXIS_TLAST_i_1_n_0 : STD_LOGIC;
  signal M_AXIS_TLAST_i_2_n_0 : STD_LOGIC;
  signal RES_read_en : STD_LOGIC;
  signal RES_write_en : STD_LOGIC;
  signal \^s_axis_tready\ : STD_LOGIC;
  signal addra : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal dia : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal matrix_multiply_0_n_10 : STD_LOGIC;
  signal matrix_multiply_0_n_11 : STD_LOGIC;
  signal matrix_multiply_0_n_12 : STD_LOGIC;
  signal matrix_multiply_0_n_13 : STD_LOGIC;
  signal matrix_multiply_0_n_14 : STD_LOGIC;
  signal matrix_multiply_0_n_15 : STD_LOGIC;
  signal matrix_multiply_0_n_16 : STD_LOGIC;
  signal matrix_multiply_0_n_17 : STD_LOGIC;
  signal matrix_multiply_0_n_18 : STD_LOGIC;
  signal matrix_multiply_0_n_19 : STD_LOGIC;
  signal matrix_multiply_0_n_31 : STD_LOGIC;
  signal matrix_multiply_0_n_32 : STD_LOGIC;
  signal matrix_multiply_0_n_34 : STD_LOGIC;
  signal matrix_multiply_0_n_42 : STD_LOGIC;
  signal matrix_multiply_0_n_9 : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal read_counter : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \read_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \read_counter[1]_i_1_n_0\ : STD_LOGIC;
  signal \read_counter[2]_i_1_n_0\ : STD_LOGIC;
  signal \read_counter[3]_i_1_n_0\ : STD_LOGIC;
  signal \read_counter[4]_i_1_n_0\ : STD_LOGIC;
  signal \read_counter[5]_i_1_n_0\ : STD_LOGIC;
  signal \read_counter[5]_i_2_n_0\ : STD_LOGIC;
  signal \read_counter[6]_i_1_n_0\ : STD_LOGIC;
  signal \read_counter[7]_i_1_n_0\ : STD_LOGIC;
  signal \read_counter[8]_i_1_n_0\ : STD_LOGIC;
  signal \read_counter[9]_i_2_n_0\ : STD_LOGIC;
  signal \read_counter[9]_i_3_n_0\ : STD_LOGIC;
  signal \read_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \read_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \read_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \read_counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \read_counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \read_counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \read_counter_reg_n_0_[6]\ : STD_LOGIC;
  signal \read_counter_reg_n_0_[7]\ : STD_LOGIC;
  signal \read_counter_reg_n_0_[8]\ : STD_LOGIC;
  signal \read_counter_reg_n_0_[9]\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal write_counter : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \write_counter[0]_i_2_n_0\ : STD_LOGIC;
  signal \write_counter[1]_i_1_n_0\ : STD_LOGIC;
  signal \write_counter[2]_i_1_n_0\ : STD_LOGIC;
  signal \write_counter[3]_i_1_n_0\ : STD_LOGIC;
  signal \write_counter[4]_i_1_n_0\ : STD_LOGIC;
  signal \write_counter[4]_i_2_n_0\ : STD_LOGIC;
  signal \write_counter[5]_i_1_n_0\ : STD_LOGIC;
  signal \write_counter[5]_i_2_n_0\ : STD_LOGIC;
  signal \write_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \write_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \write_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \write_counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \write_counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \write_counter_reg_n_0_[5]\ : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "Read_Inputs:0100,Compute:0010,Write_Outputs:0001,Idle:1000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "Read_Inputs:0100,Compute:0010,Write_Outputs:0001,Idle:1000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "Read_Inputs:0100,Compute:0010,Write_Outputs:0001,Idle:1000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[3]\ : label is "Read_Inputs:0100,Compute:0010,Write_Outputs:0001,Idle:1000";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of M_AXIS_TLAST_i_2 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \read_counter[0]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \read_counter[1]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \read_counter[2]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \read_counter[3]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \read_counter[5]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \read_counter[6]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \read_counter[7]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \read_counter[8]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \write_counter[1]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \write_counter[2]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \write_counter[4]_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \write_counter[5]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \write_counter[5]_i_2\ : label is "soft_lutpair30";
begin
  S_AXIS_TREADY <= \^s_axis_tready\;
A_RAM: entity work.design_1_pl_matmul_0_0_memory_RAM
     port map (
      ACLK => ACLK,
      ADDRARDADDR(8 downto 0) => A_read_address(8 downto 0),
      A_write_en13_out => A_write_en13_out,
      B(7 downto 0) => B(7 downto 0),
      CO(0) => matrix_multiply_0_n_17,
      DI(0) => A_RAM_n_15,
      DOUTADOUT(7 downto 0) => A_read_data_out(7 downto 0),
      E(0) => B_read_en,
      O(1) => matrix_multiply_0_n_15,
      O(0) => matrix_multiply_0_n_16,
      Q(9) => \read_counter_reg_n_0_[9]\,
      Q(8) => \read_counter_reg_n_0_[8]\,
      Q(7) => \read_counter_reg_n_0_[7]\,
      Q(6) => \read_counter_reg_n_0_[6]\,
      Q(5) => \read_counter_reg_n_0_[5]\,
      Q(4) => \read_counter_reg_n_0_[4]\,
      Q(3) => \read_counter_reg_n_0_[3]\,
      Q(2) => \read_counter_reg_n_0_[2]\,
      Q(1) => \read_counter_reg_n_0_[1]\,
      Q(0) => \read_counter_reg_n_0_[0]\,
      RAM_reg_bram_0_0 => A_RAM_n_8,
      RAM_reg_bram_0_1 => A_RAM_n_9,
      RAM_reg_bram_0_10(0) => A_RAM_n_24,
      RAM_reg_bram_0_11 => A_RAM_n_25,
      RAM_reg_bram_0_12 => A_RAM_n_26,
      RAM_reg_bram_0_13 => A_RAM_n_27,
      RAM_reg_bram_0_14 => A_RAM_n_28,
      RAM_reg_bram_0_15 => A_RAM_n_29,
      RAM_reg_bram_0_16 => A_RAM_n_30,
      RAM_reg_bram_0_17 => A_RAM_n_31,
      RAM_reg_bram_0_18(0) => A_RAM_n_32,
      RAM_reg_bram_0_19(0) => A_RAM_n_33,
      RAM_reg_bram_0_2 => A_RAM_n_10,
      RAM_reg_bram_0_20(0) => A_RAM_n_34,
      RAM_reg_bram_0_21(0) => A_RAM_n_35,
      RAM_reg_bram_0_3 => A_RAM_n_11,
      RAM_reg_bram_0_4 => A_RAM_n_16,
      RAM_reg_bram_0_5 => A_RAM_n_17,
      RAM_reg_bram_0_6 => A_RAM_n_18,
      RAM_reg_bram_0_7 => A_RAM_n_19,
      RAM_reg_bram_0_8(2) => A_RAM_n_20,
      RAM_reg_bram_0_8(1) => A_RAM_n_21,
      RAM_reg_bram_0_8(0) => A_RAM_n_22,
      RAM_reg_bram_0_9(0) => A_RAM_n_23,
      S(2) => A_RAM_n_12,
      S(1) => A_RAM_n_13,
      S(0) => A_RAM_n_14,
      S_AXIS_TDATA(7 downto 0) => S_AXIS_TDATA(7 downto 0),
      S_AXIS_TREADY => \^s_axis_tready\,
      S_AXIS_TVALID => S_AXIS_TVALID,
      \mul0__60_carry\(0) => matrix_multiply_0_n_9,
      \mul0__60_carry_0\ => B_RAM_n_26,
      \mul0__60_carry_1\ => matrix_multiply_0_n_32,
      \mul0__60_carry_2\ => B_RAM_n_28,
      \mul0__60_carry_3\(0) => matrix_multiply_0_n_12
    );
B_RAM: entity work.\design_1_pl_matmul_0_0_memory_RAM__parameterized0\
     port map (
      ACLK => ACLK,
      A_write_en13_out => A_write_en13_out,
      CO(0) => matrix_multiply_0_n_10,
      DI(5) => B_RAM_n_1,
      DI(4) => B_RAM_n_2,
      DI(3) => B_RAM_n_3,
      DI(2) => B_RAM_n_4,
      DI(1) => B_RAM_n_5,
      DI(0) => B_RAM_n_6,
      DOUTADOUT(7 downto 0) => A_read_data_out(7 downto 0),
      E(0) => B_read_en,
      O(2) => matrix_multiply_0_n_13,
      O(1) => matrix_multiply_0_n_14,
      O(0) => matrix_multiply_0_n_15,
      Q(7) => \read_counter_reg_n_0_[9]\,
      Q(6) => \read_counter_reg_n_0_[8]\,
      Q(5) => \read_counter_reg_n_0_[7]\,
      Q(4) => \read_counter_reg_n_0_[6]\,
      Q(3) => \read_counter_reg_n_0_[3]\,
      Q(2) => \read_counter_reg_n_0_[2]\,
      Q(1) => \read_counter_reg_n_0_[1]\,
      Q(0) => \read_counter_reg_n_0_[0]\,
      RAM_reg_bram_0 => B_RAM_n_25,
      RAM_reg_bram_0_0 => B_RAM_n_28,
      RAM_reg_bram_0_1(0) => B_RAM_n_45,
      RAM_reg_bram_0_2 => matrix_multiply_0_n_34,
      S(4) => B_RAM_n_33,
      S(3) => B_RAM_n_34,
      S(2) => B_RAM_n_35,
      S(1) => B_RAM_n_36,
      S(0) => B_RAM_n_37,
      S_AXIS_TDATA(7 downto 0) => S_AXIS_TDATA(7 downto 0),
      S_AXIS_TREADY => \^s_axis_tready\,
      S_AXIS_TVALID => S_AXIS_TVALID,
      \dob_reg[1]_0\(0) => B_RAM_n_38,
      \dob_reg[1]_1\(2 downto 0) => A_read_address(2 downto 0),
      \dob_reg[2]_0\(1) => B_RAM_n_15,
      \dob_reg[2]_0\(0) => B_RAM_n_16,
      \dob_reg[3]_0\(5) => B_RAM_n_17,
      \dob_reg[3]_0\(4) => B_RAM_n_18,
      \dob_reg[3]_0\(3) => B_RAM_n_19,
      \dob_reg[3]_0\(2) => B_RAM_n_20,
      \dob_reg[3]_0\(1) => B_RAM_n_21,
      \dob_reg[3]_0\(0) => B_RAM_n_22,
      \dob_reg[4]_0\(4) => B_RAM_n_39,
      \dob_reg[4]_0\(3) => B_RAM_n_40,
      \dob_reg[4]_0\(2) => B_RAM_n_41,
      \dob_reg[4]_0\(1) => B_RAM_n_42,
      \dob_reg[4]_0\(0) => B_RAM_n_43,
      \dob_reg[4]_1\(0) => B_RAM_n_44,
      \dob_reg[5]_0\(1) => B_RAM_n_23,
      \dob_reg[5]_0\(0) => B_RAM_n_24,
      \dob_reg[6]_0\(0) => B_RAM_n_27,
      \dob_reg[6]_1\(3) => B_RAM_n_46,
      \dob_reg[6]_1\(2) => B_RAM_n_47,
      \dob_reg[6]_1\(1) => B_RAM_n_48,
      \dob_reg[6]_1\(0) => B_RAM_n_49,
      \dob_reg[7]_0\(7 downto 0) => B(7 downto 0),
      \dob_reg[7]_1\ => B_RAM_n_26,
      \dob_reg[7]_2\(3) => B_RAM_n_29,
      \dob_reg[7]_2\(2) => B_RAM_n_30,
      \dob_reg[7]_2\(1) => B_RAM_n_31,
      \dob_reg[7]_2\(0) => B_RAM_n_32,
      \mul0__0_carry\ => A_RAM_n_8,
      \mul0__0_carry_0\ => A_RAM_n_9,
      \mul0__0_carry_1\ => A_RAM_n_10,
      \mul0__0_carry_2\ => A_RAM_n_11,
      \mul0__30_carry\ => A_RAM_n_16,
      \mul0__30_carry_0\ => A_RAM_n_17,
      \mul0__30_carry_1\ => A_RAM_n_18,
      \mul0__30_carry_2\ => A_RAM_n_19,
      \mul0__60_carry\ => A_RAM_n_25,
      \mul0__60_carry_0\ => A_RAM_n_26,
      \mul0__60_carry__0\ => A_RAM_n_27,
      \mul0__60_carry__0_0\ => A_RAM_n_28,
      \mul0__60_carry__0_1\ => A_RAM_n_29,
      \mul0__60_carry__0_2\ => A_RAM_n_30,
      \mul0__60_carry__0_3\ => A_RAM_n_31,
      \mul0__60_carry__0_i_1_0\(0) => matrix_multiply_0_n_17,
      \mul0__60_carry__0_i_2_0\(1) => matrix_multiply_0_n_18,
      \mul0__60_carry__0_i_2_0\(0) => matrix_multiply_0_n_19,
      \mul0__60_carry__0_i_9_0\(1) => matrix_multiply_0_n_11,
      \mul0__60_carry__0_i_9_0\(0) => matrix_multiply_0_n_12
    );
\FSM_onehot_state[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => S_AXIS_TVALID,
      I1 => state(3),
      I2 => \FSM_onehot_state[2]_i_3_n_0\,
      I3 => \^s_axis_tready\,
      O => next_state(2)
    );
\FSM_onehot_state[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF08000000"
    )
        port map (
      I0 => \read_counter_reg_n_0_[1]\,
      I1 => \read_counter_reg_n_0_[0]\,
      I2 => \read_counter_reg_n_0_[3]\,
      I3 => \read_counter_reg_n_0_[2]\,
      I4 => \FSM_onehot_state[2]_i_4_n_0\,
      I5 => S_AXIS_TLAST,
      O => \FSM_onehot_state[2]_i_3_n_0\
    );
\FSM_onehot_state[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => \read_counter_reg_n_0_[4]\,
      I1 => \read_counter_reg_n_0_[5]\,
      I2 => \read_counter_reg_n_0_[6]\,
      I3 => \read_counter_reg_n_0_[7]\,
      I4 => \read_counter_reg_n_0_[8]\,
      I5 => \read_counter_reg_n_0_[9]\,
      O => \FSM_onehot_state[2]_i_4_n_0\
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => S_AXIS_TVALID,
      I1 => state(3),
      I2 => \FSM_onehot_state[3]_i_2_n_0\,
      I3 => state(0),
      O => next_state(3)
    );
\FSM_onehot_state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \write_counter_reg_n_0_[2]\,
      I1 => \write_counter_reg_n_0_[0]\,
      I2 => \write_counter_reg_n_0_[1]\,
      I3 => \write_counter_reg_n_0_[3]\,
      I4 => \write_counter_reg_n_0_[4]\,
      I5 => \write_counter_reg_n_0_[5]\,
      O => \FSM_onehot_state[3]_i_2_n_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => next_state(0),
      Q => state(0),
      R => matrix_multiply_0_n_31
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => next_state(1),
      Q => state(1),
      R => matrix_multiply_0_n_31
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => next_state(2),
      Q => \^s_axis_tready\,
      R => matrix_multiply_0_n_31
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => next_state(3),
      Q => state(3),
      S => matrix_multiply_0_n_31
    );
M_AXIS_TLAST_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => state(0),
      I1 => \write_counter_reg_n_0_[5]\,
      I2 => \write_counter_reg_n_0_[4]\,
      I3 => \write_counter_reg_n_0_[3]\,
      I4 => M_AXIS_TLAST_i_2_n_0,
      I5 => \write_counter_reg_n_0_[2]\,
      O => M_AXIS_TLAST_i_1_n_0
    );
M_AXIS_TLAST_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \write_counter_reg_n_0_[0]\,
      I1 => \write_counter_reg_n_0_[1]\,
      O => M_AXIS_TLAST_i_2_n_0
    );
M_AXIS_TLAST_reg: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => '1',
      D => M_AXIS_TLAST_i_1_n_0,
      Q => M_AXIS_TLAST,
      R => '0'
    );
M_AXIS_TVALID_reg: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => '1',
      D => matrix_multiply_0_n_42,
      Q => M_AXIS_TVALID,
      R => '0'
    );
RES_RAM: entity work.\design_1_pl_matmul_0_0_memory_RAM__parameterized1\
     port map (
      ACLK => ACLK,
      E(0) => RES_read_en,
      M_AXIS_TDATA(7 downto 0) => M_AXIS_TDATA(7 downto 0),
      Q(5 downto 0) => addra(5 downto 0),
      RES_write_en => RES_write_en,
      dia(7 downto 0) => dia(7 downto 0),
      \dob_reg[0]_0\ => \write_counter_reg_n_0_[0]\,
      \dob_reg[0]_1\ => \write_counter_reg_n_0_[1]\,
      \dob_reg[0]_2\ => \write_counter_reg_n_0_[2]\,
      \dob_reg[0]_3\ => \write_counter_reg_n_0_[3]\,
      \dob_reg[0]_4\ => \write_counter_reg_n_0_[4]\,
      \dob_reg[0]_5\ => \write_counter_reg_n_0_[5]\
    );
matrix_multiply_0: entity work.design_1_pl_matmul_0_0_matrix_multiply
     port map (
      ACLK => ACLK,
      ADDRARDADDR(8 downto 0) => A_read_address(8 downto 0),
      ARESETN => ARESETN,
      ARESETN_0 => matrix_multiply_0_n_31,
      CO(0) => matrix_multiply_0_n_10,
      D(1 downto 0) => next_state(1 downto 0),
      DI(6) => B_RAM_n_1,
      DI(5) => B_RAM_n_2,
      DI(4) => B_RAM_n_3,
      DI(3) => B_RAM_n_4,
      DI(2) => B_RAM_n_5,
      DI(1) => B_RAM_n_6,
      DI(0) => A_RAM_n_15,
      DOUTADOUT(2 downto 0) => A_read_data_out(2 downto 0),
      E(0) => B_read_en,
      \FSM_onehot_state_reg[0]_0\ => matrix_multiply_0_n_42,
      \FSM_onehot_state_reg[0]_1\ => \FSM_onehot_state[3]_i_2_n_0\,
      \FSM_onehot_state_reg[1]_0\ => \FSM_onehot_state[2]_i_3_n_0\,
      M_AXIS_TREADY => M_AXIS_TREADY,
      M_AXIS_TREADY_0(0) => RES_read_en,
      O(3) => matrix_multiply_0_n_13,
      O(2) => matrix_multiply_0_n_14,
      O(1) => matrix_multiply_0_n_15,
      O(0) => matrix_multiply_0_n_16,
      Q(3) => state(3),
      Q(2) => \^s_axis_tready\,
      Q(1 downto 0) => state(1 downto 0),
      RAM_reg_bram_0_i_3_0(9) => \read_counter_reg_n_0_[9]\,
      RAM_reg_bram_0_i_3_0(8) => \read_counter_reg_n_0_[8]\,
      RAM_reg_bram_0_i_3_0(7) => \read_counter_reg_n_0_[7]\,
      RAM_reg_bram_0_i_3_0(6) => \read_counter_reg_n_0_[6]\,
      RAM_reg_bram_0_i_3_0(5) => \read_counter_reg_n_0_[5]\,
      RAM_reg_bram_0_i_3_0(4) => \read_counter_reg_n_0_[4]\,
      RAM_reg_bram_0_i_3_0(3) => \read_counter_reg_n_0_[3]\,
      RAM_reg_bram_0_i_3_0(2) => \read_counter_reg_n_0_[2]\,
      RAM_reg_bram_0_i_3_0(1) => \read_counter_reg_n_0_[1]\,
      RAM_reg_bram_0_i_3_0(0) => \read_counter_reg_n_0_[0]\,
      \RES_write_address_reg[5]_0\(5 downto 0) => addra(5 downto 0),
      RES_write_en => RES_write_en,
      S(7) => B_RAM_n_33,
      S(6) => B_RAM_n_34,
      S(5) => B_RAM_n_35,
      S(4) => B_RAM_n_36,
      S(3) => A_RAM_n_12,
      S(2) => A_RAM_n_13,
      S(1) => B_RAM_n_37,
      S(0) => A_RAM_n_14,
      \acc[0]_i_6_0\(1) => B_RAM_n_27,
      \acc[0]_i_6_0\(0) => A_RAM_n_24,
      \acc[0]_i_6_1\(1) => B_RAM_n_45,
      \acc[0]_i_6_1\(0) => A_RAM_n_35,
      \acc[8]_i_5_0\(3) => B_RAM_n_29,
      \acc[8]_i_5_0\(2) => B_RAM_n_30,
      \acc[8]_i_5_0\(1) => B_RAM_n_31,
      \acc[8]_i_5_0\(0) => B_RAM_n_32,
      \acc[8]_i_5_1\(4) => A_RAM_n_32,
      \acc[8]_i_5_1\(3) => B_RAM_n_46,
      \acc[8]_i_5_1\(2) => B_RAM_n_47,
      \acc[8]_i_5_1\(1) => B_RAM_n_48,
      \acc[8]_i_5_1\(0) => B_RAM_n_49,
      dia(7 downto 0) => dia(7 downto 0),
      \dob_reg[0]\(0) => matrix_multiply_0_n_9,
      \dob_reg[2]\(1) => matrix_multiply_0_n_11,
      \dob_reg[2]\(0) => matrix_multiply_0_n_12,
      \dob_reg[5]\(0) => matrix_multiply_0_n_17,
      \dob_reg[5]_0\(1) => matrix_multiply_0_n_18,
      \dob_reg[5]_0\(0) => matrix_multiply_0_n_19,
      \dob_reg[6]\ => matrix_multiply_0_n_32,
      \mul0__60_carry_0\(1 downto 0) => B(7 downto 6),
      \mul0__60_carry_1\ => B_RAM_n_26,
      \mul0__60_carry_2\ => B_RAM_n_25,
      \mul0__60_carry__0_i_15\(1) => B_RAM_n_23,
      \mul0__60_carry__0_i_15\(0) => B_RAM_n_24,
      \mul0__60_carry__0_i_15_0\(1) => B_RAM_n_44,
      \mul0__60_carry__0_i_15_0\(0) => A_RAM_n_34,
      \mul0__60_carry_i_13_0\(6) => B_RAM_n_17,
      \mul0__60_carry_i_13_0\(5) => B_RAM_n_18,
      \mul0__60_carry_i_13_0\(4) => B_RAM_n_19,
      \mul0__60_carry_i_13_0\(3) => B_RAM_n_20,
      \mul0__60_carry_i_13_0\(2) => B_RAM_n_21,
      \mul0__60_carry_i_13_0\(1) => B_RAM_n_22,
      \mul0__60_carry_i_13_0\(0) => A_RAM_n_23,
      \mul0__60_carry_i_13_1\(7) => B_RAM_n_39,
      \mul0__60_carry_i_13_1\(6) => B_RAM_n_40,
      \mul0__60_carry_i_13_1\(5) => B_RAM_n_41,
      \mul0__60_carry_i_13_1\(4) => B_RAM_n_42,
      \mul0__60_carry_i_13_1\(3) => A_RAM_n_20,
      \mul0__60_carry_i_13_1\(2) => A_RAM_n_21,
      \mul0__60_carry_i_13_1\(1) => B_RAM_n_43,
      \mul0__60_carry_i_13_1\(0) => A_RAM_n_22,
      \mul0__60_carry_i_7\(1) => B_RAM_n_15,
      \mul0__60_carry_i_7\(0) => B_RAM_n_16,
      \mul0__60_carry_i_7_0\(1) => B_RAM_n_38,
      \mul0__60_carry_i_7_0\(0) => A_RAM_n_33,
      \read_counter_reg[4]\ => matrix_multiply_0_n_34,
      write_counter(0) => write_counter(0)
    );
\read_counter[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^s_axis_tready\,
      I1 => \read_counter_reg_n_0_[0]\,
      O => \read_counter[0]_i_1_n_0\
    );
\read_counter[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => \read_counter_reg_n_0_[0]\,
      I1 => \^s_axis_tready\,
      I2 => \read_counter_reg_n_0_[1]\,
      O => \read_counter[1]_i_1_n_0\
    );
\read_counter[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
        port map (
      I0 => \read_counter_reg_n_0_[1]\,
      I1 => \read_counter_reg_n_0_[0]\,
      I2 => \^s_axis_tready\,
      I3 => \read_counter_reg_n_0_[2]\,
      O => \read_counter[2]_i_1_n_0\
    );
\read_counter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F008000"
    )
        port map (
      I0 => \read_counter_reg_n_0_[2]\,
      I1 => \read_counter_reg_n_0_[0]\,
      I2 => \read_counter_reg_n_0_[1]\,
      I3 => \^s_axis_tready\,
      I4 => \read_counter_reg_n_0_[3]\,
      O => \read_counter[3]_i_1_n_0\
    );
\read_counter[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
        port map (
      I0 => \read_counter_reg_n_0_[3]\,
      I1 => \read_counter_reg_n_0_[1]\,
      I2 => \read_counter_reg_n_0_[0]\,
      I3 => \read_counter_reg_n_0_[2]\,
      I4 => \^s_axis_tready\,
      I5 => \read_counter_reg_n_0_[4]\,
      O => \read_counter[4]_i_1_n_0\
    );
\read_counter[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => \read_counter[5]_i_2_n_0\,
      I1 => \^s_axis_tready\,
      I2 => \read_counter_reg_n_0_[5]\,
      O => \read_counter[5]_i_1_n_0\
    );
\read_counter[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \read_counter_reg_n_0_[4]\,
      I1 => \read_counter_reg_n_0_[2]\,
      I2 => \read_counter_reg_n_0_[0]\,
      I3 => \read_counter_reg_n_0_[1]\,
      I4 => \read_counter_reg_n_0_[3]\,
      O => \read_counter[5]_i_2_n_0\
    );
\read_counter[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => \read_counter[9]_i_3_n_0\,
      I1 => \^s_axis_tready\,
      I2 => \read_counter_reg_n_0_[6]\,
      O => \read_counter[6]_i_1_n_0\
    );
\read_counter[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
        port map (
      I0 => \read_counter_reg_n_0_[6]\,
      I1 => \read_counter[9]_i_3_n_0\,
      I2 => \^s_axis_tready\,
      I3 => \read_counter_reg_n_0_[7]\,
      O => \read_counter[7]_i_1_n_0\
    );
\read_counter[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F008000"
    )
        port map (
      I0 => \read_counter_reg_n_0_[7]\,
      I1 => \read_counter[9]_i_3_n_0\,
      I2 => \read_counter_reg_n_0_[6]\,
      I3 => \^s_axis_tready\,
      I4 => \read_counter_reg_n_0_[8]\,
      O => \read_counter[8]_i_1_n_0\
    );
\read_counter[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => S_AXIS_TVALID,
      I1 => \^s_axis_tready\,
      I2 => state(3),
      O => read_counter(0)
    );
\read_counter[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
        port map (
      I0 => \read_counter_reg_n_0_[8]\,
      I1 => \read_counter_reg_n_0_[6]\,
      I2 => \read_counter[9]_i_3_n_0\,
      I3 => \read_counter_reg_n_0_[7]\,
      I4 => \^s_axis_tready\,
      I5 => \read_counter_reg_n_0_[9]\,
      O => \read_counter[9]_i_2_n_0\
    );
\read_counter[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \read_counter_reg_n_0_[5]\,
      I1 => \read_counter_reg_n_0_[3]\,
      I2 => \read_counter_reg_n_0_[1]\,
      I3 => \read_counter_reg_n_0_[0]\,
      I4 => \read_counter_reg_n_0_[2]\,
      I5 => \read_counter_reg_n_0_[4]\,
      O => \read_counter[9]_i_3_n_0\
    );
\read_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => read_counter(0),
      D => \read_counter[0]_i_1_n_0\,
      Q => \read_counter_reg_n_0_[0]\,
      R => matrix_multiply_0_n_31
    );
\read_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => read_counter(0),
      D => \read_counter[1]_i_1_n_0\,
      Q => \read_counter_reg_n_0_[1]\,
      R => matrix_multiply_0_n_31
    );
\read_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => read_counter(0),
      D => \read_counter[2]_i_1_n_0\,
      Q => \read_counter_reg_n_0_[2]\,
      R => matrix_multiply_0_n_31
    );
\read_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => read_counter(0),
      D => \read_counter[3]_i_1_n_0\,
      Q => \read_counter_reg_n_0_[3]\,
      R => matrix_multiply_0_n_31
    );
\read_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => read_counter(0),
      D => \read_counter[4]_i_1_n_0\,
      Q => \read_counter_reg_n_0_[4]\,
      R => matrix_multiply_0_n_31
    );
\read_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => read_counter(0),
      D => \read_counter[5]_i_1_n_0\,
      Q => \read_counter_reg_n_0_[5]\,
      R => matrix_multiply_0_n_31
    );
\read_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => read_counter(0),
      D => \read_counter[6]_i_1_n_0\,
      Q => \read_counter_reg_n_0_[6]\,
      R => matrix_multiply_0_n_31
    );
\read_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => read_counter(0),
      D => \read_counter[7]_i_1_n_0\,
      Q => \read_counter_reg_n_0_[7]\,
      R => matrix_multiply_0_n_31
    );
\read_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => read_counter(0),
      D => \read_counter[8]_i_1_n_0\,
      Q => \read_counter_reg_n_0_[8]\,
      R => matrix_multiply_0_n_31
    );
\read_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => read_counter(0),
      D => \read_counter[9]_i_2_n_0\,
      Q => \read_counter_reg_n_0_[9]\,
      R => matrix_multiply_0_n_31
    );
\write_counter[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => \write_counter_reg_n_0_[0]\,
      O => \write_counter[0]_i_2_n_0\
    );
\write_counter[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0EE0"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => \write_counter_reg_n_0_[0]\,
      I3 => \write_counter_reg_n_0_[1]\,
      O => \write_counter[1]_i_1_n_0\
    );
\write_counter[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0EEEE000"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => \write_counter_reg_n_0_[1]\,
      I3 => \write_counter_reg_n_0_[0]\,
      I4 => \write_counter_reg_n_0_[2]\,
      O => \write_counter[2]_i_1_n_0\
    );
\write_counter[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F7F0080808000"
    )
        port map (
      I0 => \write_counter_reg_n_0_[2]\,
      I1 => \write_counter_reg_n_0_[0]\,
      I2 => \write_counter_reg_n_0_[1]\,
      I3 => state(1),
      I4 => state(0),
      I5 => \write_counter_reg_n_0_[3]\,
      O => \write_counter[3]_i_1_n_0\
    );
\write_counter[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
        port map (
      I0 => \write_counter_reg_n_0_[3]\,
      I1 => \write_counter_reg_n_0_[1]\,
      I2 => \write_counter_reg_n_0_[0]\,
      I3 => \write_counter_reg_n_0_[2]\,
      I4 => \write_counter[4]_i_2_n_0\,
      I5 => \write_counter_reg_n_0_[4]\,
      O => \write_counter[4]_i_1_n_0\
    );
\write_counter[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      O => \write_counter[4]_i_2_n_0\
    );
\write_counter[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"77708880"
    )
        port map (
      I0 => \write_counter_reg_n_0_[4]\,
      I1 => \write_counter[5]_i_2_n_0\,
      I2 => state(1),
      I3 => state(0),
      I4 => \write_counter_reg_n_0_[5]\,
      O => \write_counter[5]_i_1_n_0\
    );
\write_counter[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \write_counter_reg_n_0_[3]\,
      I1 => \write_counter_reg_n_0_[1]\,
      I2 => \write_counter_reg_n_0_[0]\,
      I3 => \write_counter_reg_n_0_[2]\,
      O => \write_counter[5]_i_2_n_0\
    );
\write_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => write_counter(0),
      D => \write_counter[0]_i_2_n_0\,
      Q => \write_counter_reg_n_0_[0]\,
      R => matrix_multiply_0_n_31
    );
\write_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => write_counter(0),
      D => \write_counter[1]_i_1_n_0\,
      Q => \write_counter_reg_n_0_[1]\,
      R => matrix_multiply_0_n_31
    );
\write_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => write_counter(0),
      D => \write_counter[2]_i_1_n_0\,
      Q => \write_counter_reg_n_0_[2]\,
      R => matrix_multiply_0_n_31
    );
\write_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => write_counter(0),
      D => \write_counter[3]_i_1_n_0\,
      Q => \write_counter_reg_n_0_[3]\,
      R => matrix_multiply_0_n_31
    );
\write_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => write_counter(0),
      D => \write_counter[4]_i_1_n_0\,
      Q => \write_counter_reg_n_0_[4]\,
      R => matrix_multiply_0_n_31
    );
\write_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => write_counter(0),
      D => \write_counter[5]_i_1_n_0\,
      Q => \write_counter_reg_n_0_[5]\,
      R => matrix_multiply_0_n_31
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_pl_matmul_0_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    S_AXIS_TREADY : out STD_LOGIC;
    S_AXIS_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_TLAST : in STD_LOGIC;
    S_AXIS_TVALID : in STD_LOGIC;
    M_AXIS_TVALID : out STD_LOGIC;
    M_AXIS_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_TLAST : out STD_LOGIC;
    M_AXIS_TREADY : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_pl_matmul_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_pl_matmul_0_0 : entity is "design_1_pl_matmul_0_0,myip_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_pl_matmul_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_pl_matmul_0_0 : entity is "myip_v1_0,Vivado 2025.2";
end design_1_pl_matmul_0_0;

architecture STRUCTURE of design_1_pl_matmul_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^m_axis_tdata\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ACLK : signal is "xilinx.com:signal:clock:1.0 ACLK CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of ACLK : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ACLK : signal is "XIL_INTERFACENAME ACLK, ASSOCIATED_RESET ARESETN, ASSOCIATED_BUSIF S_AXIS:M_AXIS, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ARESETN : signal is "xilinx.com:signal:reset:1.0 ARESETN RST";
  attribute X_INTERFACE_MODE of ARESETN : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ARESETN : signal is "XIL_INTERFACENAME ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of M_AXIS_TLAST : signal is "xilinx.com:interface:axis:1.0 M_AXIS TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_TREADY : signal is "xilinx.com:interface:axis:1.0 M_AXIS TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_TVALID : signal is "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
  attribute X_INTERFACE_MODE of M_AXIS_TVALID : signal is "master";
  attribute X_INTERFACE_PARAMETER of M_AXIS_TVALID : signal is "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_AXIS_TLAST : signal is "xilinx.com:interface:axis:1.0 S_AXIS TLAST";
  attribute X_INTERFACE_INFO of S_AXIS_TREADY : signal is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
  attribute X_INTERFACE_MODE of S_AXIS_TREADY : signal is "slave";
  attribute X_INTERFACE_PARAMETER of S_AXIS_TREADY : signal is "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_AXIS_TVALID : signal is "xilinx.com:interface:axis:1.0 S_AXIS TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_TDATA : signal is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of S_AXIS_TDATA : signal is "xilinx.com:interface:axis:1.0 S_AXIS TDATA";
begin
  M_AXIS_TDATA(31) <= \<const0>\;
  M_AXIS_TDATA(30) <= \<const0>\;
  M_AXIS_TDATA(29) <= \<const0>\;
  M_AXIS_TDATA(28) <= \<const0>\;
  M_AXIS_TDATA(27) <= \<const0>\;
  M_AXIS_TDATA(26) <= \<const0>\;
  M_AXIS_TDATA(25) <= \<const0>\;
  M_AXIS_TDATA(24) <= \<const0>\;
  M_AXIS_TDATA(23) <= \<const0>\;
  M_AXIS_TDATA(22) <= \<const0>\;
  M_AXIS_TDATA(21) <= \<const0>\;
  M_AXIS_TDATA(20) <= \<const0>\;
  M_AXIS_TDATA(19) <= \<const0>\;
  M_AXIS_TDATA(18) <= \<const0>\;
  M_AXIS_TDATA(17) <= \<const0>\;
  M_AXIS_TDATA(16) <= \<const0>\;
  M_AXIS_TDATA(15) <= \<const0>\;
  M_AXIS_TDATA(14) <= \<const0>\;
  M_AXIS_TDATA(13) <= \<const0>\;
  M_AXIS_TDATA(12) <= \<const0>\;
  M_AXIS_TDATA(11) <= \<const0>\;
  M_AXIS_TDATA(10) <= \<const0>\;
  M_AXIS_TDATA(9) <= \<const0>\;
  M_AXIS_TDATA(8) <= \<const0>\;
  M_AXIS_TDATA(7 downto 0) <= \^m_axis_tdata\(7 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.design_1_pl_matmul_0_0_myip_v1_0
     port map (
      ACLK => ACLK,
      ARESETN => ARESETN,
      M_AXIS_TDATA(7 downto 0) => \^m_axis_tdata\(7 downto 0),
      M_AXIS_TLAST => M_AXIS_TLAST,
      M_AXIS_TREADY => M_AXIS_TREADY,
      M_AXIS_TVALID => M_AXIS_TVALID,
      S_AXIS_TDATA(7 downto 0) => S_AXIS_TDATA(7 downto 0),
      S_AXIS_TLAST => S_AXIS_TLAST,
      S_AXIS_TREADY => S_AXIS_TREADY,
      S_AXIS_TVALID => S_AXIS_TVALID
    );
end STRUCTURE;
