###################################################################

# Created by write_sdc on Sun Mar 29 15:39:57 2015

###################################################################
set sdc_version 1.9

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports ph1]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports ph2]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports reset]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[17]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[16]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[15]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[14]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[13]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[12]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[11]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[10]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[9]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[8]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[7]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[6]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[5]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[4]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[3]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[2]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[1]}]
set_driving_cell -lib_cell inv_4x -library muddlib [get_ports {registers[0]}]
set_load -pin_load 0.0349584 [get_ports {xoro[1]}]
set_load -pin_load 0.0349584 [get_ports {xoro[0]}]
set_load -pin_load 0.0349584 [get_ports {row[1]}]
set_load -pin_load 0.0349584 [get_ports {row[0]}]
set_load -pin_load 0.0349584 [get_ports {col[1]}]
set_load -pin_load 0.0349584 [get_ports {col[0]}]
create_clock [get_ports ph1]  -period 10  -waveform {0 5}
set_input_delay -clock ph1  0.5  [get_ports ph1]
set_input_delay -clock ph1  0.5  [get_ports ph2]
set_input_delay -clock ph1  0.5  [get_ports reset]
set_input_delay -clock ph1  0.5  [get_ports {registers[17]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[16]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[15]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[14]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[13]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[12]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[11]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[10]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[9]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[8]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[7]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[6]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[5]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[4]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[3]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[2]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[1]}]
set_input_delay -clock ph1  0.5  [get_ports {registers[0]}]
set_output_delay -clock ph1  0.5  [get_ports {xoro[1]}]
set_output_delay -clock ph1  0.5  [get_ports {xoro[0]}]
set_output_delay -clock ph1  0.5  [get_ports {row[1]}]
set_output_delay -clock ph1  0.5  [get_ports {row[0]}]
set_output_delay -clock ph1  0.5  [get_ports {col[1]}]
set_output_delay -clock ph1  0.5  [get_ports {col[0]}]
