transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+Z:/LabExer_Aguilar/LE5/Hex-to-7seg_Decoder {Z:/LabExer_Aguilar/LE5/Hex-to-7seg_Decoder/Hex_to_7seg_Decoder.v}

vlog -vlog01compat -work work +incdir+Z:/LabExer_Aguilar/LE5/Hex-to-7seg_Decoder {Z:/LabExer_Aguilar/LE5/Hex-to-7seg_Decoder/tb_Hex_to_7seg_Decoder.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_Hex_to_7seg_Decoder

add wave *
view structure
view signals
run -all
