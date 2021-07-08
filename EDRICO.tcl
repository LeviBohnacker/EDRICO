#*****************************************************************************************
# Vivado (TM) v2021.1 (64-bit)
#
# EDRICO.tcl: Tcl script for re-creating project 'EDRICO'
#
# IP Build 3246043 on Fri Jun 11 00:30:35 MDT 2021
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#
#*****************************************************************************************
# Check file required for this script exists
proc checkRequiredFiles { origin_dir} {
  set status true
  set files [list \
   "${origin_dir}/RTL/DataMaskUnit/data_mask_unit.vhd" \
   "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd" \
   "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd" \
   "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master.vhd" \
   "${origin_dir}/RTL/ALU/ALU.vhd" \
   "${origin_dir}/RTL/ALU/ALU_tb.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_controller.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_interrupt_gen.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_pkg.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_top.vhd" \
   "${origin_dir}/RTL/RegisterFile/RF_pkg.vhd" \
   "${origin_dir}/RTL/RegisterFile/RV32I_RF.vhd" \
   "${origin_dir}/RTL/RegisterFile/RegisterFile_top.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMA_checker.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_checker.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_unit.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_checker.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_FSM.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_PC.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_decoder.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_execute_enable.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_pkg.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_top.vhd" \
   "${origin_dir}/RTL/ExceptionControll/CSR_access_controll.vhd" \
   "${origin_dir}/RTL/ExceptionControll/DRA_controll.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd" \
   "${origin_dir}/RTL/ExceptionControll/arbiter.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll.vhd" \
   "${origin_dir}/RTL/ALU/ALU_pkg.vhd" \
   "${origin_dir}/RTL/DataMaskUnit/data_mask_unit_pkg.vhd" \
   "${origin_dir}/ip_repo/DataMaskUnit/component.xml" \
   "${origin_dir}/RTL/MUX/MUX_pkg.vhd" \
   "${origin_dir}/RTL/MUX/MUX_32_2.vhd" \
   "${origin_dir}/RTL/MUX/MUX_32_3.vhd" \
   "${origin_dir}/RTL/MUX/MUX_CSR.vhd" \
   "${origin_dir}/RTL/LoadBufferRegister/LoadBufferRegister.vhd" \
   "${origin_dir}/RTL/DataMaskUnit/DMU_UV_1_tb.vhd" \
   "${origin_dir}/simulation/sim_DMU_UV_1/sim_DMU_UV_1.wcfg" \
   "${origin_dir}/simulation/sim_EC_FSM_UV_1/EC_FSM_UV_1_tb.vhd" \
   "${origin_dir}/simulation/sim_EC_FSM_UV_1/EC_FSM_UV_1_tb_behav.wcfg" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd" \
   "${origin_dir}/simulation/sim_EC_FSM_UV_2/EC_FSM_UV_2_tb.vhd" \
   "${origin_dir}/simulation/sim_EC_FSM_UV_2/EC_FSM_UV_2_tb_behav.wcfg" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd" \
   "${origin_dir}/simulation/sim_EC_FSM_UV_3/EC_FSM_UV_3_tb.vhd" \
   "${origin_dir}/simulation/sim_EC_FSM_UV_3/EC_FSM_UV_3_tb_behav.wcfg" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd" \
   "${origin_dir}/simulation/sim_EC_FSM_UV_4/EC_FSM_UV_4_tb.vhd" \
   "${origin_dir}/simulation/sim_EC_FSM_UV_4/EC_FSM_UV_4_tb_behav.wcfg" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd" \
   "${origin_dir}/simulation/sim_EC_FSM_UV_5/EC_FSM_UV_5_tb.vhd" \
   "${origin_dir}/simulation/sim_EC_FSM_UV_5/EC_FSM_UV_5_tb_behav.wcfg" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd" \
   "${origin_dir}/simulation/sim_EC_FSM_UV_6/EC_FSM_UV_6_tb.vhd" \
   "${origin_dir}/simulation/sim_EC_FSM_UV_6/EC_FSM_UV_6_tb_behav.wcfg" \
   "${origin_dir}/RTL/ControlUnit/CU_decoder_tb.vhd" \
   "${origin_dir}/simulation/sim_CU_UV_1/CU_decoder_tb_behav.wcfg" \
   "${origin_dir}/RTL/ControlUnit/CU_execute_enable_tb.vhd" \
   "${origin_dir}/simulation/sim_CU_UV_2/CU_execute_enable_tb_behav.wcfg" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd" \
   "${origin_dir}/RTL/ExceptionControll/DRA_controll.vhd" \
   "${origin_dir}/simulation/sim_EC_DRA_cont_UV_1/DRA_control_tb.vhd" \
   "${origin_dir}/simulation/sim_EC_DRA_cont_UV_1/DRA_control_tb_behav.wcfg" \
   "${origin_dir}/RTL/ExceptionControll/CSR_access_controll.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd" \
   "${origin_dir}/simulation/sim_EC_CSR_ac_UV_1/EC_CSR_ac_UV_1_tb.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd" \
   "${origin_dir}/simulation/sim_EC_FSM_UV_7/EC_FSM_UV_7_tb.vhd" \
   "${origin_dir}/simulation/sim_EC_FSM_UV_7/EC_FSM_UV_7_tb_behav.wcfg" \
   "${origin_dir}/simulation/sim_EC_arbiter_UV_1/EC_arbiter_UV_1_pkg.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd" \
   "${origin_dir}/RTL/ExceptionControll/arbiter.vhd" \
   "${origin_dir}/simulation/sim_EC_arbiter_UV_1/EC_arbiter_UV_1_tb.vhd" \
   "${origin_dir}/simulation/sim_EC_arbiter_UV_1/EC_arbiter_UV_1_tb_behav.wcfg" \
   "${origin_dir}/simulation/sim_CSR_top_UV_1/CSR_top.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_FSM.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_FSM_tb.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_unit.vhd" \
   "${origin_dir}/simulation/sim_PMP_unit_UV_1/sim_PMP_unit_UV_1_pkg.vhd" \
   "${origin_dir}/simulation/sim_PMP_unit_UV_1/sim_PMP_unit_UV_1.vhd" \
   "${origin_dir}/simulation/sim_PMP_unit_UV_1/sim_PMP_unit_UV_1_behav.wcfg" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_checker.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_unit.vhd" \
   "${origin_dir}/simulation/sim_PMP_checker_UV_1/sim_PMP_checker_UV_1_pkg.vhd" \
   "${origin_dir}/simulation/sim_PMP_checker_UV_1/sim_PMP_checker_UV_1_tb.vhd" \
   "${origin_dir}/simulation/sim_PMP_checker_UV_1/sim_PMP_checker_UV_1_tb_behav.wcfg" \
   "${origin_dir}/simulation/sim_PMP_checker_UV_2/PMP_PMA_pkg.vhd" \
   "${origin_dir}/simulation/sim_PMP_checker_UV_2/PMP_checker.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_unit.vhd" \
   "${origin_dir}/simulation/sim_PMP_checker_UV_2/sim_PMP_checker_UV_2_pkg.vhd" \
   "${origin_dir}/simulation/sim_PMP_checker_UV_2/sim_PMP_checker_UV_2_tb.vhd" \
   "${origin_dir}/simulation/sim_PMP_checker_UV_2/sim_PMP_checker_UV_2_tb_behav.wcfg" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMA_checker.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd" \
   "${origin_dir}/simulation/sim_PMA_checker_UV_1/sim_PMA_checker_UV_1_pkg.vhd" \
   "${origin_dir}/simulation/sim_PMA_checker_UV_1/sim_PMA_checker_UV_1_tb.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_controller.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_pkg.vhd" \
   "${origin_dir}/simulation/sim_CSR_controller_UV_1/sim_CSR_controller_UV_1_pkg.vhd" \
   "${origin_dir}/simulation/sim_CSR_controller_UV_1/sim_CSR_controller_UV_1_tb.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_interrupt_gen.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_pkg.vhd" \
   "${origin_dir}/simulation/sim_CSR_interrupt_gen_UV_1/sim_CSR_interrupt_gen_UV_1_pkg.vhd" \
   "${origin_dir}/simulation/sim_CSR_interrupt_gen_UV_1/sim_CSR_interrupt_gen_UV_1_tb.vhd" \
   "${origin_dir}/simulation/sim_CSR_interrupt_gen_UV_1/sim_CSR_interrupt_gen_UV_1_tb_behav.wcfg" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_pkg.vhd" \
   "${origin_dir}/simulation/sim_CSR_top_UV_1/sim_CSR_top_UV_1_pkg.vhd" \
   "${origin_dir}/simulation/sim_CSR_top_UV_1/sim_CSR_top_UV_1_tb.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_controller.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_interrupt_gen.vhd" \
   "${origin_dir}/simulation/sim_CSR_top_UV_1/sim_CSR_top_UV_1_tb_behav.wcfg" \
   "${origin_dir}/RTL/RegisterFile/CSR_controller.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_interrupt_gen.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_pkg.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_top.vhd" \
   "${origin_dir}/simulation/sim_CSR_top_UV_2/sim_CSR_top_UV_2_pkg.vhd" \
   "${origin_dir}/simulation/sim_CSR_top_UV_2/sim_CSR_top_UV_2_tb.vhd" \
   "${origin_dir}/simulation/sim_CSR_top_UV_2/sim_CSR_top_UV_2_tb_behav.wcfg" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd" \
   "${origin_dir}/RTL/RegisterFile/RF_pkg.vhd" \
   "${origin_dir}/RTL/RegisterFile/RV32I_RF.vhd" \
   "${origin_dir}/simulation/sim_RV32I_RF_UV_1/sim_RV32I_RF_UV_1_pkg.vhd" \
   "${origin_dir}/simulation/sim_RV32I_RF_UV_1/sim_RV32I_RF_UV_1_tb.vhd" \
   "${origin_dir}/simulation/sim_RV32I_RF_UV_1/sim_RV32I_RF_UV_1_tb_behav.wcfg" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd" \
   "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd" \
   "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd" \
   "${origin_dir}/simulation/sim_AXI4_CU_UV_1/sim_AXI4_CU_UV_1_pkg.vhd" \
   "${origin_dir}/simulation/sim_AXI4_CU_UV_1/sim_AXI4_CU_UV_1_tb.vhd" \
   "${origin_dir}/simulation/sim_AXI4_CU_UV_1/sim_AXI4_CU_UV_1_tb_behav.wcfg" \
   "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd" \
   "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd" \
   "${origin_dir}/simulation/sim_AXI4_CU_UV_2/sim_AXI4_CU_UV_2_pkg.vhd" \
   "${origin_dir}/simulation/sim_AXI4_CU_UV_2/sim_AXI4_CU_UV_2_tb.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd" \
   "${origin_dir}/simulation/sim_AXI4_CU_UV_2/sim_AXI4_CU_UV_2_tb_behav.wcfg" \
   "${origin_dir}/RTL/ControlUnit/CU_PC_tb.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_FSM.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_FSM_tb.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_PC.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_PC_tb.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_decoder.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_decoder_tb.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_execute_enable.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_execute_enable_tb.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_top.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_top_tb_pkg.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_top_tb.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_pkg.vhd" \
   "${origin_dir}/RTL/ExceptionControll/CSR_access_controll.vhd" \
   "${origin_dir}/RTL/ExceptionControll/DRA_controll.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd" \
   "${origin_dir}/RTL/ExceptionControll/arbiter.vhd" \
   "${origin_dir}/simulation/sim_EC_IV_1/sim_EC_IV_1_registers.vhd" \
   "${origin_dir}/simulation/sim_EC_IV_1/sim_EC_IV_1_tb.vhd" \
   "${origin_dir}/simulation/sim_EC_IV_1/sim_EC_IV_1_pkg.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMA_checker.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_checker.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_checker.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_unit.vhd" \
   "${origin_dir}/simulation/sim_PPC_IV_1/sim_PPC_IV_1_pkg.vhd" \
   "${origin_dir}/simulation/sim_PPC_IV_1/sim_PPC_IV_1_tb.vhd" \
   "${origin_dir}/simulation/sim_PPC_IV_1/sim_PPC_IV_1_behav.wcfg" \
   "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd" \
   "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master.vhd" \
   "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd" \
   "${origin_dir}/simulation/sim_AXI4_IV_1/sim_AXI4_IV_1_pkg.vhd" \
   "${origin_dir}/simulation/sim_AXI4_IV_1/sim_AXI4_IV_1_tb.vhd" \
   "${origin_dir}/simulation/sim_AXI4_IV_1/sim_AXI4_IV_1_tb_behav.wcfg" \
  ]
  foreach ifile $files {
    if { ![file isfile $ifile] } {
      puts " Could not find remote file $ifile "
      set status false
    }
  }

  set paths [list \
   [file normalize "$origin_dir/ip_repo/DataMaskUnit"] \
   [file normalize "$origin_dir/ip_repo/AXI4_lite_master"] \
   [file normalize "$origin_dir/ip_repo/RegisterFile"] \
   [file normalize "$origin_dir/ip_repo/PMP_PMA_checker"] \
   [file normalize "$origin_dir/ip_repo/ControlUnit"] \
   [file normalize "$origin_dir/ip_repo/mmCSR_AXI4_slave_1.0"] \
   [file normalize "$origin_dir/ip_repo/ALU"] \
   [file normalize "$origin_dir/ip_repo/ExceptionControl"] \
  ]
  foreach ipath $paths {
    if { ![file isdirectory $ipath] } {
      puts " Could not access $ipath "
      set status false
    }
  }

  return $status
}
# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir [file dirname [info script]]

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

# Set the project name
set _xil_proj_name_ "EDRICO"

# Use project name variable, if specified in the tcl shell
if { [info exists ::user_project_name] } {
  set _xil_proj_name_ $::user_project_name
}

variable script_file
set script_file "EDRICO.tcl"

# Help information for this script
proc print_help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--project_name <name>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--project_name <name>\] Create project with the specified name. Default"
  puts "                       name is the name of the project from where this"
  puts "                       script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < $::argc} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir"   { incr i; set origin_dir [lindex $::argv $i] }
      "--project_name" { incr i; set _xil_proj_name_ [lindex $::argv $i] }
      "--help"         { print_help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/vivado_project"]"

# Check for paths and files needed for project creation
set validate_required 0
if { $validate_required } {
  if { [checkRequiredFiles $origin_dir] } {
    puts "Tcl file $script_file is valid. All files required for project creation is accesable. "
  } else {
    puts "Tcl file $script_file is not valid. Not all files required for project creation is accesable. "
    return
  }
}

# Create project
create_project ${_xil_proj_name_} $origin_dir/vivado_project -part xc7z020clg400-1 -quiet -force

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
set_property -name "board_part" -value "digilentinc.com:arty-z7-20:part0:1.0" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "enable_vhdl_2008" -value "1" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/${_xil_proj_name_}.cache/ip" -objects $obj
set_property -name "mem.enable_memory_map_generation" -value "1" -objects $obj
set_property -name "platform.board_id" -value "arty-z7-20" -objects $obj
set_property -name "revised_directory_structure" -value "1" -objects $obj
set_property -name "sim.central_dir" -value "$proj_dir/${_xil_proj_name_}.ip_user_files" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "target_language" -value "VHDL" -objects $obj
set_property -name "webtalk.activehdl_export_sim" -value "1" -objects $obj
set_property -name "webtalk.ies_export_sim" -value "1" -objects $obj
set_property -name "webtalk.modelsim_export_sim" -value "1" -objects $obj
set_property -name "webtalk.questa_export_sim" -value "1" -objects $obj
set_property -name "webtalk.riviera_export_sim" -value "1" -objects $obj
set_property -name "webtalk.vcs_export_sim" -value "1" -objects $obj
set_property -name "webtalk.xsim_export_sim" -value "1" -objects $obj
set_property -name "webtalk.xsim_launch_sim" -value "237" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set IP repository paths
set obj [get_filesets sources_1]
if { $obj != {} } {
set_property "ip_repo_paths" "[file normalize "$origin_dir/ip_repo/DataMaskUnit"] [file normalize "$origin_dir/ip_repo/AXI4_lite_master"] [file normalize "$origin_dir/ip_repo/RegisterFile"] [file normalize "$origin_dir/ip_repo/PMP_PMA_checker"] [file normalize "$origin_dir/ip_repo/ControlUnit"] [file normalize "$origin_dir/ip_repo/mmCSR_AXI4_slave_1.0"] [file normalize "$origin_dir/ip_repo/ALU"] [file normalize "$origin_dir/ip_repo/ExceptionControl"]" $obj

# Rebuild user ip_repo's index before adding any source files
update_ip_catalog -rebuild
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
 [file normalize "${origin_dir}/RTL/DataMaskUnit/data_mask_unit.vhd"] \
 [file normalize "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd"] \
 [file normalize "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master.vhd"] \
 [file normalize "${origin_dir}/RTL/ALU/ALU.vhd"] \
 [file normalize "${origin_dir}/RTL/ALU/ALU_tb.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_controller.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_interrupt_gen.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_top.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/RF_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/RV32I_RF.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/RegisterFile_top.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMA_checker.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_checker.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_unit.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_checker.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_FSM.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_PC.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_decoder.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_execute_enable.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_top.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/CSR_access_controll.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/DRA_controll.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/arbiter.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll.vhd"] \
 [file normalize "${origin_dir}/RTL/ALU/ALU_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/DataMaskUnit/data_mask_unit_pkg.vhd"] \
 [file normalize "${origin_dir}/ip_repo/DataMaskUnit/component.xml"] \
 [file normalize "${origin_dir}/RTL/MUX/MUX_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/MUX/MUX_32_2.vhd"] \
 [file normalize "${origin_dir}/RTL/MUX/MUX_32_3.vhd"] \
 [file normalize "${origin_dir}/RTL/MUX/MUX_CSR.vhd"] \
 [file normalize "${origin_dir}/RTL/LoadBufferRegister/LoadBufferRegister.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
set file "$origin_dir/RTL/DataMaskUnit/data_mask_unit.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "DMU_lib" -objects $file_obj

set file "$origin_dir/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/RTL/AXI4_Lite_Master/AXI4_lite_master.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/RTL/ALU/ALU.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "ALU_lib" -objects $file_obj

set file "$origin_dir/RTL/ALU/ALU_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "ALU_lib" -objects $file_obj
set_property -name "used_in" -value "synthesis" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/CSR_controller.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/CSR_interrupt_gen.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/CSR_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/CSR_top.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/RF_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/RV32I_RF.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/RegisterFile_top.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj
set_property -name "used_in" -value "synthesis" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMA_checker.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_checker.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_unit.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_checker.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj
set_property -name "used_in" -value "synthesis" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_FSM.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_PC.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_decoder.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_execute_enable.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_top.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj
set_property -name "used_in" -value "synthesis" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/CSR_access_controll.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/DRA_controll.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_FSM.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/arbiter.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj
set_property -name "used_in" -value "synthesis" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj

set file "$origin_dir/RTL/ALU/ALU_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "ALU_lib" -objects $file_obj

set file "$origin_dir/RTL/DataMaskUnit/data_mask_unit_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "DMU_lib" -objects $file_obj

set file "$origin_dir/ip_repo/DataMaskUnit/component.xml"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP-XACT" -objects $file_obj

set file "$origin_dir/RTL/MUX/MUX_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "MUX_lib" -objects $file_obj

set file "$origin_dir/RTL/MUX/MUX_32_2.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "MUX_lib" -objects $file_obj

set file "$origin_dir/RTL/MUX/MUX_32_3.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "MUX_lib" -objects $file_obj

set file "$origin_dir/RTL/MUX/MUX_CSR.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "MUX_lib" -objects $file_obj

set file "$origin_dir/RTL/LoadBufferRegister/LoadBufferRegister.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "data_mask_unit" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Empty (no sources present)

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "top" -value "PMP_checker" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "PMP_lib" -objects $obj

# Create 'sim_DMU_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_DMU_UV_1] ""]} {
  create_fileset -simset sim_DMU_UV_1
}

# Set 'sim_DMU_UV_1' fileset object
set obj [get_filesets sim_DMU_UV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/DataMaskUnit/DMU_UV_1_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_DMU_UV_1/sim_DMU_UV_1.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_DMU_UV_1' fileset file properties for remote files
set file "$origin_dir/RTL/DataMaskUnit/DMU_UV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_DMU_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'sim_DMU_UV_1' fileset file properties for local files
# None

# Set 'sim_DMU_UV_1' fileset properties
set obj [get_filesets sim_DMU_UV_1]
set_property -name "top" -value "DMU_UV_1_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "4000ns" -objects $obj

# Create 'sim_EC_FSM_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_EC_FSM_UV_1] ""]} {
  create_fileset -simset sim_EC_FSM_UV_1
}

# Set 'sim_EC_FSM_UV_1' fileset object
set obj [get_filesets sim_EC_FSM_UV_1]
set files [list \
 [file normalize "${origin_dir}/simulation/sim_EC_FSM_UV_1/EC_FSM_UV_1_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_FSM_UV_1/EC_FSM_UV_1_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_EC_FSM_UV_1' fileset file properties for remote files
set file "$origin_dir/simulation/sim_EC_FSM_UV_1/EC_FSM_UV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj


# Set 'sim_EC_FSM_UV_1' fileset file properties for local files
# None

# Set 'sim_EC_FSM_UV_1' fileset properties
set obj [get_filesets sim_EC_FSM_UV_1]
set_property -name "top" -value "PMP_checker" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "PMP_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "60ns" -objects $obj

# Create 'sim_EC_FSM_UV_2' fileset (if not found)
if {[string equal [get_filesets -quiet sim_EC_FSM_UV_2] ""]} {
  create_fileset -simset sim_EC_FSM_UV_2
}

# Set 'sim_EC_FSM_UV_2' fileset object
set obj [get_filesets sim_EC_FSM_UV_2]
set files [list \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_FSM_UV_2/EC_FSM_UV_2_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_FSM_UV_2/EC_FSM_UV_2_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_EC_FSM_UV_2' fileset file properties for remote files
set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_FSM.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_EC_FSM_UV_2/EC_FSM_UV_2_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj


# Set 'sim_EC_FSM_UV_2' fileset file properties for local files
# None

# Set 'sim_EC_FSM_UV_2' fileset properties
set obj [get_filesets sim_EC_FSM_UV_2]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "EC_FSM_UV_2_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "EC_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "60ns" -objects $obj

# Create 'sim_EC_FSM_UV_3' fileset (if not found)
if {[string equal [get_filesets -quiet sim_EC_FSM_UV_3] ""]} {
  create_fileset -simset sim_EC_FSM_UV_3
}

# Set 'sim_EC_FSM_UV_3' fileset object
set obj [get_filesets sim_EC_FSM_UV_3]
set files [list \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_FSM_UV_3/EC_FSM_UV_3_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_FSM_UV_3/EC_FSM_UV_3_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_EC_FSM_UV_3' fileset file properties for remote files
set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_3] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_FSM.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_3] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_EC_FSM_UV_3/EC_FSM_UV_3_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_3] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj


# Set 'sim_EC_FSM_UV_3' fileset file properties for local files
# None

# Set 'sim_EC_FSM_UV_3' fileset properties
set obj [get_filesets sim_EC_FSM_UV_3]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "EC_FSM_UV_3_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "EC_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "60ns" -objects $obj

# Create 'sim_EC_FSM_UV_4' fileset (if not found)
if {[string equal [get_filesets -quiet sim_EC_FSM_UV_4] ""]} {
  create_fileset -simset sim_EC_FSM_UV_4
}

# Set 'sim_EC_FSM_UV_4' fileset object
set obj [get_filesets sim_EC_FSM_UV_4]
set files [list \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_FSM_UV_4/EC_FSM_UV_4_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_FSM_UV_4/EC_FSM_UV_4_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_EC_FSM_UV_4' fileset file properties for remote files
set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_4] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_FSM.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_4] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_EC_FSM_UV_4/EC_FSM_UV_4_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_4] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj


# Set 'sim_EC_FSM_UV_4' fileset file properties for local files
# None

# Set 'sim_EC_FSM_UV_4' fileset properties
set obj [get_filesets sim_EC_FSM_UV_4]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "EC_FSM_UV_4_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "EC_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "60ns" -objects $obj

# Create 'sim_EC_FSM_UV_5' fileset (if not found)
if {[string equal [get_filesets -quiet sim_EC_FSM_UV_5] ""]} {
  create_fileset -simset sim_EC_FSM_UV_5
}

# Set 'sim_EC_FSM_UV_5' fileset object
set obj [get_filesets sim_EC_FSM_UV_5]
set files [list \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_FSM_UV_5/EC_FSM_UV_5_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_FSM_UV_5/EC_FSM_UV_5_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_EC_FSM_UV_5' fileset file properties for remote files
set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_5] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_FSM.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_5] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_EC_FSM_UV_5/EC_FSM_UV_5_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_5] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj


# Set 'sim_EC_FSM_UV_5' fileset file properties for local files
# None

# Set 'sim_EC_FSM_UV_5' fileset properties
set obj [get_filesets sim_EC_FSM_UV_5]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "EC_FSM_UV_5_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "EC_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "60ns" -objects $obj

# Create 'sim_EC_FSM_UV_6' fileset (if not found)
if {[string equal [get_filesets -quiet sim_EC_FSM_UV_6] ""]} {
  create_fileset -simset sim_EC_FSM_UV_6
}

# Set 'sim_EC_FSM_UV_6' fileset object
set obj [get_filesets sim_EC_FSM_UV_6]
set files [list \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_FSM_UV_6/EC_FSM_UV_6_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_FSM_UV_6/EC_FSM_UV_6_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_EC_FSM_UV_6' fileset file properties for remote files
set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_6] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_FSM.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_6] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_EC_FSM_UV_6/EC_FSM_UV_6_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_6] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj


# Set 'sim_EC_FSM_UV_6' fileset file properties for local files
# None

# Set 'sim_EC_FSM_UV_6' fileset properties
set obj [get_filesets sim_EC_FSM_UV_6]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "EC_FSM_UV_6_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "EC_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "60ns" -objects $obj

# Create 'sim_CU_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_CU_UV_1] ""]} {
  create_fileset -simset sim_CU_UV_1
}

# Set 'sim_CU_UV_1' fileset object
set obj [get_filesets sim_CU_UV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_decoder_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_CU_UV_1/CU_decoder_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_CU_UV_1' fileset file properties for remote files
set file "$origin_dir/RTL/ControlUnit/CU_decoder_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj


# Set 'sim_CU_UV_1' fileset file properties for local files
# None

# Set 'sim_CU_UV_1' fileset properties
set obj [get_filesets sim_CU_UV_1]
set_property -name "top" -value "PMP_checker" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "PMP_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "10000ns" -objects $obj

# Create 'sim_CU_UV_2' fileset (if not found)
if {[string equal [get_filesets -quiet sim_CU_UV_2] ""]} {
  create_fileset -simset sim_CU_UV_2
}

# Set 'sim_CU_UV_2' fileset object
set obj [get_filesets sim_CU_UV_2]
set files [list \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_execute_enable_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_CU_UV_2/CU_execute_enable_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_CU_UV_2' fileset file properties for remote files
set file "$origin_dir/RTL/ControlUnit/CU_execute_enable_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj


# Set 'sim_CU_UV_2' fileset file properties for local files
# None

# Set 'sim_CU_UV_2' fileset properties
set obj [get_filesets sim_CU_UV_2]
set_property -name "top" -value "PMP_checker" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "PMP_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "4000ns" -objects $obj

# Create 'sim_EC_DRA_cont_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_EC_DRA_cont_UV_1] ""]} {
  create_fileset -simset sim_EC_DRA_cont_UV_1
}

# Set 'sim_EC_DRA_cont_UV_1' fileset object
set obj [get_filesets sim_EC_DRA_cont_UV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/DRA_controll.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_DRA_cont_UV_1/DRA_control_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_DRA_cont_UV_1/DRA_control_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_EC_DRA_cont_UV_1' fileset file properties for remote files
set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_DRA_cont_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/DRA_controll.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_DRA_cont_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_EC_DRA_cont_UV_1/DRA_control_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_DRA_cont_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj


# Set 'sim_EC_DRA_cont_UV_1' fileset file properties for local files
# None

# Set 'sim_EC_DRA_cont_UV_1' fileset properties
set obj [get_filesets sim_EC_DRA_cont_UV_1]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "DRA_control_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "EC_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "50ns" -objects $obj

# Create 'sim_EC_CSR_ac_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_EC_CSR_ac_UV_1] ""]} {
  create_fileset -simset sim_EC_CSR_ac_UV_1
}

# Set 'sim_EC_CSR_ac_UV_1' fileset object
set obj [get_filesets sim_EC_CSR_ac_UV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/ExceptionControll/CSR_access_controll.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_CSR_ac_UV_1/EC_CSR_ac_UV_1_tb.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_EC_CSR_ac_UV_1' fileset file properties for remote files
set file "$origin_dir/RTL/ExceptionControll/CSR_access_controll.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_CSR_ac_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_CSR_ac_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_EC_CSR_ac_UV_1/EC_CSR_ac_UV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_CSR_ac_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj


# Set 'sim_EC_CSR_ac_UV_1' fileset file properties for local files
# None

# Set 'sim_EC_CSR_ac_UV_1' fileset properties
set obj [get_filesets sim_EC_CSR_ac_UV_1]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "EC_CSR_ac_UV_1_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "EC_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "110ns" -objects $obj

# Create 'sim_EC_FSM_UV_7' fileset (if not found)
if {[string equal [get_filesets -quiet sim_EC_FSM_UV_7] ""]} {
  create_fileset -simset sim_EC_FSM_UV_7
}

# Set 'sim_EC_FSM_UV_7' fileset object
set obj [get_filesets sim_EC_FSM_UV_7]
set files [list \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_FSM_UV_7/EC_FSM_UV_7_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_FSM_UV_7/EC_FSM_UV_7_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_EC_FSM_UV_7' fileset file properties for remote files
set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_7] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_FSM.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_7] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_EC_FSM_UV_7/EC_FSM_UV_7_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_FSM_UV_7] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj


# Set 'sim_EC_FSM_UV_7' fileset file properties for local files
# None

# Set 'sim_EC_FSM_UV_7' fileset properties
set obj [get_filesets sim_EC_FSM_UV_7]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "EC_FSM_UV_7_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "EC_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "50ns" -objects $obj

# Create 'sim_EC_arbiter_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_EC_arbiter_UV_1] ""]} {
  create_fileset -simset sim_EC_arbiter_UV_1
}

# Set 'sim_EC_arbiter_UV_1' fileset object
set obj [get_filesets sim_EC_arbiter_UV_1]
set files [list \
 [file normalize "${origin_dir}/simulation/sim_EC_arbiter_UV_1/EC_arbiter_UV_1_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/arbiter.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_arbiter_UV_1/EC_arbiter_UV_1_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_arbiter_UV_1/EC_arbiter_UV_1_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_EC_arbiter_UV_1' fileset file properties for remote files
set file "$origin_dir/simulation/sim_EC_arbiter_UV_1/EC_arbiter_UV_1_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_arbiter_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_arbiter_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/arbiter.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_arbiter_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_EC_arbiter_UV_1/EC_arbiter_UV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_arbiter_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj


# Set 'sim_EC_arbiter_UV_1' fileset file properties for local files
# None

# Set 'sim_EC_arbiter_UV_1' fileset properties
set obj [get_filesets sim_EC_arbiter_UV_1]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "EC_arbiter_UV_1_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "EC_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "4000ns" -objects $obj

# Create 'sim_CU_FSM_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_CU_FSM_UV_1] ""]} {
  create_fileset -simset sim_CU_FSM_UV_1
}

# Set 'sim_CU_FSM_UV_1' fileset object
set obj [get_filesets sim_CU_FSM_UV_1]
set files [list \
 [file normalize "${origin_dir}/simulation/sim_CSR_top_UV_1/CSR_top.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_FSM.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_FSM_tb.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_CU_FSM_UV_1' fileset file properties for remote files
set file "$origin_dir/simulation/sim_CSR_top_UV_1/CSR_top.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_FSM_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_FSM.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_FSM_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_FSM_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_FSM_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj


# Set 'sim_CU_FSM_UV_1' fileset file properties for local files
# None

# Set 'sim_CU_FSM_UV_1' fileset properties
set obj [get_filesets sim_CU_FSM_UV_1]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "CSR_top" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "RF_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "4000ns" -objects $obj

# Create 'sim_PMP_unit_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_PMP_unit_UV_1] ""]} {
  create_fileset -simset sim_PMP_unit_UV_1
}

# Set 'sim_PMP_unit_UV_1' fileset object
set obj [get_filesets sim_PMP_unit_UV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_unit.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PMP_unit_UV_1/sim_PMP_unit_UV_1_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PMP_unit_UV_1/sim_PMP_unit_UV_1.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PMP_unit_UV_1/sim_PMP_unit_UV_1_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_PMP_unit_UV_1' fileset file properties for remote files
set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMP_unit_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_unit.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMP_unit_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_PMP_unit_UV_1/sim_PMP_unit_UV_1_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMP_unit_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_PMP_unit_UV_1/sim_PMP_unit_UV_1.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMP_unit_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj


# Set 'sim_PMP_unit_UV_1' fileset file properties for local files
# None

# Set 'sim_PMP_unit_UV_1' fileset properties
set obj [get_filesets sim_PMP_unit_UV_1]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "sim_PMP_unit_UV_1" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "PMP_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "200ns" -objects $obj

# Create 'sim_PMP_checker_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_PMP_checker_UV_1] ""]} {
  create_fileset -simset sim_PMP_checker_UV_1
}

# Set 'sim_PMP_checker_UV_1' fileset object
set obj [get_filesets sim_PMP_checker_UV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_checker.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_unit.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PMP_checker_UV_1/sim_PMP_checker_UV_1_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PMP_checker_UV_1/sim_PMP_checker_UV_1_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PMP_checker_UV_1/sim_PMP_checker_UV_1_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_PMP_checker_UV_1' fileset file properties for remote files
set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMP_checker_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_checker.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMP_checker_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_unit.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMP_checker_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_PMP_checker_UV_1/sim_PMP_checker_UV_1_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMP_checker_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_PMP_checker_UV_1/sim_PMP_checker_UV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMP_checker_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj


# Set 'sim_PMP_checker_UV_1' fileset file properties for local files
# None

# Set 'sim_PMP_checker_UV_1' fileset properties
set obj [get_filesets sim_PMP_checker_UV_1]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "sim_PMP_checker_UV_1_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "PMP_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "200ns" -objects $obj

# Create 'sim_PMP_checker_UV_2' fileset (if not found)
if {[string equal [get_filesets -quiet sim_PMP_checker_UV_2] ""]} {
  create_fileset -simset sim_PMP_checker_UV_2
}

# Set 'sim_PMP_checker_UV_2' fileset object
set obj [get_filesets sim_PMP_checker_UV_2]
set files [list \
 [file normalize "${origin_dir}/simulation/sim_PMP_checker_UV_2/PMP_PMA_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PMP_checker_UV_2/PMP_checker.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_unit.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PMP_checker_UV_2/sim_PMP_checker_UV_2_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PMP_checker_UV_2/sim_PMP_checker_UV_2_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PMP_checker_UV_2/sim_PMP_checker_UV_2_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_PMP_checker_UV_2' fileset file properties for remote files
set file "$origin_dir/simulation/sim_PMP_checker_UV_2/PMP_PMA_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMP_checker_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_PMP_checker_UV_2/PMP_checker.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMP_checker_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_unit.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMP_checker_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_PMP_checker_UV_2/sim_PMP_checker_UV_2_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMP_checker_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_PMP_checker_UV_2/sim_PMP_checker_UV_2_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMP_checker_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj


# Set 'sim_PMP_checker_UV_2' fileset file properties for local files
# None

# Set 'sim_PMP_checker_UV_2' fileset properties
set obj [get_filesets sim_PMP_checker_UV_2]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "sim_PMP_checker_UV_2_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "PMP_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "200ns" -objects $obj

# Create 'sim_PMA_checker_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_PMA_checker_UV_1] ""]} {
  create_fileset -simset sim_PMA_checker_UV_1
}

# Set 'sim_PMA_checker_UV_1' fileset object
set obj [get_filesets sim_PMA_checker_UV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMA_checker.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PMA_checker_UV_1/sim_PMA_checker_UV_1_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PMA_checker_UV_1/sim_PMA_checker_UV_1_tb.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_PMA_checker_UV_1' fileset file properties for remote files
set file "$origin_dir/RTL/PMP_PMA_checker/PMA_checker.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMA_checker_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMA_checker_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_PMA_checker_UV_1/sim_PMA_checker_UV_1_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMA_checker_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_PMA_checker_UV_1/sim_PMA_checker_UV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PMA_checker_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj


# Set 'sim_PMA_checker_UV_1' fileset file properties for local files
# None

# Set 'sim_PMA_checker_UV_1' fileset properties
set obj [get_filesets sim_PMA_checker_UV_1]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "sim_PMA_checker_UV_1_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "PMP_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "4000ns" -objects $obj

# Create 'sim_CSR_controller_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_CSR_controller_UV_1] ""]} {
  create_fileset -simset sim_CSR_controller_UV_1
}

# Set 'sim_CSR_controller_UV_1' fileset object
set obj [get_filesets sim_CSR_controller_UV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_controller.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_CSR_controller_UV_1/sim_CSR_controller_UV_1_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_CSR_controller_UV_1/sim_CSR_controller_UV_1_tb.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_CSR_controller_UV_1' fileset file properties for remote files
set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_controller_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/CSR_controller.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_controller_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/CSR_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_controller_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_CSR_controller_UV_1/sim_CSR_controller_UV_1_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_controller_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_CSR_controller_UV_1/sim_CSR_controller_UV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_controller_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj


# Set 'sim_CSR_controller_UV_1' fileset file properties for local files
# None

# Set 'sim_CSR_controller_UV_1' fileset properties
set obj [get_filesets sim_CSR_controller_UV_1]
set_property -name "top" -value "PMP_checker" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "PMP_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "1300ns" -objects $obj

# Create 'sim_CSR_interrupt_gen_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_CSR_interrupt_gen_UV_1] ""]} {
  create_fileset -simset sim_CSR_interrupt_gen_UV_1
}

# Set 'sim_CSR_interrupt_gen_UV_1' fileset object
set obj [get_filesets sim_CSR_interrupt_gen_UV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_interrupt_gen.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_CSR_interrupt_gen_UV_1/sim_CSR_interrupt_gen_UV_1_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_CSR_interrupt_gen_UV_1/sim_CSR_interrupt_gen_UV_1_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_CSR_interrupt_gen_UV_1/sim_CSR_interrupt_gen_UV_1_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_CSR_interrupt_gen_UV_1' fileset file properties for remote files
set file "$origin_dir/RTL/RegisterFile/CSR_interrupt_gen.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_interrupt_gen_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_interrupt_gen_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/CSR_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_interrupt_gen_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_CSR_interrupt_gen_UV_1/sim_CSR_interrupt_gen_UV_1_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_interrupt_gen_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_CSR_interrupt_gen_UV_1/sim_CSR_interrupt_gen_UV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_interrupt_gen_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj


# Set 'sim_CSR_interrupt_gen_UV_1' fileset file properties for local files
# None

# Set 'sim_CSR_interrupt_gen_UV_1' fileset properties
set obj [get_filesets sim_CSR_interrupt_gen_UV_1]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "sim_CSR_interrupt_gen_UV_1_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "RF_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "30ns" -objects $obj

# Create 'sim_CSR_top_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_CSR_top_UV_1] ""]} {
  create_fileset -simset sim_CSR_top_UV_1
}

# Set 'sim_CSR_top_UV_1' fileset object
set obj [get_filesets sim_CSR_top_UV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_CSR_top_UV_1/sim_CSR_top_UV_1_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_CSR_top_UV_1/sim_CSR_top_UV_1_tb.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_controller.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_interrupt_gen.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_CSR_top_UV_1/sim_CSR_top_UV_1_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_CSR_top_UV_1' fileset file properties for remote files
set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_top_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/CSR_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_top_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_CSR_top_UV_1/sim_CSR_top_UV_1_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_top_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_CSR_top_UV_1/sim_CSR_top_UV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_top_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/CSR_controller.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_top_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/CSR_interrupt_gen.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_top_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj


# Set 'sim_CSR_top_UV_1' fileset file properties for local files
# None

# Set 'sim_CSR_top_UV_1' fileset properties
set obj [get_filesets sim_CSR_top_UV_1]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "sim_CSR_top_UV_1_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "RF_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "2000ns" -objects $obj

# Create 'sim_CSR_top_UV_2' fileset (if not found)
if {[string equal [get_filesets -quiet sim_CSR_top_UV_2] ""]} {
  create_fileset -simset sim_CSR_top_UV_2
}

# Set 'sim_CSR_top_UV_2' fileset object
set obj [get_filesets sim_CSR_top_UV_2]
set files [list \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_controller.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_interrupt_gen.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_top.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_CSR_top_UV_2/sim_CSR_top_UV_2_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_CSR_top_UV_2/sim_CSR_top_UV_2_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_CSR_top_UV_2/sim_CSR_top_UV_2_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_CSR_top_UV_2' fileset file properties for remote files
set file "$origin_dir/RTL/RegisterFile/CSR_controller.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_top_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/CSR_interrupt_gen.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_top_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_top_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/CSR_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_top_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/CSR_top.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_top_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_CSR_top_UV_2/sim_CSR_top_UV_2_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_top_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_CSR_top_UV_2/sim_CSR_top_UV_2_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CSR_top_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj


# Set 'sim_CSR_top_UV_2' fileset file properties for local files
# None

# Set 'sim_CSR_top_UV_2' fileset properties
set obj [get_filesets sim_CSR_top_UV_2]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "sim_CSR_top_UV_2_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "RF_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "2000ns" -objects $obj

# Create 'sim_RV32I_RF_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_RV32I_RF_UV_1] ""]} {
  create_fileset -simset sim_RV32I_RF_UV_1
}

# Set 'sim_RV32I_RF_UV_1' fileset object
set obj [get_filesets sim_RV32I_RF_UV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/RF_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/RV32I_RF.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_RV32I_RF_UV_1/sim_RV32I_RF_UV_1_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_RV32I_RF_UV_1/sim_RV32I_RF_UV_1_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_RV32I_RF_UV_1/sim_RV32I_RF_UV_1_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_RV32I_RF_UV_1' fileset file properties for remote files
set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_RV32I_RF_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/RF_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_RV32I_RF_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/RTL/RegisterFile/RV32I_RF.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_RV32I_RF_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_RV32I_RF_UV_1/sim_RV32I_RF_UV_1_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_RV32I_RF_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_RV32I_RF_UV_1/sim_RV32I_RF_UV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_RV32I_RF_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "RF_lib" -objects $file_obj


# Set 'sim_RV32I_RF_UV_1' fileset file properties for local files
# None

# Set 'sim_RV32I_RF_UV_1' fileset properties
set obj [get_filesets sim_RV32I_RF_UV_1]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "sim_RV32I_RF_UV_1_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "RF_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "400 ns" -objects $obj

# Create 'sim_AXI4_CU_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_AXI4_CU_UV_1] ""]} {
  create_fileset -simset sim_AXI4_CU_UV_1
}

# Set 'sim_AXI4_CU_UV_1' fileset object
set obj [get_filesets sim_AXI4_CU_UV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_AXI4_CU_UV_1/sim_AXI4_CU_UV_1_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_AXI4_CU_UV_1/sim_AXI4_CU_UV_1_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_AXI4_CU_UV_1/sim_AXI4_CU_UV_1_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_AXI4_CU_UV_1' fileset file properties for remote files
set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_CU_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_CU_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_CU_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_AXI4_CU_UV_1/sim_AXI4_CU_UV_1_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_CU_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_AXI4_CU_UV_1/sim_AXI4_CU_UV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_CU_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj


# Set 'sim_AXI4_CU_UV_1' fileset file properties for local files
# None

# Set 'sim_AXI4_CU_UV_1' fileset properties
set obj [get_filesets sim_AXI4_CU_UV_1]
set_property -name "top" -value "PMP_checker" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "PMP_lib" -objects $obj
set_property -name "xsim.elaborate.debug_level" -value "all" -objects $obj
set_property -name "xsim.elaborate.relax" -value "0" -objects $obj
set_property -name "xsim.simulate.runtime" -value "2ns" -objects $obj

# Create 'sim_AXI4_CU_UV_2' fileset (if not found)
if {[string equal [get_filesets -quiet sim_AXI4_CU_UV_2] ""]} {
  create_fileset -simset sim_AXI4_CU_UV_2
}

# Set 'sim_AXI4_CU_UV_2' fileset object
set obj [get_filesets sim_AXI4_CU_UV_2]
set files [list \
 [file normalize "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_AXI4_CU_UV_2/sim_AXI4_CU_UV_2_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_AXI4_CU_UV_2/sim_AXI4_CU_UV_2_tb.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_AXI4_CU_UV_2/sim_AXI4_CU_UV_2_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_AXI4_CU_UV_2' fileset file properties for remote files
set file "$origin_dir/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_CU_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_CU_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_AXI4_CU_UV_2/sim_AXI4_CU_UV_2_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_CU_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_AXI4_CU_UV_2/sim_AXI4_CU_UV_2_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_CU_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_CU_UV_2] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj


# Set 'sim_AXI4_CU_UV_2' fileset file properties for local files
# None

# Set 'sim_AXI4_CU_UV_2' fileset properties
set obj [get_filesets sim_AXI4_CU_UV_2]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "sim_AXI4_CU_UV_2_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "AXI4M_lib" -objects $obj
set_property -name "xsim.elaborate.debug_level" -value "all" -objects $obj
set_property -name "xsim.elaborate.relax" -value "0" -objects $obj
set_property -name "xsim.simulate.runtime" -value "2ns" -objects $obj

# Create 'SIM_CU_PC_UV_1' fileset (if not found)
if {[string equal [get_filesets -quiet SIM_CU_PC_UV_1] ""]} {
  create_fileset -simset SIM_CU_PC_UV_1
}

# Set 'SIM_CU_PC_UV_1' fileset object
set obj [get_filesets SIM_CU_PC_UV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_PC_tb.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'SIM_CU_PC_UV_1' fileset file properties for remote files
set file "$origin_dir/RTL/ControlUnit/CU_PC_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets SIM_CU_PC_UV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj


# Set 'SIM_CU_PC_UV_1' fileset file properties for local files
# None

# Set 'SIM_CU_PC_UV_1' fileset properties
set obj [get_filesets SIM_CU_PC_UV_1]
set_property -name "top" -value "PMP_checker" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "PMP_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "4000ns" -objects $obj

# Create 'sim_EC_arbiter_UV_2' fileset (if not found)
if {[string equal [get_filesets -quiet sim_EC_arbiter_UV_2] ""]} {
  create_fileset -simset sim_EC_arbiter_UV_2
}

# Set 'sim_EC_arbiter_UV_2' fileset object
set obj [get_filesets sim_EC_arbiter_UV_2]
# Empty (no sources present)

# Set 'sim_EC_arbiter_UV_2' fileset properties
set obj [get_filesets sim_EC_arbiter_UV_2]
set_property -name "top" -value "PMP_checker" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "PMP_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "4000ns" -objects $obj

# Create 'sim_CU_top_IV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_CU_top_IV_1] ""]} {
  create_fileset -simset sim_CU_top_IV_1
}

# Set 'sim_CU_top_IV_1' fileset object
set obj [get_filesets sim_CU_top_IV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_FSM.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_FSM_tb.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_PC.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_PC_tb.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_decoder.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_decoder_tb.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_execute_enable.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_execute_enable_tb.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_top.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_top_tb_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_top_tb.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_pkg.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_CU_top_IV_1' fileset file properties for remote files
set file "$origin_dir/RTL/ControlUnit/CU_FSM.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_top_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_FSM_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_top_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_PC.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_top_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_PC_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_top_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_decoder.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_top_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_decoder_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_top_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_execute_enable.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_top_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_execute_enable_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_top_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_top.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_top_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_top_tb_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_top_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_top_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_top_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/RTL/ControlUnit/CU_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_CU_top_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'sim_CU_top_IV_1' fileset file properties for local files
# None

# Set 'sim_CU_top_IV_1' fileset properties
set obj [get_filesets sim_CU_top_IV_1]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "CU_FSM_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "CU_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "4000ns" -objects $obj

# Create 'sim_EC_IV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_EC_IV_1] ""]} {
  create_fileset -simset sim_EC_IV_1
}

# Set 'sim_EC_IV_1' fileset object
set obj [get_filesets sim_EC_IV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/ExceptionControll/CSR_access_controll.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/DRA_controll.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/arbiter.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_IV_1/sim_EC_IV_1_registers.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_IV_1/sim_EC_IV_1_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EC_IV_1/sim_EC_IV_1_pkg.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_EC_IV_1' fileset file properties for remote files
set file "$origin_dir/RTL/ExceptionControll/CSR_access_controll.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/DRA_controll.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_FSM.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/arbiter.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_EC_IV_1/sim_EC_IV_1_registers.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_EC_IV_1/sim_EC_IV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_EC_IV_1/sim_EC_IV_1_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "CU_lib" -objects $file_obj


# Set 'sim_EC_IV_1' fileset file properties for local files
# None

# Set 'sim_EC_IV_1' fileset properties
set obj [get_filesets sim_EC_IV_1]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "sim_EC_IV_1_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "CU_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "750 ns" -objects $obj

# Create 'sim_PPC_IV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_PPC_IV_1] ""]} {
  create_fileset -simset sim_PPC_IV_1
}

# Set 'sim_PPC_IV_1' fileset object
set obj [get_filesets sim_PPC_IV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMA_checker.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_checker.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_checker.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_unit.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PPC_IV_1/sim_PPC_IV_1_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PPC_IV_1/sim_PPC_IV_1_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_PPC_IV_1/sim_PPC_IV_1_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_PPC_IV_1' fileset file properties for remote files
set file "$origin_dir/RTL/PMP_PMA_checker/PMA_checker.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PPC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PPC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_checker.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PPC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_checker.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PPC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_unit.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PPC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_PPC_IV_1/sim_PPC_IV_1_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PPC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_PPC_IV_1/sim_PPC_IV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_PPC_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj


# Set 'sim_PPC_IV_1' fileset file properties for local files
# None

# Set 'sim_PPC_IV_1' fileset properties
set obj [get_filesets sim_PPC_IV_1]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "sim_PPC_IV_1" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "PMP_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "4000ns" -objects $obj

# Create 'sim_AXI4_IV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_AXI4_IV_1] ""]} {
  create_fileset -simset sim_AXI4_IV_1
}

# Set 'sim_AXI4_IV_1' fileset object
set obj [get_filesets sim_AXI4_IV_1]
set files [list \
 [file normalize "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master.vhd"] \
 [file normalize "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_AXI4_IV_1/sim_AXI4_IV_1_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_AXI4_IV_1/sim_AXI4_IV_1_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_AXI4_IV_1/sim_AXI4_IV_1_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_AXI4_IV_1' fileset file properties for remote files
set file "$origin_dir/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/RTL/AXI4_Lite_Master/AXI4_lite_master.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_AXI4_IV_1/sim_AXI4_IV_1_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/simulation/sim_AXI4_IV_1/sim_AXI4_IV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_AXI4_IV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj


# Set 'sim_AXI4_IV_1' fileset file properties for local files
# None

# Set 'sim_AXI4_IV_1' fileset properties
set obj [get_filesets sim_AXI4_IV_1]
set_property -name "source_set" -value "" -objects $obj
set_property -name "top" -value "sim_AXI4_IV_1_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "AXI4M_lib" -objects $obj
set_property -name "xsim.simulate.runtime" -value "250 ns" -objects $obj

# Set 'utils_1' fileset object
set obj [get_filesets utils_1]
# Empty (no sources present)

# Set 'utils_1' fileset properties
set obj [get_filesets utils_1]


# Adding sources referenced in BDs, if not already added
if { [get_files LoadBufferRegister.vhd] == "" } {
  import_files -quiet -fileset sources_1 /home/levi/Software/EDRICO/RTL/LoadBufferRegister/LoadBufferRegister.vhd
}
if { [get_files MUX_32_3.vhd] == "" } {
  import_files -quiet -fileset sources_1 /home/levi/Software/EDRICO/RTL/MUX/MUX_32_3.vhd
}
if { [get_files MUX_32_2.vhd] == "" } {
  import_files -quiet -fileset sources_1 /home/levi/Software/EDRICO/RTL/MUX/MUX_32_2.vhd
}
if { [get_files MUX_32_2.vhd] == "" } {
  import_files -quiet -fileset sources_1 /home/levi/Software/EDRICO/RTL/MUX/MUX_32_2.vhd
}
if { [get_files MUX_32_2.vhd] == "" } {
  import_files -quiet -fileset sources_1 /home/levi/Software/EDRICO/RTL/MUX/MUX_32_2.vhd
}
if { [get_files MUX_32_2.vhd] == "" } {
  import_files -quiet -fileset sources_1 /home/levi/Software/EDRICO/RTL/MUX/MUX_32_2.vhd
}
if { [get_files MUX_CSR.vhd] == "" } {
  import_files -quiet -fileset sources_1 /home/levi/Software/EDRICO/RTL/MUX/MUX_CSR.vhd
}


# Proc to create BD EDRICO
proc cr_bd_EDRICO { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# LoadBufferRegister, MUX_32_3, MUX_32_2, MUX_CSR, MUX_32_2, MUX_32_2, MUX_32_2



  # CHANGE DESIGN NAME HERE
  set design_name EDRICO

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  DHBWRavensburg:ALU_lib:ALU:1.0\
  DHBWRavensburg:AXI4M_lib:AXI4_lite_master:1.0\
  user.org:CU_lib:ControlUnit:1.0\
  DHBWRavensburg:DMU_lib:DataMaskUnit:1.0\
  DHBWRavensburg:EC_lib:Exception_Control:1.0\
  DHBWRavensburg:PMP_lib:PMP_PMA_checker:1.0\
  DHBWRavensburg:RF_lib:RegisterFile:1.0\
  user.org:user:mmCSR_AXI4_slave:1.0\
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  ##################################################################
  # CHECK Modules
  ##################################################################
  set bCheckModules 1
  if { $bCheckModules == 1 } {
     set list_check_mods "\ 
  LoadBufferRegister\
  MUX_32_3\
  MUX_32_2\
  MUX_CSR\
  MUX_32_2\
  MUX_32_2\
  MUX_32_2\
  "

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports

  # Create instance: ALU_0, and set properties
  set ALU_0 [ create_bd_cell -type ip -vlnv DHBWRavensburg:ALU_lib:ALU:1.0 ALU_0 ]

  # Create instance: AXI4_lite_master_0, and set properties
  set AXI4_lite_master_0 [ create_bd_cell -type ip -vlnv DHBWRavensburg:AXI4M_lib:AXI4_lite_master:1.0 AXI4_lite_master_0 ]

  # Create instance: ControlUnit_0, and set properties
  set ControlUnit_0 [ create_bd_cell -type ip -vlnv user.org:CU_lib:ControlUnit:1.0 ControlUnit_0 ]

  # Create instance: DataMaskUnit_0, and set properties
  set DataMaskUnit_0 [ create_bd_cell -type ip -vlnv DHBWRavensburg:DMU_lib:DataMaskUnit:1.0 DataMaskUnit_0 ]

  # Create instance: Exception_Control_0, and set properties
  set Exception_Control_0 [ create_bd_cell -type ip -vlnv DHBWRavensburg:EC_lib:Exception_Control:1.0 Exception_Control_0 ]

  # Create instance: LoadBufferRegister_0, and set properties
  set block_name LoadBufferRegister
  set block_cell_name LoadBufferRegister_0
  if { [catch {set LoadBufferRegister_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $LoadBufferRegister_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MUX_A, and set properties
  set block_name MUX_32_3
  set block_cell_name MUX_A
  if { [catch {set MUX_A [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MUX_A eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MUX_B, and set properties
  set block_name MUX_32_2
  set block_cell_name MUX_B
  if { [catch {set MUX_B [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MUX_B eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MUX_EC_CSR, and set properties
  set block_name MUX_CSR
  set block_cell_name MUX_EC_CSR
  if { [catch {set MUX_EC_CSR [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MUX_EC_CSR eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MUX_EC_RF_in, and set properties
  set block_name MUX_32_2
  set block_cell_name MUX_EC_RF_in
  if { [catch {set MUX_EC_RF_in [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MUX_EC_RF_in eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MUX_EC_RF_out, and set properties
  set block_name MUX_32_2
  set block_cell_name MUX_EC_RF_out
  if { [catch {set MUX_EC_RF_out [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MUX_EC_RF_out eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MUX_R, and set properties
  set block_name MUX_32_2
  set block_cell_name MUX_R
  if { [catch {set MUX_R [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MUX_R eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: PMP_PMA_checker_0, and set properties
  set PMP_PMA_checker_0 [ create_bd_cell -type ip -vlnv DHBWRavensburg:PMP_lib:PMP_PMA_checker:1.0 PMP_PMA_checker_0 ]

  # Create instance: RegisterFile_0, and set properties
  set RegisterFile_0 [ create_bd_cell -type ip -vlnv DHBWRavensburg:RF_lib:RegisterFile:1.0 RegisterFile_0 ]

  # Create instance: mmCSR_AXI4_slave_0, and set properties
  set mmCSR_AXI4_slave_0 [ create_bd_cell -type ip -vlnv user.org:user:mmCSR_AXI4_slave:1.0 mmCSR_AXI4_slave_0 ]

  # Create port connections
  connect_bd_net -net ALU_0_branch_re [get_bd_pins ALU_0/branch_re] [get_bd_pins ControlUnit_0/branch_re]
  connect_bd_net -net AXI4_lite_master_0_data_out [get_bd_pins AXI4_lite_master_0/data_out] [get_bd_pins ControlUnit_0/IR_inp] [get_bd_pins LoadBufferRegister_0/data_in]
  connect_bd_net -net AXI4_lite_master_0_instruction_afe_AXI [get_bd_pins AXI4_lite_master_0/instruction_afe_AXI] [get_bd_pins Exception_Control_0/instruction_afe_AXI]
  connect_bd_net -net AXI4_lite_master_0_load_afe_AXI [get_bd_pins AXI4_lite_master_0/load_afe_AXI] [get_bd_pins Exception_Control_0/load_afe_AXI]
  connect_bd_net -net AXI4_lite_master_0_memOp_finished [get_bd_pins AXI4_lite_master_0/memOp_finished] [get_bd_pins ControlUnit_0/memOP_finished]
  connect_bd_net -net AXI4_lite_master_0_storeAMO_afe_AXI [get_bd_pins AXI4_lite_master_0/storeAMO_afe_AXI] [get_bd_pins Exception_Control_0/storeAMO_afe_AXI]
  connect_bd_net -net AXI4_lite_master_0_store_systemData [get_bd_pins AXI4_lite_master_0/store_systemData] [get_bd_pins ControlUnit_0/store_systemData] [get_bd_pins LoadBufferRegister_0/store_systemData]
  connect_bd_net -net ControlUnit_0_ALU_OP [get_bd_pins ALU_0/alu_op] [get_bd_pins ControlUnit_0/ALU_OP]
  connect_bd_net -net ControlUnit_0_CSR_address [get_bd_pins ControlUnit_0/CSR_address] [get_bd_pins MUX_EC_CSR/CSR_address_CU]
  connect_bd_net -net ControlUnit_0_DMU_IN_MUX_ctrl [get_bd_pins ControlUnit_0/DMU_IN_MUX_ctrl] [get_bd_pins DataMaskUnit_0/DMU_IN_MUX_ctrl]
  connect_bd_net -net ControlUnit_0_DMU_OUT_MUX_ctrl [get_bd_pins ControlUnit_0/DMU_OUT_MUX_ctrl] [get_bd_pins DataMaskUnit_0/DMU_OUT_MUX_ctrl]
  connect_bd_net -net ControlUnit_0_IR_dra [get_bd_pins ControlUnit_0/IR_dra] [get_bd_pins Exception_Control_0/IR_dra]
  connect_bd_net -net ControlUnit_0_PC_out [get_bd_pins ControlUnit_0/PC_out] [get_bd_pins Exception_Control_0/PC_dra]
  connect_bd_net -net ControlUnit_0_PMP_enable [get_bd_pins ControlUnit_0/PMP_enable] [get_bd_pins PMP_PMA_checker_0/enable]
  connect_bd_net -net ControlUnit_0_PMP_instruction [get_bd_pins ControlUnit_0/PMP_instruction] [get_bd_pins PMP_PMA_checker_0/instruction]
  connect_bd_net -net ControlUnit_0_PMP_rw [get_bd_pins ControlUnit_0/PMP_rw] [get_bd_pins PMP_PMA_checker_0/readWrite]
  connect_bd_net -net ControlUnit_0_PMP_size [get_bd_pins ControlUnit_0/PMP_size] [get_bd_pins PMP_PMA_checker_0/size]
  connect_bd_net -net ControlUnit_0_be_CU [get_bd_pins ControlUnit_0/be_CU] [get_bd_pins Exception_Control_0/be_CU]
  connect_bd_net -net ControlUnit_0_ece_CU [get_bd_pins ControlUnit_0/ece_CU] [get_bd_pins Exception_Control_0/ece_CU]
  connect_bd_net -net ControlUnit_0_iie_CU [get_bd_pins ControlUnit_0/iie_CU] [get_bd_pins Exception_Control_0/iie_CU]
  connect_bd_net -net ControlUnit_0_instr_finished [get_bd_pins ControlUnit_0/instr_finished] [get_bd_pins RegisterFile_0/instr_finished]
  connect_bd_net -net ControlUnit_0_mask_ctrl [get_bd_pins ControlUnit_0/mask_ctrl] [get_bd_pins DataMaskUnit_0/mask_ctrl]
  connect_bd_net -net ControlUnit_0_read_CSR [get_bd_pins ControlUnit_0/read_CSR] [get_bd_pins MUX_EC_CSR/read_CSR_CU]
  connect_bd_net -net ControlUnit_0_register_read_A [get_bd_pins ControlUnit_0/register_read_A] [get_bd_pins RegisterFile_0/register_read_A]
  connect_bd_net -net ControlUnit_0_register_read_B [get_bd_pins ControlUnit_0/register_read_B] [get_bd_pins RegisterFile_0/register_read_B]
  connect_bd_net -net ControlUnit_0_register_write [get_bd_pins ControlUnit_0/register_write] [get_bd_pins RegisterFile_0/register_write]
  connect_bd_net -net ControlUnit_0_ret [get_bd_pins ControlUnit_0/ret] [get_bd_pins Exception_Control_0/ret]
  connect_bd_net -net ControlUnit_0_save_CSR [get_bd_pins ControlUnit_0/save_CSR] [get_bd_pins RegisterFile_0/CSR_save]
  connect_bd_net -net ControlUnit_0_write_CSR [get_bd_pins ControlUnit_0/write_CSR] [get_bd_pins MUX_EC_CSR/write_CSR_CU]
  connect_bd_net -net DataMaskUnit_0_data_store [get_bd_pins AXI4_lite_master_0/data_in] [get_bd_pins DataMaskUnit_0/data_store]
  connect_bd_net -net Exception_Control_0_CSR_address_EC [get_bd_pins Exception_Control_0/CSR_address_EC] [get_bd_pins MUX_EC_CSR/CSR_address_EC]
  connect_bd_net -net Exception_Control_0_CSR_read_EC [get_bd_pins Exception_Control_0/CSR_read_EC] [get_bd_pins MUX_EC_CSR/read_CSR_EC]
  connect_bd_net -net Exception_Control_0_CSR_write_EC [get_bd_pins Exception_Control_0/CSR_write_EC] [get_bd_pins MUX_EC_CSR/write_CSR_EC]
  connect_bd_net -net Exception_Control_0_PC_dra_write [get_bd_pins ControlUnit_0/PC_dra] [get_bd_pins Exception_Control_0/PC_dra_write]
  connect_bd_net -net Exception_Control_0_PC_write [get_bd_pins ControlUnit_0/pc_write] [get_bd_pins Exception_Control_0/PC_write]
  connect_bd_net -net Exception_Control_0_halt_core [get_bd_pins AXI4_lite_master_0/halt_core] [get_bd_pins ControlUnit_0/halt_core] [get_bd_pins Exception_Control_0/halt_core]
  connect_bd_net -net LoadBufferRegister_0_data_out [get_bd_pins DataMaskUnit_0/LoadBufferRegister] [get_bd_pins LoadBufferRegister_0/data_out]
  connect_bd_net -net MUX_A_C_out [get_bd_pins ALU_0/in_a] [get_bd_pins MUX_A/C_out]
  connect_bd_net -net MUX_B_C_out [get_bd_pins ALU_0/in_b] [get_bd_pins MUX_B/C_out]
  connect_bd_net -net MUX_EC_CSR_CSR_address [get_bd_pins MUX_EC_CSR/CSR_address] [get_bd_pins RegisterFile_0/CSR_address]
  connect_bd_net -net MUX_EC_CSR_read_CSR [get_bd_pins MUX_EC_CSR/read_CSR] [get_bd_pins RegisterFile_0/CSR_read]
  connect_bd_net -net MUX_EC_CSR_write_CSR [get_bd_pins MUX_EC_CSR/write_CSR] [get_bd_pins RegisterFile_0/CSR_write]
  connect_bd_net -net MUX_EC_RF_in_C_out [get_bd_pins MUX_EC_RF_in/C_out] [get_bd_pins RegisterFile_0/data_in]
  connect_bd_net -net PMP_PMA_checker_0_address_dra [get_bd_pins Exception_Control_0/PMP_dra] [get_bd_pins PMP_PMA_checker_0/address_dra]
  connect_bd_net -net PMP_PMA_checker_0_address_out [get_bd_pins AXI4_lite_master_0/address_in] [get_bd_pins PMP_PMA_checker_0/address_out]
  connect_bd_net -net PMP_PMA_checker_0_enable_out [get_bd_pins AXI4_lite_master_0/enable] [get_bd_pins PMP_PMA_checker_0/enable_out]
  connect_bd_net -net PMP_PMA_checker_0_instruction_afe_P [get_bd_pins Exception_Control_0/instruction_afe_P] [get_bd_pins PMP_PMA_checker_0/instruction_afe_P]
  connect_bd_net -net PMP_PMA_checker_0_instruction_ame_P [get_bd_pins Exception_Control_0/instruction_ame_P] [get_bd_pins PMP_PMA_checker_0/instruction_ame_P]
  connect_bd_net -net PMP_PMA_checker_0_instruction_out [get_bd_pins AXI4_lite_master_0/instruction] [get_bd_pins PMP_PMA_checker_0/instruction_out]
  connect_bd_net -net PMP_PMA_checker_0_load_afe_P [get_bd_pins Exception_Control_0/load_afe_P] [get_bd_pins PMP_PMA_checker_0/load_afe_P]
  connect_bd_net -net PMP_PMA_checker_0_load_ame_P [get_bd_pins Exception_Control_0/load_ame_P] [get_bd_pins PMP_PMA_checker_0/load_ame_P]
  connect_bd_net -net PMP_PMA_checker_0_readWrite_out [get_bd_pins AXI4_lite_master_0/readWrite] [get_bd_pins PMP_PMA_checker_0/readWrite_out]
  connect_bd_net -net PMP_PMA_checker_0_size_out [get_bd_pins AXI4_lite_master_0/size] [get_bd_pins PMP_PMA_checker_0/size_out]
  connect_bd_net -net PMP_PMA_checker_0_storeAMO_afe_P [get_bd_pins Exception_Control_0/storeAMO_afe_P] [get_bd_pins PMP_PMA_checker_0/storeAMO_afe_P]
  connect_bd_net -net PMP_PMA_checker_0_storeAMO_ame_P [get_bd_pins Exception_Control_0/storeAMO_ame_P] [get_bd_pins PMP_PMA_checker_0/storeAMO_ame_P]
  connect_bd_net -net RegisterFile_0_data_bus_B [get_bd_pins ControlUnit_0/data_bus_B] [get_bd_pins RegisterFile_0/data_bus_B]
  connect_bd_net -net RegisterFile_0_iie_CSR [get_bd_pins Exception_Control_0/iie_CSR] [get_bd_pins RegisterFile_0/iie_CSR]
  connect_bd_net -net RegisterFile_0_msi_CSR [get_bd_pins Exception_Control_0/si_CSR] [get_bd_pins RegisterFile_0/msi_CSR]
  connect_bd_net -net RegisterFile_0_mti_CSR [get_bd_pins Exception_Control_0/ti_CSR] [get_bd_pins RegisterFile_0/mti_CSR]
  connect_bd_net -net RegisterFile_0_pmpaddr_0 [get_bd_pins PMP_PMA_checker_0/pmpaddr_0] [get_bd_pins RegisterFile_0/pmpaddr_0]
  connect_bd_net -net RegisterFile_0_pmpaddr_1 [get_bd_pins PMP_PMA_checker_0/pmpaddr_1] [get_bd_pins RegisterFile_0/pmpaddr_1]
  connect_bd_net -net RegisterFile_0_pmpaddr_2 [get_bd_pins PMP_PMA_checker_0/pmpaddr_2] [get_bd_pins RegisterFile_0/pmpaddr_2]
  connect_bd_net -net RegisterFile_0_pmpaddr_3 [get_bd_pins PMP_PMA_checker_0/pmpaddr_3] [get_bd_pins RegisterFile_0/pmpaddr_3]
  connect_bd_net -net RegisterFile_0_pmpaddr_4 [get_bd_pins PMP_PMA_checker_0/pmpaddr_4] [get_bd_pins RegisterFile_0/pmpaddr_4]
  connect_bd_net -net RegisterFile_0_pmpaddr_5 [get_bd_pins PMP_PMA_checker_0/pmpaddr_5] [get_bd_pins RegisterFile_0/pmpaddr_5]
  connect_bd_net -net RegisterFile_0_pmpaddr_6 [get_bd_pins PMP_PMA_checker_0/pmpaddr_6] [get_bd_pins RegisterFile_0/pmpaddr_6]
  connect_bd_net -net RegisterFile_0_pmpaddr_7 [get_bd_pins PMP_PMA_checker_0/pmpaddr_7] [get_bd_pins RegisterFile_0/pmpaddr_7]
  connect_bd_net -net RegisterFile_0_pmpaddr_8 [get_bd_pins PMP_PMA_checker_0/pmpaddr_8] [get_bd_pins RegisterFile_0/pmpaddr_8]
  connect_bd_net -net RegisterFile_0_pmpaddr_9 [get_bd_pins PMP_PMA_checker_0/pmpaddr_9] [get_bd_pins RegisterFile_0/pmpaddr_9]
  connect_bd_net -net RegisterFile_0_pmpaddr_10 [get_bd_pins PMP_PMA_checker_0/pmpaddr_10] [get_bd_pins RegisterFile_0/pmpaddr_10]
  connect_bd_net -net RegisterFile_0_pmpaddr_11 [get_bd_pins PMP_PMA_checker_0/pmpaddr_11] [get_bd_pins RegisterFile_0/pmpaddr_11]
  connect_bd_net -net RegisterFile_0_pmpaddr_12 [get_bd_pins PMP_PMA_checker_0/pmpaddr_12] [get_bd_pins RegisterFile_0/pmpaddr_12]
  connect_bd_net -net RegisterFile_0_pmpaddr_13 [get_bd_pins PMP_PMA_checker_0/pmpaddr_13] [get_bd_pins RegisterFile_0/pmpaddr_13]
  connect_bd_net -net RegisterFile_0_pmpaddr_14 [get_bd_pins PMP_PMA_checker_0/pmpaddr_14] [get_bd_pins RegisterFile_0/pmpaddr_14]
  connect_bd_net -net RegisterFile_0_pmpaddr_15 [get_bd_pins PMP_PMA_checker_0/pmpaddr_15] [get_bd_pins RegisterFile_0/pmpaddr_15]
  connect_bd_net -net RegisterFile_0_pmpcfg_0 [get_bd_pins PMP_PMA_checker_0/pmpcfg_0] [get_bd_pins RegisterFile_0/pmpcfg_0]
  connect_bd_net -net RegisterFile_0_pmpcfg_1 [get_bd_pins PMP_PMA_checker_0/pmpcfg_1] [get_bd_pins RegisterFile_0/pmpcfg_1]
  connect_bd_net -net RegisterFile_0_pmpcfg_2 [get_bd_pins PMP_PMA_checker_0/pmpcfg_2] [get_bd_pins RegisterFile_0/pmpcfg_2]
  connect_bd_net -net RegisterFile_0_pmpcfg_3 [get_bd_pins PMP_PMA_checker_0/pmpcfg_3] [get_bd_pins RegisterFile_0/pmpcfg_3]
  connect_bd_net -net RegisterFile_0_pmpcfg_4 [get_bd_pins PMP_PMA_checker_0/pmpcfg_4] [get_bd_pins RegisterFile_0/pmpcfg_4]
  connect_bd_net -net RegisterFile_0_pmpcfg_5 [get_bd_pins PMP_PMA_checker_0/pmpcfg_5] [get_bd_pins RegisterFile_0/pmpcfg_5]
  connect_bd_net -net RegisterFile_0_pmpcfg_6 [get_bd_pins PMP_PMA_checker_0/pmpcfg_6] [get_bd_pins RegisterFile_0/pmpcfg_6]
  connect_bd_net -net RegisterFile_0_pmpcfg_7 [get_bd_pins PMP_PMA_checker_0/pmpcfg_7] [get_bd_pins RegisterFile_0/pmpcfg_7]
  connect_bd_net -net RegisterFile_0_pmpcfg_8 [get_bd_pins PMP_PMA_checker_0/pmpcfg_8] [get_bd_pins RegisterFile_0/pmpcfg_8]
  connect_bd_net -net RegisterFile_0_pmpcfg_9 [get_bd_pins PMP_PMA_checker_0/pmpcfg_9] [get_bd_pins RegisterFile_0/pmpcfg_9]
  connect_bd_net -net RegisterFile_0_pmpcfg_10 [get_bd_pins PMP_PMA_checker_0/pmpcfg_10] [get_bd_pins RegisterFile_0/pmpcfg_10]
  connect_bd_net -net RegisterFile_0_pmpcfg_11 [get_bd_pins PMP_PMA_checker_0/pmpcfg_11] [get_bd_pins RegisterFile_0/pmpcfg_11]
  connect_bd_net -net RegisterFile_0_pmpcfg_12 [get_bd_pins PMP_PMA_checker_0/pmpcfg_12] [get_bd_pins RegisterFile_0/pmpcfg_12]
  connect_bd_net -net RegisterFile_0_pmpcfg_13 [get_bd_pins PMP_PMA_checker_0/pmpcfg_13] [get_bd_pins RegisterFile_0/pmpcfg_13]
  connect_bd_net -net RegisterFile_0_pmpcfg_14 [get_bd_pins PMP_PMA_checker_0/pmpcfg_14] [get_bd_pins RegisterFile_0/pmpcfg_14]
  connect_bd_net -net RegisterFile_0_pmpcfg_15 [get_bd_pins PMP_PMA_checker_0/pmpcfg_15] [get_bd_pins RegisterFile_0/pmpcfg_15]
  connect_bd_net -net mmCSR_AXI4_slave_0_msip [get_bd_pins RegisterFile_0/msip_dra] [get_bd_pins mmCSR_AXI4_slave_0/msip]
  connect_bd_net -net mmCSR_AXI4_slave_0_mtip [get_bd_pins RegisterFile_0/mtip_dra] [get_bd_pins mmCSR_AXI4_slave_0/mtip]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   "ActiveEmotionalView":"Default View",
   "Default View_ScaleFactor":"0.236831",
   "Default View_TopLeft":"-2669,-3103",
   "ExpandedHierarchyInLayout":"",
   "guistr":"# # String gsaved with Nlview 7.0r4  2019-12-20 bk=1.5203 VDI=41 GEI=36 GUI=JA:10.0 TLS
#  -string -flagsOSRD
preplace inst mmCSR_AXI4_slave_0 -pg 1 -lvl 6 -x 950 -y -2400 -defaultsOSRD -orient R180
preplace inst AXI4_lite_master_0 -pg 1 -lvl 8 -x 2040 -y -1510 -defaultsOSRD
preplace inst RegisterFile_0 -pg 1 -lvl 6 -x 950 -y -1710 -defaultsOSRD
preplace inst PMP_PMA_checker_0 -pg 1 -lvl 7 -x 1340 -y -1730 -defaultsOSRD
preplace inst ControlUnit_0 -pg 1 -lvl 1 -x -1210 -y -1770 -defaultsOSRD
preplace inst ALU_0 -pg 1 -lvl 3 -x -240 -y -1740 -defaultsOSRD
preplace inst DataMaskUnit_0 -pg 1 -lvl 3 -x -240 -y -1250 -defaultsOSRD
preplace inst Exception_Control_0 -pg 1 -lvl 3 -x -240 -y -2520 -defaultsOSRD
preplace inst LoadBufferRegister_0 -pg 1 -lvl 3 -x -240 -y -1040 -defaultsOSRD
preplace inst MUX_A -pg 1 -lvl 2 -x -780 -y -1830 -defaultsOSRD
preplace inst MUX_B -pg 1 -lvl 2 -x -780 -y -1640 -defaultsOSRD
preplace inst MUX_EC_RF_out -pg 1 -lvl 3 -x -240 -y -2100 -defaultsOSRD -orient R180
preplace inst MUX_R -pg 1 -lvl 4 -x 220 -y -1750 -defaultsOSRD
preplace inst MUX_EC_RF_in -pg 1 -lvl 5 -x 590 -y -1740 -defaultsOSRD
preplace inst MUX_EC_CSR -pg 1 -lvl 4 -x 220 -y -1520 -defaultsOSRD
preplace netloc LoadBufferRegister_0_data_out 1 2 2 -420 -1130 -60
preplace netloc MUX_A_C_out 1 2 1 -600 -1830n
preplace netloc MUX_B_C_out 1 2 1 -620 -1720n
preplace netloc MUX_EC_CSR_read_CSR 1 4 2 450 -1660 760J
preplace netloc MUX_EC_CSR_write_CSR 1 4 2 440 -1820 740J
preplace netloc MUX_EC_CSR_CSR_address 1 4 2 430 -1830 750J
preplace netloc MUX_EC_RF_in_C_out 1 5 1 720 -1790n
preplace netloc PMP_PMA_checker_0_address_out 1 7 1 1590 -1840n
preplace netloc PMP_PMA_checker_0_enable_out 1 7 1 1610 -1800n
preplace netloc PMP_PMA_checker_0_readWrite_out 1 7 1 1600 -1780n
preplace netloc PMP_PMA_checker_0_instruction_out 1 7 1 1580 -1760n
preplace netloc PMP_PMA_checker_0_size_out 1 7 1 1570 -1740n
preplace netloc DataMaskUnit_0_data_store 1 3 5 -60J -1250 NJ -1250 730J -1260 N -1260 1600
preplace netloc Exception_Control_0_halt_core 1 0 8 -1420 -1430 N -1430 N -1430 -20J -1280 NJ -1280 NJ -1280 N -1280 1570
preplace netloc PMP_PMA_checker_0_load_ame_P 1 2 6 -510 -1370 NJ -1370 NJ -1370 750J -1210 N -1210 1550
preplace netloc PMP_PMA_checker_0_storeAMO_ame_P 1 2 6 -520 -1350 NJ -1350 NJ -1350 720J -1190 N -1190 1560
preplace netloc PMP_PMA_checker_0_instruction_ame_P 1 2 6 -490 -1410 -50J -1240 NJ -1240 NJ -1240 N -1240 1510
preplace netloc PMP_PMA_checker_0_load_afe_P 1 2 6 -530 -1380 NJ -1380 NJ -1380 760J -1220 N -1220 1520
preplace netloc PMP_PMA_checker_0_storeAMO_afe_P 1 2 6 -540 -1360 NJ -1360 NJ -1360 740J -1200 N -1200 1530
preplace netloc PMP_PMA_checker_0_instruction_afe_P 1 2 6 -500 -1390 NJ -1390 NJ -1390 770J -1250 N -1250 1500
preplace netloc RegisterFile_0_pmpcfg_0 1 6 1 N -1970
preplace netloc RegisterFile_0_pmpcfg_1 1 6 1 N -1950
preplace netloc RegisterFile_0_pmpcfg_2 1 6 1 N -1930
preplace netloc RegisterFile_0_pmpcfg_3 1 6 1 N -1910
preplace netloc RegisterFile_0_pmpcfg_4 1 6 1 N -1890
preplace netloc RegisterFile_0_pmpcfg_5 1 6 1 N -1870
preplace netloc RegisterFile_0_pmpcfg_6 1 6 1 N -1850
preplace netloc RegisterFile_0_pmpcfg_7 1 6 1 N -1830
preplace netloc RegisterFile_0_pmpcfg_8 1 6 1 N -1810
preplace netloc RegisterFile_0_pmpcfg_9 1 6 1 N -1790
preplace netloc RegisterFile_0_pmpcfg_10 1 6 1 N -1770
preplace netloc RegisterFile_0_pmpcfg_11 1 6 1 N -1750
preplace netloc RegisterFile_0_pmpcfg_12 1 6 1 N -1730
preplace netloc RegisterFile_0_pmpcfg_13 1 6 1 N -1710
preplace netloc RegisterFile_0_pmpcfg_14 1 6 1 N -1690
preplace netloc RegisterFile_0_pmpcfg_15 1 6 1 N -1670
preplace netloc RegisterFile_0_pmpaddr_0 1 6 1 N -1650
preplace netloc RegisterFile_0_pmpaddr_1 1 6 1 N -1630
preplace netloc RegisterFile_0_pmpaddr_2 1 6 1 N -1610
preplace netloc RegisterFile_0_pmpaddr_3 1 6 1 N -1590
preplace netloc RegisterFile_0_pmpaddr_4 1 6 1 N -1570
preplace netloc RegisterFile_0_pmpaddr_5 1 6 1 N -1550
preplace netloc RegisterFile_0_pmpaddr_6 1 6 1 N -1530
preplace netloc RegisterFile_0_pmpaddr_7 1 6 1 N -1510
preplace netloc RegisterFile_0_pmpaddr_8 1 6 1 N -1490
preplace netloc RegisterFile_0_pmpaddr_9 1 6 1 N -1470
preplace netloc RegisterFile_0_pmpaddr_10 1 6 1 N -1450
preplace netloc RegisterFile_0_pmpaddr_11 1 6 1 N -1430
preplace netloc RegisterFile_0_pmpaddr_12 1 6 1 N -1410
preplace netloc RegisterFile_0_pmpaddr_13 1 6 1 N -1390
preplace netloc RegisterFile_0_pmpaddr_14 1 6 1 N -1370
preplace netloc RegisterFile_0_pmpaddr_15 1 6 1 N -1350
preplace netloc PMP_PMA_checker_0_address_dra 1 2 6 -470 -1400 NJ -1400 NJ -1400 780J -1230 NJ -1230 1540
preplace netloc RegisterFile_0_iie_CSR 1 2 5 -450 -2210 NJ -2210 NJ -2210 NJ -2210 1130
preplace netloc RegisterFile_0_mti_CSR 1 2 5 -430 -2190 NJ -2190 NJ -2190 NJ -2190 1120
preplace netloc RegisterFile_0_msi_CSR 1 2 5 -440 -2200 NJ -2200 NJ -2200 NJ -2200 1140
preplace netloc ControlUnit_0_iie_CU 1 1 2 -1000 -2550 NJ
preplace netloc ControlUnit_0_ece_CU 1 1 2 -970 -2530 NJ
preplace netloc ControlUnit_0_be_CU 1 1 2 -940 -2510 NJ
preplace netloc AXI4_lite_master_0_instruction_afe_AXI 1 2 7 -420 -2230 NJ -2230 NJ -2230 NJ -2230 NJ -2230 NJ -2230 2210
preplace netloc AXI4_lite_master_0_storeAMO_afe_AXI 1 2 7 -480 -2220 NJ -2220 NJ -2220 NJ -2220 NJ -2220 NJ -2220 2200
preplace netloc AXI4_lite_master_0_load_afe_AXI 1 2 7 -460 -2250 NJ -2250 NJ -2250 NJ -2250 NJ -2250 NJ -2250 2240
preplace netloc AXI4_lite_master_0_store_systemData 1 0 9 -1450 -1140 N -1140 -570 -1140 NJ -1140 NJ -1140 NJ -1140 NJ -1140 NJ -1140 2230
preplace netloc AXI4_lite_master_0_memOp_finished 1 0 9 -1430 -1440 NJ -1440 NJ -1440 -30J -1290 NJ -1290 NJ -1290 NJ -1290 NJ -1290 2220
preplace netloc AXI4_lite_master_0_data_out 1 0 9 -1410 -1150 N -1150 -440 -1150 NJ -1150 NJ -1150 NJ -1150 NJ -1150 NJ -1150 2200
preplace netloc ALU_0_branch_re 1 0 4 -1380 -1450 NJ -1450 NJ -1450 -60
preplace netloc Exception_Control_0_PC_dra_write 1 0 4 -1400 -2090 -920J -2010 NJ -2010 -50
preplace netloc Exception_Control_0_PC_write 1 0 4 -1440 -2100 NJ -2100 -590J -2020 -60
preplace netloc ControlUnit_0_IR_dra 1 1 2 -1020 -2410 NJ
preplace netloc ControlUnit_0_PC_out 1 1 2 -990 -2370 NJ
preplace netloc ControlUnit_0_ret 1 1 2 -1030 -2350 NJ
preplace netloc ControlUnit_0_save_CSR 1 1 5 -920J -1720 -640J -1840 NJ -1840 NJ -1840 760
preplace netloc ControlUnit_0_write_CSR 1 1 3 -1010J -1520 NJ -1520 N
preplace netloc ControlUnit_0_read_CSR 1 1 3 -980J -1550 NJ -1550 10
preplace netloc ControlUnit_0_CSR_address 1 1 3 -1020J -1480 NJ -1480 N
preplace netloc Exception_Control_0_CSR_read_EC 1 3 1 30 -2580n
preplace netloc Exception_Control_0_CSR_write_EC 1 3 1 20 -2560n
preplace netloc Exception_Control_0_CSR_address_EC 1 3 1 0 -2540n
preplace netloc ControlUnit_0_DMU_IN_MUX_ctrl 1 1 2 NJ -1910 -590
preplace netloc ControlUnit_0_DMU_OUT_MUX_ctrl 1 1 2 -920J -1750 -610
preplace netloc ControlUnit_0_mask_ctrl 1 1 2 -1040J -1490 -640
preplace netloc ControlUnit_0_ALU_OP 1 1 2 -990J -1560 -630
preplace netloc ControlUnit_0_instr_finished 1 1 5 NJ -1510 -550J -1630 -10J -1670 460J -1650 N
preplace netloc ControlUnit_0_register_write 1 1 5 -960J -1530 -580J -1660 NJ -1660 420J -1630 N
preplace netloc ControlUnit_0_register_read_B 1 1 5 -930J -1540 -570J -1640 NJ -1640 NJ -1640 770
preplace netloc ControlUnit_0_register_read_A 1 1 5 -950J -1500 -560J -1650 NJ -1650 410J -1620 740
preplace netloc ControlUnit_0_PMP_rw 1 1 6 -930J -2180 NJ -2180 NJ -2180 NJ -2180 NJ -2180 1180
preplace netloc ControlUnit_0_PMP_size 1 1 6 NJ -1950 NJ -1950 -30J -2140 NJ -2140 NJ -2140 1170
preplace netloc ControlUnit_0_PMP_instruction 1 1 6 NJ -1970 NJ -1970 -40J -2150 NJ -2150 NJ -2150 1160
preplace netloc ControlUnit_0_PMP_enable 1 1 6 NJ -1990 NJ -1990 NJ -1990 NJ -1990 720J -2130 1150
preplace netloc RegisterFile_0_data_bus_B 1 0 7 -1390 -1420 NJ -1420 NJ -1420 -40J -1270 NJ -1270 NJ -1270 1120
preplace netloc mmCSR_AXI4_slave_0_msip 1 5 1 780 -2390n
preplace netloc mmCSR_AXI4_slave_0_mtip 1 5 1 770 -2410n
levelinfo -pg 1 -1470 -1210 -780 -240 220 590 950 1340 2040 2260
pagesize -pg 1 -db -bbox -sgen -1470 -2790 2260 790
"
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
common::send_gid_msg -ssname BD::TCL -id 2050 -severity "WARNING" "This Tcl script was generated from a block design that has not been validated. It is possible that design <$design_name> may result in errors during validation."

  close_bd_design $design_name 
}
# End of cr_bd_EDRICO()
cr_bd_EDRICO ""
set_property REGISTERED_WITH_MANAGER "1" [get_files EDRICO.bd ] 
set_property SYNTH_CHECKPOINT_MODE "Hierarchical" [get_files EDRICO.bd ] 


# Create wrapper file for EDRICO.bd
make_wrapper -files [get_files EDRICO.bd] -import -top

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
    create_run -name synth_1 -part xc7z020clg400-1 -flow {Vivado Synthesis 2020} -strategy "Vivado Synthesis Defaults" -report_strategy {No Reports} -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2020" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Synthesis Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'synth_1_synth_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0] "" ] } {
  create_report_config -report_name synth_1_synth_report_utilization_0 -report_type report_utilization:1.0 -steps synth_design -runs synth_1
}
set obj [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0]
if { $obj != "" } {

}
set obj [get_runs synth_1]
set_property -name "strategy" -value "Vivado Synthesis Defaults" -objects $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
    create_run -name impl_1 -part xc7z020clg400-1 -flow {Vivado Implementation 2020} -strategy "Vivado Implementation Defaults" -report_strategy {No Reports} -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2020" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Implementation Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'impl_1_init_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_init_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps init_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_opt_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_drc_0 -report_type report_drc:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0]
if { $obj != "" } {

}
# Create 'impl_1_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_place_report_io_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0] "" ] } {
  create_report_config -report_name impl_1_place_report_io_0 -report_type report_io:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0]
if { $obj != "" } {

}
# Create 'impl_1_place_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0] "" ] } {
  create_report_config -report_name impl_1_place_report_utilization_0 -report_type report_utilization:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0]
if { $obj != "" } {

}
# Create 'impl_1_place_report_control_sets_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0] "" ] } {
  create_report_config -report_name impl_1_place_report_control_sets_0 -report_type report_control_sets:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0]
if { $obj != "" } {
set_property -name "options.verbose" -value "1" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_1' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_1 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj

}
# Create 'impl_1_place_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_place_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_post_place_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_place_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_place_power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_route_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_route_report_drc_0 -report_type report_drc:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_methodology_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0] "" ] } {
  create_report_config -report_name impl_1_route_report_methodology_0 -report_type report_methodology:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_power_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0] "" ] } {
  create_report_config -report_name impl_1_route_report_power_0 -report_type report_power:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_route_status_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0] "" ] } {
  create_report_config -report_name impl_1_route_report_route_status_0 -report_type report_route_status:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_route_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0]
if { $obj != "" } {
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_route_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_route_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_clock_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0] "" ] } {
  create_report_config -report_name impl_1_route_report_clock_utilization_0 -report_type report_clock_utilization:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_bus_skew_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0] "" ] } {
  create_report_config -report_name impl_1_route_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0]
if { $obj != "" } {
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_bus_skew_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0]
if { $obj != "" } {
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
set obj [get_runs impl_1]
set_property -name "strategy" -value "Vivado Implementation Defaults" -objects $obj
set_property -name "steps.write_bitstream.args.readback_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.verbose" -value "0" -objects $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

# Change current directory to project folder
cd [file dirname [info script]]

puts "INFO: Project created:${_xil_proj_name_}"
# Create 'drc_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "drc_1" ] ] ""]} {
create_dashboard_gadget -name {drc_1} -type drc
}
set obj [get_dashboard_gadgets [ list "drc_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_drc_0" -objects $obj

# Create 'methodology_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "methodology_1" ] ] ""]} {
create_dashboard_gadget -name {methodology_1} -type methodology
}
set obj [get_dashboard_gadgets [ list "methodology_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_methodology_0" -objects $obj

# Create 'power_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "power_1" ] ] ""]} {
create_dashboard_gadget -name {power_1} -type power
}
set obj [get_dashboard_gadgets [ list "power_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_power_0" -objects $obj

# Create 'timing_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "timing_1" ] ] ""]} {
create_dashboard_gadget -name {timing_1} -type timing
}
set obj [get_dashboard_gadgets [ list "timing_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_timing_summary_0" -objects $obj

# Create 'utilization_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_1" ] ] ""]} {
create_dashboard_gadget -name {utilization_1} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_1" ] ]
set_property -name "reports" -value "synth_1#synth_1_synth_report_utilization_0" -objects $obj
set_property -name "run.step" -value "synth_design" -objects $obj
set_property -name "run.type" -value "synthesis" -objects $obj

# Create 'utilization_2' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_2" ] ] ""]} {
create_dashboard_gadget -name {utilization_2} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_2" ] ]
set_property -name "reports" -value "impl_1#impl_1_place_report_utilization_0" -objects $obj

move_dashboard_gadget -name {utilization_1} -row 0 -col 0
move_dashboard_gadget -name {power_1} -row 1 -col 0
move_dashboard_gadget -name {drc_1} -row 2 -col 0
move_dashboard_gadget -name {timing_1} -row 0 -col 1
move_dashboard_gadget -name {utilization_2} -row 1 -col 1
move_dashboard_gadget -name {methodology_1} -row 2 -col 1
