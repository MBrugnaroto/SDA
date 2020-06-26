onerror {quit -f}
vlib work
vlog -work work CarrySelect.vo
vlog -work work CarrySelect.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.CarrySelect_vlg_vec_tst
vcd file -direction CarrySelect.msim.vcd
vcd add -internal CarrySelect_vlg_vec_tst/*
vcd add -internal CarrySelect_vlg_vec_tst/i1/*
add wave /*
run -all
