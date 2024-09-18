transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/HDL/TwoByFourDecoder {D:/HDL/TwoByFourDecoder/Decoder2x4.v}
vlog -vlog01compat -work work +incdir+D:/HDL/ThreeByEightDecoder {D:/HDL/ThreeByEightDecoder/Decoder3x8.v}

vlog -vlog01compat -work work +incdir+D:/HDL/ThreeByEightDecoder {D:/HDL/ThreeByEightDecoder/tb_Decoder3x8.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_Decoder3x8

add wave *
view structure
view signals
run -all
