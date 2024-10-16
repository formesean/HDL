transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/HDL/ALU_n-bit {D:/HDL/ALU_n-bit/ALU_n_bit.v}

vlog -vlog01compat -work work +incdir+D:/HDL/ALU_n-bit {D:/HDL/ALU_n-bit/tb_ALU_n_bit.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_ALU_n_bit

add wave *
view structure
view signals
run -all
