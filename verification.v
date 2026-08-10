cpu_simulation_results.txt

# Reading pref.tcl
# //  Questa Altera Starter FPGA Edition-64
# //  Version 2025.2 win64 May 31 2025
# //
# // Unpublished work. Copyright 2025 Siemens
# //
# // This material contains trade secrets or otherwise confidential information
# // owned by Siemens Industry Software Inc. or its affiliates (collectively,
# // "SISW"), or its licensors. Access to and use of this information is strictly
# // limited as set forth in the Customer's applicable agreements with SISW.
# //
# // This material may not be copied, distributed, or otherwise disclosed outside
# // of the Customer's facilities without the express written permission of SISW,
# // and may not be used in any way not expressly authorized by SISW.
# //
# do riscv_cpu_run_msim_rtl_verilog.do
# if {[file exists rtl_work]} {
# 	vdel -lib rtl_work -all
# }
# vlib rtl_work
# vmap work rtl_work
# Questa Altera Starter FPGA Edition-64 vmap 2025.2 Lib Mapping Utility 2025.05 May 31 2025
# vmap work rtl_work 
# ** Note: (vmap-220) 'c:/altera_lite/25.1std/questa_fse/win64/../modelsim.ini' is used as the ini file.
# Copying c:/altera_lite/25.1std/questa_fse/win64/../modelsim.ini to modelsim.ini
# Modifying modelsim.ini
# 
# vlog  -work work +incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu {C:/Users/Owner/AppData/Local/quartus/riscv_cpu/riscv_cpu.v}
# Questa Altera Starter FPGA Edition-64 vlog 2025.2 Compiler 2025.05 May 31 2025
# Start time: 17:21:33 on Aug 06,2026
# vlog -reportprogress 300 -work work "+incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu" C:/Users/Owner/AppData/Local/quartus/riscv_cpu/riscv_cpu.v 
# ** Note: (vlog-220) 'modelsim.ini' is used as the ini file.
# -- Compiling module riscv_cpu
# 
# Top level modules:
# 	riscv_cpu
# End time: 17:21:33 on Aug 06,2026, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# vlog  -work work +incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu {C:/Users/Owner/AppData/Local/quartus/riscv_cpu/program_counter.v}
# Questa Altera Starter FPGA Edition-64 vlog 2025.2 Compiler 2025.05 May 31 2025
# Start time: 17:21:33 on Aug 06,2026
# vlog -reportprogress 300 -work work "+incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu" C:/Users/Owner/AppData/Local/quartus/riscv_cpu/program_counter.v 
# ** Note: (vlog-220) 'modelsim.ini' is used as the ini file.
# -- Compiling module program_counter
# 
# Top level modules:
# 	program_counter
# End time: 17:21:33 on Aug 06,2026, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# vlog  -work work +incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu {C:/Users/Owner/AppData/Local/quartus/riscv_cpu/instruction_memory.v}
# Questa Altera Starter FPGA Edition-64 vlog 2025.2 Compiler 2025.05 May 31 2025
# Start time: 17:21:33 on Aug 06,2026
# vlog -reportprogress 300 -work work "+incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu" C:/Users/Owner/AppData/Local/quartus/riscv_cpu/instruction_memory.v 
# ** Note: (vlog-220) 'modelsim.ini' is used as the ini file.
# -- Compiling module instruction_memory
# 
# Top level modules:
# 	instruction_memory
# End time: 17:21:33 on Aug 06,2026, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# vlog  -work work +incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu {C:/Users/Owner/AppData/Local/quartus/riscv_cpu/register_file.v}
# Questa Altera Starter FPGA Edition-64 vlog 2025.2 Compiler 2025.05 May 31 2025
# Start time: 17:21:33 on Aug 06,2026
# vlog -reportprogress 300 -work work "+incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu" C:/Users/Owner/AppData/Local/quartus/riscv_cpu/register_file.v 
# ** Note: (vlog-220) 'modelsim.ini' is used as the ini file.
# -- Compiling module register_file
# 
# Top level modules:
# 	register_file
# End time: 17:21:33 on Aug 06,2026, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# vlog  -work work +incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu {C:/Users/Owner/AppData/Local/quartus/riscv_cpu/alu.v}
# Questa Altera Starter FPGA Edition-64 vlog 2025.2 Compiler 2025.05 May 31 2025
# Start time: 17:21:33 on Aug 06,2026
# vlog -reportprogress 300 -work work "+incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu" C:/Users/Owner/AppData/Local/quartus/riscv_cpu/alu.v 
# ** Note: (vlog-220) 'modelsim.ini' is used as the ini file.
# -- Compiling module alu
# 
# Top level modules:
# 	alu
# End time: 17:21:33 on Aug 06,2026, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# vlog  -work work +incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu {C:/Users/Owner/AppData/Local/quartus/riscv_cpu/immediate_generator.v}
# Questa Altera Starter FPGA Edition-64 vlog 2025.2 Compiler 2025.05 May 31 2025
# Start time: 17:21:34 on Aug 06,2026
# vlog -reportprogress 300 -work work "+incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu" C:/Users/Owner/AppData/Local/quartus/riscv_cpu/immediate_generator.v 
# ** Note: (vlog-220) 'modelsim.ini' is used as the ini file.
# -- Compiling module immediate_generator
# 
# Top level modules:
# 	immediate_generator
# End time: 17:21:34 on Aug 06,2026, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# vlog  -work work +incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu {C:/Users/Owner/AppData/Local/quartus/riscv_cpu/control_unit.v}
# Questa Altera Starter FPGA Edition-64 vlog 2025.2 Compiler 2025.05 May 31 2025
# Start time: 17:21:34 on Aug 06,2026
# vlog -reportprogress 300 -work work "+incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu" C:/Users/Owner/AppData/Local/quartus/riscv_cpu/control_unit.v 
# ** Note: (vlog-220) 'modelsim.ini' is used as the ini file.
# -- Compiling module control_unit
# 
# Top level modules:
# 	control_unit
# End time: 17:21:34 on Aug 06,2026, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# vlog  -work work +incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu {C:/Users/Owner/AppData/Local/quartus/riscv_cpu/data_memory.v}
# Questa Altera Starter FPGA Edition-64 vlog 2025.2 Compiler 2025.05 May 31 2025
# Start time: 17:21:34 on Aug 06,2026
# vlog -reportprogress 300 -work work "+incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu" C:/Users/Owner/AppData/Local/quartus/riscv_cpu/data_memory.v 
# ** Note: (vlog-220) 'modelsim.ini' is used as the ini file.
# -- Compiling module data_memory
# 
# Top level modules:
# 	data_memory
# End time: 17:21:34 on Aug 06,2026, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# 
# vlog  -work work +incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu {C:/Users/Owner/AppData/Local/quartus/riscv_cpu/riscv_cpu_tb.v}
# Questa Altera Starter FPGA Edition-64 vlog 2025.2 Compiler 2025.05 May 31 2025
# Start time: 17:21:34 on Aug 06,2026
# vlog -reportprogress 300 -work work "+incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu" C:/Users/Owner/AppData/Local/quartus/riscv_cpu/riscv_cpu_tb.v 
# ** Note: (vlog-220) 'modelsim.ini' is used as the ini file.
# -- Compiling module riscv_cpu_tb
# 
# Top level modules:
# 	riscv_cpu_tb
# End time: 17:21:34 on Aug 06,2026, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# vlog  -work work +incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu {C:/Users/Owner/AppData/Local/quartus/riscv_cpu/riscv_cpu.v}
# Questa Altera Starter FPGA Edition-64 vlog 2025.2 Compiler 2025.05 May 31 2025
# Start time: 17:21:34 on Aug 06,2026
# vlog -reportprogress 300 -work work "+incdir+C:/Users/Owner/AppData/Local/quartus/riscv_cpu" C:/Users/Owner/AppData/Local/quartus/riscv_cpu/riscv_cpu.v 
# ** Note: (vlog-220) 'modelsim.ini' is used as the ini file.
# -- Compiling module riscv_cpu
# 
# Top level modules:
# 	riscv_cpu
# End time: 17:21:34 on Aug 06,2026, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# 
# vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  riscv_cpu_tb
# ** Note: (vsim-220) 'modelsim.ini' is used as the ini file.
# vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs=""+acc"" riscv_cpu_tb 
# Start time: 17:21:34 on Aug 06,2026
# ** Note: (vsim-3812) Design is being optimized...
# ** Warning: (vopt-10908) Some optimizations are turned off because the +acc switch is in effect.
# ** Note: (vopt-220) 'modelsim.ini' is used as the ini file.
# ** Note: (vsim-12126) Error and warning message counts have been restored: Errors=0, Warnings=1.
# Loading work.riscv_cpu_tb(fast)
# Loading work.riscv_cpu(fast)
# Loading work.program_counter(fast)
# Loading work.instruction_memory(fast)
# Loading work.control_unit(fast)
# Loading work.register_file(fast)
# Loading work.immediate_generator(fast)
# Loading work.alu(fast)
# Loading work.data_memory(fast)
# 
# add wave *
# view structure
# .main_pane.structure.interior.cs.body.struct
# view signals
# .main_pane.objects.interior.cs.body.tree
# run -all
# --------------------------------
# CPU Simulation Complete
# --------------------------------
# PC  =         84
# x1 =          5
# x2 =          3
# x3 =          8
# x4 =          8
# x5 =         42
# Memory[0] =          8
# ** Note: $stop    : C:/Users/Owner/AppData/Local/quartus/riscv_cpu/riscv_cpu_tb.v(51)
#    Time: 215 ns  Iteration: 0  Instance: /riscv_cpu_tb
# Break in Module riscv_cpu_tb at C:/Users/Owner/AppData/Local/quartus/riscv_cpu/riscv_cpu_tb.v line 51