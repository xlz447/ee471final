onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_tb/clk
add wave -noupdate /cpu_tb/rst
add wave -noupdate /cpu_tb/cpu/ifu/PCout
add wave -noupdate /cpu_tb/cpu/InstToStage1
add wave -noupdate -childformat {{{/cpu_tb/cpu/rf/AllData[31]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[30]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[29]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[28]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[27]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[26]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[25]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[24]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[23]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[22]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[21]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[20]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[19]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[18]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[17]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[16]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[15]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[14]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[13]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[12]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[11]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[10]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[9]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[8]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[7]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[6]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[5]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[4]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[3]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[2]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[1]} -radix decimal} {{/cpu_tb/cpu/rf/AllData[0]} -radix decimal}} -expand -subitemconfig {{/cpu_tb/cpu/rf/AllData[31]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[30]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[29]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[28]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[27]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[26]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[25]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[24]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[23]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[22]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[21]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[20]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[19]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[18]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[17]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[16]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[15]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[14]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[13]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[12]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[11]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[10]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[9]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[8]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[7]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[6]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[5]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[4]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[3]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[2]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[1]} {-height 15 -radix decimal} {/cpu_tb/cpu/rf/AllData[0]} {-height 15 -radix decimal}} /cpu_tb/cpu/rf/AllData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {775826 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 225
configure wave -valuecolwidth 211
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
configure wave -timelineunits ps
update
WaveRestoreZoom {757403 ps} {802253 ps}
