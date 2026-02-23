# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"


}

proc update_PARAM_VALUE.NUMBER_OF_A_ROWS { PARAM_VALUE.NUMBER_OF_A_ROWS } {
	# Procedure called to update NUMBER_OF_A_ROWS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_A_ROWS { PARAM_VALUE.NUMBER_OF_A_ROWS } {
	# Procedure called to validate NUMBER_OF_A_ROWS
	return true
}

proc update_PARAM_VALUE.NUMBER_OF_A_WORDS { PARAM_VALUE.NUMBER_OF_A_WORDS } {
	# Procedure called to update NUMBER_OF_A_WORDS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_A_WORDS { PARAM_VALUE.NUMBER_OF_A_WORDS } {
	# Procedure called to validate NUMBER_OF_A_WORDS
	return true
}

proc update_PARAM_VALUE.NUMBER_OF_B_COLS { PARAM_VALUE.NUMBER_OF_B_COLS } {
	# Procedure called to update NUMBER_OF_B_COLS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_B_COLS { PARAM_VALUE.NUMBER_OF_B_COLS } {
	# Procedure called to validate NUMBER_OF_B_COLS
	return true
}

proc update_PARAM_VALUE.NUMBER_OF_B_WORDS { PARAM_VALUE.NUMBER_OF_B_WORDS } {
	# Procedure called to update NUMBER_OF_B_WORDS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_B_WORDS { PARAM_VALUE.NUMBER_OF_B_WORDS } {
	# Procedure called to validate NUMBER_OF_B_WORDS
	return true
}

proc update_PARAM_VALUE.NUMBER_OF_INNER_DIMENSIONS { PARAM_VALUE.NUMBER_OF_INNER_DIMENSIONS } {
	# Procedure called to update NUMBER_OF_INNER_DIMENSIONS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_INNER_DIMENSIONS { PARAM_VALUE.NUMBER_OF_INNER_DIMENSIONS } {
	# Procedure called to validate NUMBER_OF_INNER_DIMENSIONS
	return true
}

proc update_PARAM_VALUE.NUMBER_OF_INPUT_WORDS { PARAM_VALUE.NUMBER_OF_INPUT_WORDS } {
	# Procedure called to update NUMBER_OF_INPUT_WORDS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_INPUT_WORDS { PARAM_VALUE.NUMBER_OF_INPUT_WORDS } {
	# Procedure called to validate NUMBER_OF_INPUT_WORDS
	return true
}

proc update_PARAM_VALUE.NUMBER_OF_OUTPUT_WORDS { PARAM_VALUE.NUMBER_OF_OUTPUT_WORDS } {
	# Procedure called to update NUMBER_OF_OUTPUT_WORDS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_OUTPUT_WORDS { PARAM_VALUE.NUMBER_OF_OUTPUT_WORDS } {
	# Procedure called to validate NUMBER_OF_OUTPUT_WORDS
	return true
}


proc update_MODELPARAM_VALUE.NUMBER_OF_A_ROWS { MODELPARAM_VALUE.NUMBER_OF_A_ROWS PARAM_VALUE.NUMBER_OF_A_ROWS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_A_ROWS}] ${MODELPARAM_VALUE.NUMBER_OF_A_ROWS}
}

proc update_MODELPARAM_VALUE.NUMBER_OF_INNER_DIMENSIONS { MODELPARAM_VALUE.NUMBER_OF_INNER_DIMENSIONS PARAM_VALUE.NUMBER_OF_INNER_DIMENSIONS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_INNER_DIMENSIONS}] ${MODELPARAM_VALUE.NUMBER_OF_INNER_DIMENSIONS}
}

proc update_MODELPARAM_VALUE.NUMBER_OF_B_COLS { MODELPARAM_VALUE.NUMBER_OF_B_COLS PARAM_VALUE.NUMBER_OF_B_COLS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_B_COLS}] ${MODELPARAM_VALUE.NUMBER_OF_B_COLS}
}

proc update_MODELPARAM_VALUE.NUMBER_OF_A_WORDS { MODELPARAM_VALUE.NUMBER_OF_A_WORDS PARAM_VALUE.NUMBER_OF_A_WORDS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_A_WORDS}] ${MODELPARAM_VALUE.NUMBER_OF_A_WORDS}
}

proc update_MODELPARAM_VALUE.NUMBER_OF_B_WORDS { MODELPARAM_VALUE.NUMBER_OF_B_WORDS PARAM_VALUE.NUMBER_OF_B_WORDS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_B_WORDS}] ${MODELPARAM_VALUE.NUMBER_OF_B_WORDS}
}

proc update_MODELPARAM_VALUE.NUMBER_OF_INPUT_WORDS { MODELPARAM_VALUE.NUMBER_OF_INPUT_WORDS PARAM_VALUE.NUMBER_OF_INPUT_WORDS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_INPUT_WORDS}] ${MODELPARAM_VALUE.NUMBER_OF_INPUT_WORDS}
}

proc update_MODELPARAM_VALUE.NUMBER_OF_OUTPUT_WORDS { MODELPARAM_VALUE.NUMBER_OF_OUTPUT_WORDS PARAM_VALUE.NUMBER_OF_OUTPUT_WORDS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_OUTPUT_WORDS}] ${MODELPARAM_VALUE.NUMBER_OF_OUTPUT_WORDS}
}

