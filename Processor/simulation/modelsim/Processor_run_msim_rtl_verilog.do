transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/UWT/TCES330/labs/Processor {C:/UWT/TCES330/labs/Processor/RegisterDualOE.v}
vlog -vlog01compat -work work +incdir+C:/UWT/TCES330/labs/Processor {C:/UWT/TCES330/labs/Processor/GenericDecoder2.v}
vlog -vlog01compat -work work +incdir+C:/UWT/TCES330/labs/Processor {C:/UWT/TCES330/labs/Processor/Data_Memory.v}
vlog -vlog01compat -work work +incdir+C:/UWT/TCES330/labs/Processor {C:/UWT/TCES330/labs/Processor/Mux_16_Bit_2_to_1.v}
vlog -sv -work work +incdir+C:/UWT/TCES330/labs/Processor {C:/UWT/TCES330/labs/Processor/RegegisterFile.sv}
vlog -sv -work work +incdir+C:/UWT/TCES330/labs/Processor {C:/UWT/TCES330/labs/Processor/Data_Path.sv}
vlog -sv -work work +incdir+C:/UWT/TCES330/labs/Processor {C:/UWT/TCES330/labs/Processor/ALU.sv}

vlog -sv -work work +incdir+C:/UWT/TCES330/labs/Processor {C:/UWT/TCES330/labs/Processor/Data_Path_testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  Data_Path_testbench

add wave *
view structure
view signals
run -all
