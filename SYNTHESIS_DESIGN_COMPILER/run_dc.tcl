source -echo -verbose ./rm_setup/dc_setup.tcl
set RTL_SOURCE_FILES ./../rtl/full_adder.v

define_design_lib WORK -path ./WORK

#set_dont_use [get_lib_cells */FADD*]
#set_dont_use [get_lib_cells */HADD*]
#set_dont_use [get_lib_cells */AO*]
#set_dont_use [get_lib_cells */OA*]
#set_dont_use [get_lib_cells */NAND*]
#set_dont_use [get_lib_cells */XOR*]
#set_dont_use [get_lib_cells */NOR*]
#set_dont_use [get_lib_cells */XNOR*]
#set_dont_use [get_lib_cells */MUX*]

analyze -format verilog ${RTL_SOURCE_FILES}
elaborate ${DESIGN_NAME}
current_design


read_sdc ./../CONSTRAINTS/full_adder.sdc

compile

#compile_ultra
#report_timing
write -format verilog -hierarchy -output ${RESULTS_DIR}/${DCRM_FINAL_VERILOG_OUTPUT_FILE}
