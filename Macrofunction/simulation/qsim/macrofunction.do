onerror {quit -f}
vlib work
vlog -work work macrofunction.vo
vlog -work work macrofunction.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.macrofunction_vlg_vec_tst
vcd file -direction macrofunction.msim.vcd
vcd add -internal macrofunction_vlg_vec_tst/*
vcd add -internal macrofunction_vlg_vec_tst/i1/*
add wave /*
run -all
