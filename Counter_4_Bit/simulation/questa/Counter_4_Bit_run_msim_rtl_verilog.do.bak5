transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/HDL/Counter_4_Bit {D:/HDL/Counter_4_Bit/Counter_4_Bit.v}

vlog -vlog01compat -work work +incdir+D:/HDL/Counter_4_Bit {D:/HDL/Counter_4_Bit/tb_Counter_4_Bit.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_Counter_4_Bit

add wave *
view structure
view signals
run -all
