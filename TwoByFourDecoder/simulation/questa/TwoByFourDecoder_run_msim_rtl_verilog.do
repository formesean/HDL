transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/HDL/TwoByFourDecoder {D:/HDL/TwoByFourDecoder/Decoder2x4.v}

vlog -vlog01compat -work work +incdir+D:/HDL/TwoByFourDecoder {D:/HDL/TwoByFourDecoder/tb_Decoder2x4.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_Decoder2x4

add wave *
view structure
view signals
run -all
