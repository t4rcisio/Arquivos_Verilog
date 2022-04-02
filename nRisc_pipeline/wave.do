onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /nRisc_pipeline/clock
add wave -noupdate -radix decimal /nRisc_pipeline/PC_MODULE/pc
add wave -noupdate /nRisc_pipeline/CT_MODULE/jump
add wave -noupdate /nRisc_pipeline/IM_MODULE/instruction
add wave -noupdate /nRisc_pipeline/MA_MODULE/mux_debug
add wave -noupdate /nRisc_pipeline/MA_MODULE/immediate
add wave -noupdate /nRisc_pipeline/CT_MODULE/data
add wave -noupdate /nRisc_pipeline/CT_MODULE/solution_c
add wave -noupdate /nRisc_pipeline/RM_MODULE/data
add wave -noupdate /nRisc_pipeline/AU_MODULE/jump_data
add wave -noupdate /nRisc_pipeline/AU_MODULE/solution
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4547 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 277
configure wave -valuecolwidth 57
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {6674 ps} {7518 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue HiZ -period 100ps -dutycycle 50 -starttime 0ps -endtime 10000ps sim:/nRisc_pipeline/clock 
WaveCollapseAll -1
wave clipboard restore
