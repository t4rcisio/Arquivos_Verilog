transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core {C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core/nRisc_core.v}
vlog -vlog01compat -work work +incdir+C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core {C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core/program_counter.v}
vlog -vlog01compat -work work +incdir+C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core {C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core/instructions_memory.v}
vlog -vlog01compat -work work +incdir+C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core {C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core/mux_alpha.v}
vlog -vlog01compat -work work +incdir+C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core {C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core/controler.v}
vlog -vlog01compat -work work +incdir+C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core {C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core/registers.v}
vlog -vlog01compat -work work +incdir+C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core {C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core/alu.v}
vlog -vlog01compat -work work +incdir+C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core {C:/AOC_1/nRisc_processor/nRisc_core_III/nRisc_core/memory.v}

