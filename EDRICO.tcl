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
   "${origin_dir}/RTL/ControlUnit/CU_FSM.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_PC.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_decoder.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_execute_enable.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_pkg.vhd" \
   "${origin_dir}/RTL/ControlUnit/CU_top.vhd" \
   "${origin_dir}/RTL/MUX/MUX_32_2.vhd" \
   "${origin_dir}/RTL/MUX/MUX_32_3.vhd" \
   "${origin_dir}/RTL/MUX/DEMUX_32_2.vhd" \
   "${origin_dir}/RTL/MUX/MUX_CSR.vhd" \
   "${origin_dir}/RTL/LoadBufferRegister/LoadBufferRegister.vhd" \
   "${origin_dir}/RTL/ALU/ALU.vhd" \
   "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd" \
   "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master.vhd" \
   "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd" \
   "${origin_dir}/RTL/ExceptionControll/CSR_access_controll.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_controller.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_interrupt_gen.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_pkg.vhd" \
   "${origin_dir}/RTL/RegisterFile/CSR_top.vhd" \
   "${origin_dir}/RTL/ExceptionControll/DRA_controll.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll.vhd" \
   "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMA_checker.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_checker.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_checker.vhd" \
   "${origin_dir}/RTL/PMP_PMA_checker/PMP_unit.vhd" \
   "${origin_dir}/RTL/RegisterFile/RF_pkg.vhd" \
   "${origin_dir}/RTL/RegisterFile/RV32I_RF.vhd" \
   "${origin_dir}/RTL/RegisterFile/RegisterFile_top.vhd" \
   "${origin_dir}/RTL/ExceptionControll/arbiter.vhd" \
   "${origin_dir}/RTL/DataMaskUnit/data_mask_unit.vhd" \
   "${origin_dir}/RTL/DataMaskUnit/data_mask_unit_pkg.vhd" \
   "${origin_dir}/RTL/ALU/ALU_pkg.vhd" \
   "${origin_dir}/RTL/MUX/MUX_pkg.vhd" \
   "${origin_dir}/simulation/sim_EDRICO_AV_2/sim_EDRICO_AV_2_tb_blk_mem_gen_0_1.coe" \
   "${origin_dir}/simulation/sim_EDRICO_AV_2/sim_EDRICO_AV_2_tester.vhd" \
   "${origin_dir}/simulation/sim_EDRICO_AV_1/sim_EDRICO_AV_1_tb.vhd" \
   "${origin_dir}/simulation/sim_EDRICO_AV_1/sim_EDRICO_AV_1_tb_behav.wcfg" \
   "${origin_dir}/simulation/sim_EDRICO_AV_2/sim_EDRICO_AV_2_tb_wrapper_behav.wcfg" \
  ]
  foreach ifile $files {
    if { ![file isfile $ifile] } {
      puts " Could not find remote file $ifile "
      set status false
    }
  }

  set paths [list \
   [file normalize "$origin_dir/ip_repo/mmCSR_1.0"] \
   [file normalize "$origin_dir/ip_repo/EDRICO"] \
   [file normalize "$origin_dir/ip_repo/DataMaskUnit"] \
   [file normalize "$origin_dir/ip_repo/AXI4_lite_master"] \
   [file normalize "$origin_dir/ip_repo/RegisterFile"] \
   [file normalize "$origin_dir/ip_repo/PMP_PMA_checker"] \
   [file normalize "$origin_dir/ip_repo/ControlUnit"] \
   [file normalize "$origin_dir/ip_repo/mmCSR_AXI4_slave_1.0"] \
   [file normalize "$origin_dir/ip_repo/ALU"] \
   [file normalize "$origin_dir/ip_repo/ExceptionControl"] \
   [file normalize "$origin_dir/ip_repo/AXI_BRAM"] \
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
set_property -name "corecontainer.enable" -value "1" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "enable_core_container" -value "1" -objects $obj
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
set_property -name "webtalk.activehdl_export_sim" -value "37" -objects $obj
set_property -name "webtalk.ies_export_sim" -value "37" -objects $obj
set_property -name "webtalk.modelsim_export_sim" -value "37" -objects $obj
set_property -name "webtalk.questa_export_sim" -value "37" -objects $obj
set_property -name "webtalk.riviera_export_sim" -value "37" -objects $obj
set_property -name "webtalk.vcs_export_sim" -value "37" -objects $obj
set_property -name "webtalk.xsim_export_sim" -value "37" -objects $obj
set_property -name "webtalk.xsim_launch_sim" -value "304" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set IP repository paths
set obj [get_filesets sources_1]
if { $obj != {} } {
set_property "ip_repo_paths" "[file normalize "$origin_dir/ip_repo/mmCSR_1.0"] [file normalize "$origin_dir/ip_repo/EDRICO"] [file normalize "$origin_dir/ip_repo/DataMaskUnit"] [file normalize "$origin_dir/ip_repo/AXI4_lite_master"] [file normalize "$origin_dir/ip_repo/RegisterFile"] [file normalize "$origin_dir/ip_repo/PMP_PMA_checker"] [file normalize "$origin_dir/ip_repo/ControlUnit"] [file normalize "$origin_dir/ip_repo/mmCSR_AXI4_slave_1.0"] [file normalize "$origin_dir/ip_repo/ALU"] [file normalize "$origin_dir/ip_repo/ExceptionControl"] [file normalize "$origin_dir/ip_repo/AXI_BRAM"]" $obj

# Rebuild user ip_repo's index before adding any source files
update_ip_catalog -rebuild
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_FSM.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_PC.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_decoder.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_execute_enable.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ControlUnit/CU_top.vhd"] \
 [file normalize "${origin_dir}/RTL/MUX/MUX_32_2.vhd"] \
 [file normalize "${origin_dir}/RTL/MUX/MUX_32_3.vhd"] \
 [file normalize "${origin_dir}/RTL/MUX/DEMUX_32_2.vhd"] \
 [file normalize "${origin_dir}/RTL/MUX/MUX_CSR.vhd"] \
 [file normalize "${origin_dir}/RTL/LoadBufferRegister/LoadBufferRegister.vhd"] \
 [file normalize "${origin_dir}/RTL/ALU/ALU.vhd"] \
 [file normalize "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master.vhd"] \
 [file normalize "${origin_dir}/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/CSR_access_controll.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_controller.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_interrupt_gen.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/CSR_top.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/DRA_controll.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/Exception_Controll_FSM.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMA_checker.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_PMA_checker.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_checker.vhd"] \
 [file normalize "${origin_dir}/RTL/PMP_PMA_checker/PMP_unit.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/RF_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/RV32I_RF.vhd"] \
 [file normalize "${origin_dir}/RTL/RegisterFile/RegisterFile_top.vhd"] \
 [file normalize "${origin_dir}/RTL/ExceptionControll/arbiter.vhd"] \
 [file normalize "${origin_dir}/RTL/DataMaskUnit/data_mask_unit.vhd"] \
 [file normalize "${origin_dir}/RTL/DataMaskUnit/data_mask_unit_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/ALU/ALU_pkg.vhd"] \
 [file normalize "${origin_dir}/RTL/MUX/MUX_pkg.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EDRICO_AV_2/sim_EDRICO_AV_2_tb_blk_mem_gen_0_1.coe"] \
 [file normalize "${origin_dir}/simulation/sim_EDRICO_AV_2/sim_EDRICO_AV_2_tester.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
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

set file "$origin_dir/RTL/MUX/MUX_32_2.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/RTL/MUX/MUX_32_3.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/RTL/MUX/DEMUX_32_2.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/RTL/MUX/MUX_CSR.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/RTL/LoadBufferRegister/LoadBufferRegister.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/RTL/ALU/ALU.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "ALU_lib" -objects $file_obj

set file "$origin_dir/RTL/AXI4_Lite_Master/AXI4_lite_master_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/RTL/AXI4_Lite_Master/AXI4_lite_master.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/RTL/AXI4_Lite_Master/AXI4_lite_master_control_unit.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "AXI4M_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/CSR_access_controll.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

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

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/ExceptionControll/Exception_Controll_FSM.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMA_checker.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "PMP_lib" -objects $file_obj

set file "$origin_dir/RTL/PMP_PMA_checker/PMP_PMA_checker.vhd"
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

set file "$origin_dir/RTL/ExceptionControll/arbiter.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "EC_lib" -objects $file_obj

set file "$origin_dir/RTL/DataMaskUnit/data_mask_unit.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "DMU_lib" -objects $file_obj

set file "$origin_dir/RTL/DataMaskUnit/data_mask_unit_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "DMU_lib" -objects $file_obj

set file "$origin_dir/RTL/ALU/ALU_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "library" -value "ALU_lib" -objects $file_obj

set file "$origin_dir/RTL/MUX/MUX_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/simulation/sim_EDRICO_AV_2/sim_EDRICO_AV_2_tester.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "CU_top" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Empty (no sources present)

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

# Create 'sim_EDRICO_AV_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_EDRICO_AV_1] ""]} {
  create_fileset -simset sim_EDRICO_AV_1
}

# Set 'sim_EDRICO_AV_1' fileset object
set obj [get_filesets sim_EDRICO_AV_1]
set files [list \
 [file normalize "${origin_dir}/simulation/sim_EDRICO_AV_1/sim_EDRICO_AV_1_tb.vhd"] \
 [file normalize "${origin_dir}/simulation/sim_EDRICO_AV_1/sim_EDRICO_AV_1_tb_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_EDRICO_AV_1' fileset file properties for remote files
set file "$origin_dir/simulation/sim_EDRICO_AV_1/sim_EDRICO_AV_1_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_EDRICO_AV_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'sim_EDRICO_AV_1' fileset file properties for local files
# None

# Set 'sim_EDRICO_AV_1' fileset properties
set obj [get_filesets sim_EDRICO_AV_1]
set_property -name "top" -value "sim_EDRICO_AV_1_tb" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

# Create 'sim_EDRICO_AV_2' fileset (if not found)
if {[string equal [get_filesets -quiet sim_EDRICO_AV_2] ""]} {
  create_fileset -simset sim_EDRICO_AV_2
}

# Set 'sim_EDRICO_AV_2' fileset object
set obj [get_filesets sim_EDRICO_AV_2]
set files [list \
 [file normalize "${origin_dir}/simulation/sim_EDRICO_AV_2/sim_EDRICO_AV_2_tb_wrapper_behav.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_EDRICO_AV_2' fileset file properties for remote files
# None

# Set 'sim_EDRICO_AV_2' fileset file properties for local files
# None

# Set 'sim_EDRICO_AV_2' fileset properties
set obj [get_filesets sim_EDRICO_AV_2]
set_property -name "top" -value "sim_EDRICO_AV_2_tb_wrapper" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

# Set 'utils_1' fileset object
set obj [get_filesets utils_1]
# Empty (no sources present)

# Set 'utils_1' fileset properties
set obj [get_filesets utils_1]


# Adding sources referenced in BDs, if not already added
if { [get_files DEMUX_32_2.vhd] == "" } {
  import_files -quiet -fileset sources_1 /home/levi/Software/EDRICO/RTL/MUX/DEMUX_32_2.vhd
}
if { [get_files MUX_32_2.vhd] == "" } {
  import_files -quiet -fileset sources_1 /home/levi/Software/EDRICO/RTL/MUX/MUX_32_2.vhd
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
if { [get_files MUX_CSR.vhd] == "" } {
  import_files -quiet -fileset sources_1 /home/levi/Software/EDRICO/RTL/MUX/MUX_CSR.vhd
}
if { [get_files MUX_32_2.vhd] == "" } {
  import_files -quiet -fileset sources_1 /home/levi/Software/EDRICO/RTL/MUX/MUX_32_2.vhd
}
if { [get_files LoadBufferRegister.vhd] == "" } {
  import_files -quiet -fileset sources_1 /home/levi/Software/EDRICO/RTL/LoadBufferRegister/LoadBufferRegister.vhd
}


# Proc to create BD EDRICO
proc cr_bd_EDRICO { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# DEMUX_32_2, LoadBufferRegister, MUX_32_3, MUX_32_2, MUX_CSR, MUX_32_2, MUX_32_2, MUX_32_2



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
  DHBWRavensburg:EDRICO_lib:mmCSR:1.0\
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
  DEMUX_32_2\
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
  set M_AXI_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_0 ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.PROTOCOL {AXI4LITE} \
   ] $M_AXI_0

  set S00_AXI_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI_0 ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {26} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.MAX_BURST_LENGTH {1} \
   CONFIG.NUM_READ_OUTSTANDING {1} \
   CONFIG.NUM_READ_THREADS {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {1} \
   CONFIG.NUM_WRITE_THREADS {1} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {0} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $S00_AXI_0


  # Create ports
  set IR_debug [ create_bd_port -dir O -from 31 -to 0 -type data IR_debug ]
  set M_AXI_ACLK_0 [ create_bd_port -dir I -type clk M_AXI_ACLK_0 ]
  set M_AXI_ARESETN_0 [ create_bd_port -dir I -type rst M_AXI_ARESETN_0 ]
  set PC_debug [ create_bd_port -dir O -from 31 -to 0 -type data PC_debug ]
  set mcause_debug_0 [ create_bd_port -dir O -from 31 -to 0 mcause_debug_0 ]
  set mcountinhibit_debug_0 [ create_bd_port -dir O -from 31 -to 0 mcountinhibit_debug_0 ]
  set mcycleH_debug_0 [ create_bd_port -dir O -from 31 -to 0 mcycleH_debug_0 ]
  set mcycle_debug_0 [ create_bd_port -dir O -from 31 -to 0 mcycle_debug_0 ]
  set mepc_debug_0 [ create_bd_port -dir O -from 31 -to 0 mepc_debug_0 ]
  set mie_debug_0 [ create_bd_port -dir O -from 31 -to 0 mie_debug_0 ]
  set minstretH_debug_0 [ create_bd_port -dir O -from 31 -to 0 minstretH_debug_0 ]
  set minstret_debug_0 [ create_bd_port -dir O -from 31 -to 0 minstret_debug_0 ]
  set mip_debug_0 [ create_bd_port -dir O -from 31 -to 0 mip_debug_0 ]
  set misa_debug_0 [ create_bd_port -dir O -from 31 -to 0 misa_debug_0 ]
  set mscratch_debug_0 [ create_bd_port -dir O -from 31 -to 0 mscratch_debug_0 ]
  set mstatus_debug_0 [ create_bd_port -dir O -from 31 -to 0 mstatus_debug_0 ]
  set mtval_debug_0 [ create_bd_port -dir O -from 31 -to 0 mtval_debug_0 ]
  set mtvec_debug_0 [ create_bd_port -dir O -from 31 -to 0 mtvec_debug_0 ]
  set s00_axi_aclk_0 [ create_bd_port -dir I -type clk s00_axi_aclk_0 ]
  set s00_axi_aresetn_0 [ create_bd_port -dir I -type rst s00_axi_aresetn_0 ]
  set system_clk [ create_bd_port -dir I -type clk system_clk ]
  set system_reset_async [ create_bd_port -dir I -type rst system_reset_async ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $system_reset_async
  set x10_0 [ create_bd_port -dir O -from 31 -to 0 x10_0 ]
  set x11_0 [ create_bd_port -dir O -from 31 -to 0 x11_0 ]
  set x12_0 [ create_bd_port -dir O -from 31 -to 0 x12_0 ]
  set x13_0 [ create_bd_port -dir O -from 31 -to 0 x13_0 ]
  set x14_0 [ create_bd_port -dir O -from 31 -to 0 x14_0 ]
  set x15_0 [ create_bd_port -dir O -from 31 -to 0 x15_0 ]
  set x16_0 [ create_bd_port -dir O -from 31 -to 0 x16_0 ]
  set x17_0 [ create_bd_port -dir O -from 31 -to 0 x17_0 ]
  set x18_0 [ create_bd_port -dir O -from 31 -to 0 x18_0 ]
  set x19_0 [ create_bd_port -dir O -from 31 -to 0 x19_0 ]
  set x1_0 [ create_bd_port -dir O -from 31 -to 0 x1_0 ]
  set x20_0 [ create_bd_port -dir O -from 31 -to 0 x20_0 ]
  set x21_0 [ create_bd_port -dir O -from 31 -to 0 x21_0 ]
  set x22_0 [ create_bd_port -dir O -from 31 -to 0 x22_0 ]
  set x23_0 [ create_bd_port -dir O -from 31 -to 0 x23_0 ]
  set x24_0 [ create_bd_port -dir O -from 31 -to 0 x24_0 ]
  set x25_0 [ create_bd_port -dir O -from 31 -to 0 x25_0 ]
  set x26_0 [ create_bd_port -dir O -from 31 -to 0 x26_0 ]
  set x27_0 [ create_bd_port -dir O -from 31 -to 0 x27_0 ]
  set x28_0 [ create_bd_port -dir O -from 31 -to 0 x28_0 ]
  set x29_0 [ create_bd_port -dir O -from 31 -to 0 x29_0 ]
  set x2_0 [ create_bd_port -dir O -from 31 -to 0 x2_0 ]
  set x30_0 [ create_bd_port -dir O -from 31 -to 0 x30_0 ]
  set x31_0 [ create_bd_port -dir O -from 31 -to 0 x31_0 ]
  set x3_0 [ create_bd_port -dir O -from 31 -to 0 x3_0 ]
  set x4_0 [ create_bd_port -dir O -from 31 -to 0 x4_0 ]
  set x5_0 [ create_bd_port -dir O -from 31 -to 0 x5_0 ]
  set x6_0 [ create_bd_port -dir O -from 31 -to 0 x6_0 ]
  set x7_0 [ create_bd_port -dir O -from 31 -to 0 x7_0 ]
  set x8_0 [ create_bd_port -dir O -from 31 -to 0 x8_0 ]
  set x9_0 [ create_bd_port -dir O -from 31 -to 0 x9_0 ]

  # Create instance: ALU_0, and set properties
  set ALU_0 [ create_bd_cell -type ip -vlnv DHBWRavensburg:ALU_lib:ALU:1.0 ALU_0 ]

  # Create instance: AXI4_lite_master_0, and set properties
  set AXI4_lite_master_0 [ create_bd_cell -type ip -vlnv DHBWRavensburg:AXI4M_lib:AXI4_lite_master:1.0 AXI4_lite_master_0 ]

  # Create instance: ControlUnit_0, and set properties
  set ControlUnit_0 [ create_bd_cell -type ip -vlnv user.org:CU_lib:ControlUnit:1.0 ControlUnit_0 ]

  # Create instance: DEMUX_EC_IN, and set properties
  set block_name DEMUX_32_2
  set block_cell_name DEMUX_EC_IN
  if { [catch {set DEMUX_EC_IN [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $DEMUX_EC_IN eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
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
  
  # Create instance: MUX_CSR_0, and set properties
  set block_name MUX_CSR
  set block_cell_name MUX_CSR_0
  if { [catch {set MUX_CSR_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MUX_CSR_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MUX_EC_OUT, and set properties
  set block_name MUX_32_2
  set block_cell_name MUX_EC_OUT
  if { [catch {set MUX_EC_OUT [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MUX_EC_OUT eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MUX_PMP, and set properties
  set block_name MUX_32_2
  set block_cell_name MUX_PMP
  if { [catch {set MUX_PMP [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MUX_PMP eq "" } {
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

  # Create instance: mmCSR_0, and set properties
  set mmCSR_0 [ create_bd_cell -type ip -vlnv DHBWRavensburg:EDRICO_lib:mmCSR:1.0 mmCSR_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net AXI4_lite_master_0_M_AXI [get_bd_intf_ports M_AXI_0] [get_bd_intf_pins AXI4_lite_master_0/M_AXI]
  connect_bd_intf_net -intf_net S00_AXI_0_1 [get_bd_intf_ports S00_AXI_0] [get_bd_intf_pins mmCSR_0/S00_AXI]

  # Create port connections
  connect_bd_net -net ALU_0_alu_result [get_bd_pins ALU_0/alu_result] [get_bd_pins MUX_PMP/B_in] [get_bd_pins MUX_R/B_in]
  connect_bd_net -net ALU_0_branch_re [get_bd_pins ALU_0/branch_re] [get_bd_pins ControlUnit_0/branch_re]
  connect_bd_net -net AXI4_lite_master_0_data_out [get_bd_pins AXI4_lite_master_0/data_out] [get_bd_pins ControlUnit_0/IR_inp] [get_bd_pins LoadBufferRegister_0/data_in]
  connect_bd_net -net AXI4_lite_master_0_instruction_afe_AXI [get_bd_pins AXI4_lite_master_0/instruction_afe_AXI] [get_bd_pins Exception_Control_0/instruction_afe_AXI]
  connect_bd_net -net AXI4_lite_master_0_load_afe_AXI [get_bd_pins AXI4_lite_master_0/load_afe_AXI] [get_bd_pins Exception_Control_0/load_afe_AXI]
  connect_bd_net -net AXI4_lite_master_0_memOp_finished [get_bd_pins AXI4_lite_master_0/memOp_finished] [get_bd_pins ControlUnit_0/memOP_finished]
  connect_bd_net -net AXI4_lite_master_0_storeAMO_afe_AXI [get_bd_pins AXI4_lite_master_0/storeAMO_afe_AXI] [get_bd_pins Exception_Control_0/storeAMO_afe_AXI]
  connect_bd_net -net AXI4_lite_master_0_store_systemData [get_bd_pins AXI4_lite_master_0/store_systemData] [get_bd_pins ControlUnit_0/store_systemData] [get_bd_pins LoadBufferRegister_0/store_systemData]
  connect_bd_net -net ControlUnit_0_ALU_OP [get_bd_pins ALU_0/alu_op] [get_bd_pins ControlUnit_0/ALU_OP]
  connect_bd_net -net ControlUnit_0_A_MUX_ctrl [get_bd_pins ControlUnit_0/A_MUX_ctrl] [get_bd_pins MUX_A/control]
  connect_bd_net -net ControlUnit_0_B_MUX_ctrl [get_bd_pins ControlUnit_0/B_MUX_ctrl] [get_bd_pins MUX_B/control]
  connect_bd_net -net ControlUnit_0_CSR_address [get_bd_pins ControlUnit_0/CSR_address] [get_bd_pins MUX_CSR_0/CSR_address_CU]
  connect_bd_net -net ControlUnit_0_DMU_IN_MUX_ctrl [get_bd_pins ControlUnit_0/DMU_IN_MUX_ctrl] [get_bd_pins DataMaskUnit_0/DMU_IN_MUX_ctrl]
  connect_bd_net -net ControlUnit_0_DMU_OUT_MUX_ctrl [get_bd_pins ControlUnit_0/DMU_OUT_MUX_ctrl] [get_bd_pins DataMaskUnit_0/DMU_OUT_MUX_ctrl]
  connect_bd_net -net ControlUnit_0_IR_dra [get_bd_ports IR_debug] [get_bd_pins ControlUnit_0/IR_dra] [get_bd_pins Exception_Control_0/IR_dra]
  connect_bd_net -net ControlUnit_0_PC_out [get_bd_ports PC_debug] [get_bd_pins ControlUnit_0/PC_out] [get_bd_pins Exception_Control_0/PC_dra] [get_bd_pins MUX_B/A_in] [get_bd_pins MUX_PMP/A_in]
  connect_bd_net -net ControlUnit_0_PMP_MUX_ctrl [get_bd_pins ControlUnit_0/PMP_MUX_ctrl] [get_bd_pins MUX_PMP/control]
  connect_bd_net -net ControlUnit_0_PMP_enable [get_bd_pins ControlUnit_0/PMP_enable] [get_bd_pins PMP_PMA_checker_0/enable]
  connect_bd_net -net ControlUnit_0_PMP_instruction [get_bd_pins ControlUnit_0/PMP_instruction] [get_bd_pins PMP_PMA_checker_0/instruction]
  connect_bd_net -net ControlUnit_0_PMP_rw [get_bd_pins ControlUnit_0/PMP_rw] [get_bd_pins PMP_PMA_checker_0/readWrite]
  connect_bd_net -net ControlUnit_0_PMP_size [get_bd_pins ControlUnit_0/PMP_size] [get_bd_pins PMP_PMA_checker_0/size]
  connect_bd_net -net ControlUnit_0_R_MUX_ctrl [get_bd_pins ControlUnit_0/R_MUX_ctrl] [get_bd_pins MUX_R/control]
  connect_bd_net -net ControlUnit_0_be_CU [get_bd_pins ControlUnit_0/be_CU] [get_bd_pins Exception_Control_0/be_CU]
  connect_bd_net -net ControlUnit_0_ece_CU [get_bd_pins ControlUnit_0/ece_CU] [get_bd_pins Exception_Control_0/ece_CU]
  connect_bd_net -net ControlUnit_0_iie_CU [get_bd_pins ControlUnit_0/iie_CU] [get_bd_pins Exception_Control_0/iie_CU]
  connect_bd_net -net ControlUnit_0_immediate [get_bd_pins ControlUnit_0/immediate] [get_bd_pins MUX_A/A_in]
  connect_bd_net -net ControlUnit_0_instr_finished [get_bd_pins ControlUnit_0/instr_finished] [get_bd_pins RegisterFile_0/instr_finished]
  connect_bd_net -net ControlUnit_0_mask_ctrl [get_bd_pins ControlUnit_0/mask_ctrl] [get_bd_pins DataMaskUnit_0/mask_ctrl]
  connect_bd_net -net ControlUnit_0_read_CSR [get_bd_pins ControlUnit_0/read_CSR] [get_bd_pins MUX_CSR_0/read_CSR_CU]
  connect_bd_net -net ControlUnit_0_register_read_A [get_bd_pins ControlUnit_0/register_read_A] [get_bd_pins RegisterFile_0/register_read_A]
  connect_bd_net -net ControlUnit_0_register_read_B [get_bd_pins ControlUnit_0/register_read_B] [get_bd_pins RegisterFile_0/register_read_B]
  connect_bd_net -net ControlUnit_0_register_write [get_bd_pins ControlUnit_0/register_write] [get_bd_pins RegisterFile_0/register_write]
  connect_bd_net -net ControlUnit_0_ret [get_bd_pins ControlUnit_0/ret] [get_bd_pins Exception_Control_0/ret]
  connect_bd_net -net ControlUnit_0_save_CSR [get_bd_pins ControlUnit_0/save_CSR] [get_bd_pins RegisterFile_0/CSR_save]
  connect_bd_net -net ControlUnit_0_write_CSR [get_bd_pins ControlUnit_0/write_CSR] [get_bd_pins MUX_CSR_0/write_CSR_CU]
  connect_bd_net -net DEMUX_EC_IN_A_out [get_bd_pins DEMUX_EC_IN/A_out] [get_bd_pins MUX_B/B_in]
  connect_bd_net -net DEMUX_EC_IN_B_out [get_bd_pins DEMUX_EC_IN/B_out] [get_bd_pins Exception_Control_0/data_in_EC]
  connect_bd_net -net DataMaskUnit_0_data_load [get_bd_pins DataMaskUnit_0/data_load] [get_bd_pins MUX_R/A_in]
  connect_bd_net -net DataMaskUnit_0_data_store [get_bd_pins AXI4_lite_master_0/data_in] [get_bd_pins DataMaskUnit_0/data_store]
  connect_bd_net -net Exception_Control_0_CSR_address_EC [get_bd_pins Exception_Control_0/CSR_address_EC] [get_bd_pins MUX_CSR_0/CSR_address_EC]
  connect_bd_net -net Exception_Control_0_CSR_read_EC [get_bd_pins Exception_Control_0/CSR_read_EC] [get_bd_pins MUX_CSR_0/read_CSR_EC]
  connect_bd_net -net Exception_Control_0_CSR_write_EC [get_bd_pins Exception_Control_0/CSR_write_EC] [get_bd_pins MUX_CSR_0/write_CSR_EC]
  connect_bd_net -net Exception_Control_0_PC_dra_write [get_bd_pins ControlUnit_0/PC_dra] [get_bd_pins Exception_Control_0/PC_dra_write]
  connect_bd_net -net Exception_Control_0_PC_write [get_bd_pins ControlUnit_0/pc_write] [get_bd_pins Exception_Control_0/PC_write]
  connect_bd_net -net Exception_Control_0_data_out_EC [get_bd_pins Exception_Control_0/data_out_EC] [get_bd_pins MUX_EC_OUT/B_in]
  connect_bd_net -net Exception_Control_0_halt_core [get_bd_pins AXI4_lite_master_0/halt_core] [get_bd_pins ControlUnit_0/halt_core] [get_bd_pins DEMUX_EC_IN/control] [get_bd_pins Exception_Control_0/halt_core] [get_bd_pins MUX_CSR_0/control] [get_bd_pins MUX_EC_OUT/control]
  connect_bd_net -net LoadBufferRegister_0_data_out [get_bd_pins DataMaskUnit_0/LoadBufferRegister] [get_bd_pins LoadBufferRegister_0/data_out]
  connect_bd_net -net MUX_A_C_out [get_bd_pins ALU_0/in_a] [get_bd_pins MUX_A/C_out]
  connect_bd_net -net MUX_B_C_out [get_bd_pins ALU_0/in_b] [get_bd_pins MUX_B/C_out]
  connect_bd_net -net MUX_CSR_0_CSR_address [get_bd_pins MUX_CSR_0/CSR_address] [get_bd_pins RegisterFile_0/CSR_address]
  connect_bd_net -net MUX_CSR_0_read_CSR [get_bd_pins MUX_CSR_0/read_CSR] [get_bd_pins RegisterFile_0/CSR_read]
  connect_bd_net -net MUX_CSR_0_write_CSR [get_bd_pins MUX_CSR_0/write_CSR] [get_bd_pins RegisterFile_0/CSR_write]
  connect_bd_net -net MUX_EC_OUT_C_out [get_bd_pins MUX_EC_OUT/C_out] [get_bd_pins RegisterFile_0/data_in]
  connect_bd_net -net MUX_PMP_C_out [get_bd_pins MUX_PMP/C_out] [get_bd_pins PMP_PMA_checker_0/address]
  connect_bd_net -net MUX_R_C_out [get_bd_pins MUX_EC_OUT/A_in] [get_bd_pins MUX_R/C_out]
  connect_bd_net -net M_AXI_ACLK_0_1 [get_bd_ports M_AXI_ACLK_0] [get_bd_pins AXI4_lite_master_0/M_AXI_ACLK]
  connect_bd_net -net M_AXI_ARESETN_0_1 [get_bd_ports M_AXI_ARESETN_0] [get_bd_pins AXI4_lite_master_0/M_AXI_ARESETN]
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
  connect_bd_net -net RegisterFile_0_data_bus_A [get_bd_pins DataMaskUnit_0/data_bus_A] [get_bd_pins MUX_A/B_in] [get_bd_pins RegisterFile_0/data_bus_A]
  connect_bd_net -net RegisterFile_0_data_bus_B [get_bd_pins ControlUnit_0/data_bus_B] [get_bd_pins DEMUX_EC_IN/C_in] [get_bd_pins RegisterFile_0/data_bus_B]
  connect_bd_net -net RegisterFile_0_iie_CSR [get_bd_pins Exception_Control_0/iie_CSR] [get_bd_pins RegisterFile_0/iie_CSR]
  connect_bd_net -net RegisterFile_0_mcause_debug [get_bd_ports mcause_debug_0] [get_bd_pins RegisterFile_0/mcause_debug]
  connect_bd_net -net RegisterFile_0_mcountinhibit_debug [get_bd_ports mcountinhibit_debug_0] [get_bd_pins RegisterFile_0/mcountinhibit_debug]
  connect_bd_net -net RegisterFile_0_mcycleH_debug [get_bd_ports mcycleH_debug_0] [get_bd_pins RegisterFile_0/mcycleH_debug]
  connect_bd_net -net RegisterFile_0_mcycle_debug [get_bd_ports mcycle_debug_0] [get_bd_pins RegisterFile_0/mcycle_debug]
  connect_bd_net -net RegisterFile_0_mepc_debug [get_bd_ports mepc_debug_0] [get_bd_pins RegisterFile_0/mepc_debug]
  connect_bd_net -net RegisterFile_0_mie_debug [get_bd_ports mie_debug_0] [get_bd_pins RegisterFile_0/mie_debug]
  connect_bd_net -net RegisterFile_0_minstretH_debug [get_bd_ports minstretH_debug_0] [get_bd_pins RegisterFile_0/minstretH_debug]
  connect_bd_net -net RegisterFile_0_minstret_debug [get_bd_ports minstret_debug_0] [get_bd_pins RegisterFile_0/minstret_debug]
  connect_bd_net -net RegisterFile_0_mip_debug [get_bd_ports mip_debug_0] [get_bd_pins RegisterFile_0/mip_debug]
  connect_bd_net -net RegisterFile_0_misa_debug [get_bd_ports misa_debug_0] [get_bd_pins RegisterFile_0/misa_debug]
  connect_bd_net -net RegisterFile_0_mscratch_debug [get_bd_ports mscratch_debug_0] [get_bd_pins RegisterFile_0/mscratch_debug]
  connect_bd_net -net RegisterFile_0_msi_CSR [get_bd_pins Exception_Control_0/si_CSR] [get_bd_pins RegisterFile_0/msi_CSR]
  connect_bd_net -net RegisterFile_0_mstatus_debug [get_bd_ports mstatus_debug_0] [get_bd_pins RegisterFile_0/mstatus_debug]
  connect_bd_net -net RegisterFile_0_mti_CSR [get_bd_pins Exception_Control_0/ti_CSR] [get_bd_pins RegisterFile_0/mti_CSR]
  connect_bd_net -net RegisterFile_0_mtval_debug [get_bd_ports mtval_debug_0] [get_bd_pins RegisterFile_0/mtval_debug]
  connect_bd_net -net RegisterFile_0_mtvec_debug [get_bd_ports mtvec_debug_0] [get_bd_pins RegisterFile_0/mtvec_debug]
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
  connect_bd_net -net RegisterFile_0_x1 [get_bd_ports x1_0] [get_bd_pins RegisterFile_0/x1]
  connect_bd_net -net RegisterFile_0_x2 [get_bd_ports x2_0] [get_bd_pins RegisterFile_0/x2]
  connect_bd_net -net RegisterFile_0_x3 [get_bd_ports x3_0] [get_bd_pins RegisterFile_0/x3]
  connect_bd_net -net RegisterFile_0_x4 [get_bd_ports x4_0] [get_bd_pins RegisterFile_0/x4]
  connect_bd_net -net RegisterFile_0_x5 [get_bd_ports x5_0] [get_bd_pins RegisterFile_0/x5]
  connect_bd_net -net RegisterFile_0_x6 [get_bd_ports x6_0] [get_bd_pins RegisterFile_0/x6]
  connect_bd_net -net RegisterFile_0_x7 [get_bd_ports x7_0] [get_bd_pins RegisterFile_0/x7]
  connect_bd_net -net RegisterFile_0_x8 [get_bd_ports x8_0] [get_bd_pins RegisterFile_0/x8]
  connect_bd_net -net RegisterFile_0_x9 [get_bd_ports x9_0] [get_bd_pins RegisterFile_0/x9]
  connect_bd_net -net RegisterFile_0_x10 [get_bd_ports x10_0] [get_bd_pins RegisterFile_0/x10]
  connect_bd_net -net RegisterFile_0_x11 [get_bd_ports x11_0] [get_bd_pins RegisterFile_0/x11]
  connect_bd_net -net RegisterFile_0_x12 [get_bd_ports x12_0] [get_bd_pins RegisterFile_0/x12]
  connect_bd_net -net RegisterFile_0_x13 [get_bd_ports x13_0] [get_bd_pins RegisterFile_0/x13]
  connect_bd_net -net RegisterFile_0_x14 [get_bd_ports x14_0] [get_bd_pins RegisterFile_0/x14]
  connect_bd_net -net RegisterFile_0_x15 [get_bd_ports x15_0] [get_bd_pins RegisterFile_0/x15]
  connect_bd_net -net RegisterFile_0_x16 [get_bd_ports x16_0] [get_bd_pins RegisterFile_0/x16]
  connect_bd_net -net RegisterFile_0_x17 [get_bd_ports x17_0] [get_bd_pins RegisterFile_0/x17]
  connect_bd_net -net RegisterFile_0_x18 [get_bd_ports x18_0] [get_bd_pins RegisterFile_0/x18]
  connect_bd_net -net RegisterFile_0_x19 [get_bd_ports x19_0] [get_bd_pins RegisterFile_0/x19]
  connect_bd_net -net RegisterFile_0_x20 [get_bd_ports x20_0] [get_bd_pins RegisterFile_0/x20]
  connect_bd_net -net RegisterFile_0_x21 [get_bd_ports x21_0] [get_bd_pins RegisterFile_0/x21]
  connect_bd_net -net RegisterFile_0_x22 [get_bd_ports x22_0] [get_bd_pins RegisterFile_0/x22]
  connect_bd_net -net RegisterFile_0_x23 [get_bd_ports x23_0] [get_bd_pins RegisterFile_0/x23]
  connect_bd_net -net RegisterFile_0_x24 [get_bd_ports x24_0] [get_bd_pins RegisterFile_0/x24]
  connect_bd_net -net RegisterFile_0_x25 [get_bd_ports x25_0] [get_bd_pins RegisterFile_0/x25]
  connect_bd_net -net RegisterFile_0_x26 [get_bd_ports x26_0] [get_bd_pins RegisterFile_0/x26]
  connect_bd_net -net RegisterFile_0_x27 [get_bd_ports x27_0] [get_bd_pins RegisterFile_0/x27]
  connect_bd_net -net RegisterFile_0_x28 [get_bd_ports x28_0] [get_bd_pins RegisterFile_0/x28]
  connect_bd_net -net RegisterFile_0_x29 [get_bd_ports x29_0] [get_bd_pins RegisterFile_0/x29]
  connect_bd_net -net RegisterFile_0_x30 [get_bd_ports x30_0] [get_bd_pins RegisterFile_0/x30]
  connect_bd_net -net RegisterFile_0_x31 [get_bd_ports x31_0] [get_bd_pins RegisterFile_0/x31]
  connect_bd_net -net clk_0_1 [get_bd_ports system_clk] [get_bd_pins ControlUnit_0/clk] [get_bd_pins Exception_Control_0/clk] [get_bd_pins LoadBufferRegister_0/clk] [get_bd_pins PMP_PMA_checker_0/clk] [get_bd_pins RegisterFile_0/clk]
  connect_bd_net -net mmCSR_0_msip [get_bd_pins RegisterFile_0/msip_dra] [get_bd_pins mmCSR_0/msip]
  connect_bd_net -net mmCSR_0_mtip [get_bd_pins RegisterFile_0/mtip_dra] [get_bd_pins mmCSR_0/mtip]
  connect_bd_net -net reset_0_1 [get_bd_ports system_reset_async] [get_bd_pins AXI4_lite_master_0/reset] [get_bd_pins ControlUnit_0/reset] [get_bd_pins Exception_Control_0/reset] [get_bd_pins LoadBufferRegister_0/reset] [get_bd_pins PMP_PMA_checker_0/reset] [get_bd_pins RegisterFile_0/reset]
  connect_bd_net -net s00_axi_aclk_0_1 [get_bd_ports s00_axi_aclk_0] [get_bd_pins mmCSR_0/s00_axi_aclk]
  connect_bd_net -net s00_axi_aresetn_0_1 [get_bd_ports s00_axi_aresetn_0] [get_bd_pins mmCSR_0/s00_axi_aresetn]

  # Create address segments
  assign_bd_address -offset 0x00000000 -range 0x000100000000 -target_address_space [get_bd_addr_spaces AXI4_lite_master_0/M_AXI] [get_bd_addr_segs M_AXI_0/Reg] -force
  assign_bd_address -offset 0x02000000 -range 0x0000C000 -target_address_space [get_bd_addr_spaces S00_AXI_0] [get_bd_addr_segs mmCSR_0/S00_AXI/S00_AXI_reg] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_EDRICO()
cr_bd_EDRICO ""
set_property REGISTERED_WITH_MANAGER "1" [get_files EDRICO.bd ] 
set_property SYNTH_CHECKPOINT_MODE "Hierarchical" [get_files EDRICO.bd ] 


# Create wrapper file for EDRICO.bd
make_wrapper -files [get_files EDRICO.bd] -import -top

if { [get_files sim_EDRICO_AV_2_tester.vhd] == "" } {
  import_files -quiet -fileset sources_1 /home/levi/Software/EDRICO/simulation/sim_EDRICO_AV_2/sim_EDRICO_AV_2_tester.vhd
}


# Proc to create BD sim_EDRICO_AV_2_tb
proc cr_bd_sim_EDRICO_AV_2_tb { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# sim_EDRICO_AV_2_tester



  # CHANGE DESIGN NAME HERE
  set design_name sim_EDRICO_AV_2_tb

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  user.org:user:EDRICO:1.0\
  xilinx.com:ip:blk_mem_gen:8.4\
  xilinx.com:ip:axi_bram_ctrl:4.1\
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
  sim_EDRICO_AV_2_tester\
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

  # Create instance: EDRICO_0, and set properties
  set EDRICO_0 [ create_bd_cell -type ip -vlnv user.org:user:EDRICO:1.0 EDRICO_0 ]

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
   CONFIG.NUM_MI {3} \
 ] $axi_mem_intercon

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_0 ]
  set_property -dict [ list \
   CONFIG.Coe_File {../../../../../../../simulation/sim_EDRICO_AV_2/sim_EDRICO_AV_2_tb_blk_mem_gen_0_1.coe}\
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Load_Init_File {true} \
   CONFIG.Memory_Type {Single_Port_ROM} \
   CONFIG.Port_A_Write_Rate {0} \
   CONFIG.Use_Byte_Write_Enable {false} \
 ] $blk_mem_gen_0

  # Create instance: blk_mem_gen_1, and set properties
  set blk_mem_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_1 ]
  set_property -dict [ list \
   CONFIG.EN_SAFETY_CKT {false} \
 ] $blk_mem_gen_1

  # Create instance: data_ram, and set properties
  set data_ram [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 data_ram ]
  set_property -dict [ list \
   CONFIG.ECC_TYPE {0} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $data_ram

  # Create instance: instruction_rom, and set properties
  set instruction_rom [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 instruction_rom ]
  set_property -dict [ list \
   CONFIG.ECC_TYPE {0} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $instruction_rom

  # Create instance: sim_EDRICO_AV_2_test_0, and set properties
  set block_name sim_EDRICO_AV_2_tester
  set block_cell_name sim_EDRICO_AV_2_test_0
  if { [catch {set sim_EDRICO_AV_2_test_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sim_EDRICO_AV_2_test_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create interface connections
  connect_bd_intf_net -intf_net EDRICO_0_M_AXI_0 [get_bd_intf_pins EDRICO_0/M_AXI_0] [get_bd_intf_pins axi_mem_intercon/S00_AXI]
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTA] [get_bd_intf_pins instruction_rom/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_1_BRAM_PORTA [get_bd_intf_pins blk_mem_gen_1/BRAM_PORTA] [get_bd_intf_pins data_ram/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins instruction_rom/S_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M01_AXI [get_bd_intf_pins axi_mem_intercon/M01_AXI] [get_bd_intf_pins data_ram/S_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M02_AXI [get_bd_intf_pins EDRICO_0/S00_AXI_0] [get_bd_intf_pins axi_mem_intercon/M02_AXI]

  # Create port connections
  connect_bd_net -net EDRICO_0_IR_debug [get_bd_pins EDRICO_0/IR_debug] [get_bd_pins sim_EDRICO_AV_2_test_0/IR_debug]
  connect_bd_net -net EDRICO_0_PC_debug [get_bd_pins EDRICO_0/PC_debug] [get_bd_pins sim_EDRICO_AV_2_test_0/PC_debug]
  connect_bd_net -net EDRICO_0_mcause_debug_0 [get_bd_pins EDRICO_0/mcause_debug_0] [get_bd_pins sim_EDRICO_AV_2_test_0/mcause_debug_0]
  connect_bd_net -net EDRICO_0_mcountinhibit_debug_0 [get_bd_pins EDRICO_0/mcountinhibit_debug_0] [get_bd_pins sim_EDRICO_AV_2_test_0/mcountinhibit_debug_0]
  connect_bd_net -net EDRICO_0_mcycleH_debug_0 [get_bd_pins EDRICO_0/mcycleH_debug_0] [get_bd_pins sim_EDRICO_AV_2_test_0/mcycleH_debug_0]
  connect_bd_net -net EDRICO_0_mcycle_debug_0 [get_bd_pins EDRICO_0/mcycle_debug_0] [get_bd_pins sim_EDRICO_AV_2_test_0/mcycle_debug_0]
  connect_bd_net -net EDRICO_0_mepc_debug_0 [get_bd_pins EDRICO_0/mepc_debug_0] [get_bd_pins sim_EDRICO_AV_2_test_0/mepc_debug_0]
  connect_bd_net -net EDRICO_0_mie_debug_0 [get_bd_pins EDRICO_0/mie_debug_0] [get_bd_pins sim_EDRICO_AV_2_test_0/mie_debug_0]
  connect_bd_net -net EDRICO_0_minstretH_debug_0 [get_bd_pins EDRICO_0/minstretH_debug_0] [get_bd_pins sim_EDRICO_AV_2_test_0/minstretH_debug_0]
  connect_bd_net -net EDRICO_0_minstret_debug_0 [get_bd_pins EDRICO_0/minstret_debug_0] [get_bd_pins sim_EDRICO_AV_2_test_0/minstret_debug_0]
  connect_bd_net -net EDRICO_0_mip_debug_0 [get_bd_pins EDRICO_0/mip_debug_0] [get_bd_pins sim_EDRICO_AV_2_test_0/mip_debug_0]
  connect_bd_net -net EDRICO_0_misa_debug_0 [get_bd_pins EDRICO_0/misa_debug_0] [get_bd_pins sim_EDRICO_AV_2_test_0/misa_debug_0]
  connect_bd_net -net EDRICO_0_mscratch_debug_0 [get_bd_pins EDRICO_0/mscratch_debug_0] [get_bd_pins sim_EDRICO_AV_2_test_0/mscratch_debug_0]
  connect_bd_net -net EDRICO_0_mstatus_debug_0 [get_bd_pins EDRICO_0/mstatus_debug_0] [get_bd_pins sim_EDRICO_AV_2_test_0/mstatus_debug_0]
  connect_bd_net -net EDRICO_0_mtval_debug_0 [get_bd_pins EDRICO_0/mtval_debug_0] [get_bd_pins sim_EDRICO_AV_2_test_0/mtval_debug_0]
  connect_bd_net -net EDRICO_0_mtvec_debug_0 [get_bd_pins EDRICO_0/mtvec_debug_0] [get_bd_pins sim_EDRICO_AV_2_test_0/mtvec_debug_0]
  connect_bd_net -net EDRICO_0_x10_0 [get_bd_pins EDRICO_0/x10_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x10_0]
  connect_bd_net -net EDRICO_0_x11_0 [get_bd_pins EDRICO_0/x11_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x11_0]
  connect_bd_net -net EDRICO_0_x12_0 [get_bd_pins EDRICO_0/x12_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x12_0]
  connect_bd_net -net EDRICO_0_x13_0 [get_bd_pins EDRICO_0/x13_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x13_0]
  connect_bd_net -net EDRICO_0_x14_0 [get_bd_pins EDRICO_0/x14_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x14_0]
  connect_bd_net -net EDRICO_0_x15_0 [get_bd_pins EDRICO_0/x15_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x15_0]
  connect_bd_net -net EDRICO_0_x16_0 [get_bd_pins EDRICO_0/x16_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x16_0]
  connect_bd_net -net EDRICO_0_x17_0 [get_bd_pins EDRICO_0/x17_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x17_0]
  connect_bd_net -net EDRICO_0_x18_0 [get_bd_pins EDRICO_0/x18_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x18_0]
  connect_bd_net -net EDRICO_0_x19_0 [get_bd_pins EDRICO_0/x19_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x19_0]
  connect_bd_net -net EDRICO_0_x1_0 [get_bd_pins EDRICO_0/x1_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x1_0]
  connect_bd_net -net EDRICO_0_x20_0 [get_bd_pins EDRICO_0/x20_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x20_0]
  connect_bd_net -net EDRICO_0_x21_0 [get_bd_pins EDRICO_0/x21_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x21_0]
  connect_bd_net -net EDRICO_0_x22_0 [get_bd_pins EDRICO_0/x22_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x22_0]
  connect_bd_net -net EDRICO_0_x23_0 [get_bd_pins EDRICO_0/x23_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x23_0]
  connect_bd_net -net EDRICO_0_x24_0 [get_bd_pins EDRICO_0/x24_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x24_0]
  connect_bd_net -net EDRICO_0_x25_0 [get_bd_pins EDRICO_0/x25_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x25_0]
  connect_bd_net -net EDRICO_0_x26_0 [get_bd_pins EDRICO_0/x26_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x26_0]
  connect_bd_net -net EDRICO_0_x27_0 [get_bd_pins EDRICO_0/x27_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x27_0]
  connect_bd_net -net EDRICO_0_x28_0 [get_bd_pins EDRICO_0/x28_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x28_0]
  connect_bd_net -net EDRICO_0_x29_0 [get_bd_pins EDRICO_0/x29_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x29_0]
  connect_bd_net -net EDRICO_0_x2_0 [get_bd_pins EDRICO_0/x2_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x2_0]
  connect_bd_net -net EDRICO_0_x30_0 [get_bd_pins EDRICO_0/x30_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x30_0]
  connect_bd_net -net EDRICO_0_x31_0 [get_bd_pins EDRICO_0/x31_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x31_0]
  connect_bd_net -net EDRICO_0_x3_0 [get_bd_pins EDRICO_0/x3_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x3_0]
  connect_bd_net -net EDRICO_0_x4_0 [get_bd_pins EDRICO_0/x4_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x4_0]
  connect_bd_net -net EDRICO_0_x5_0 [get_bd_pins EDRICO_0/x5_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x5_0]
  connect_bd_net -net EDRICO_0_x6_0 [get_bd_pins EDRICO_0/x6_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x6_0]
  connect_bd_net -net EDRICO_0_x7_0 [get_bd_pins EDRICO_0/x7_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x7_0]
  connect_bd_net -net EDRICO_0_x8_0 [get_bd_pins EDRICO_0/x8_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x8_0]
  connect_bd_net -net EDRICO_0_x9_0 [get_bd_pins EDRICO_0/x9_0] [get_bd_pins sim_EDRICO_AV_2_test_0/x9_0]
  connect_bd_net -net clk_wiz_clk_out1 [get_bd_pins EDRICO_0/M_AXI_ACLK_0] [get_bd_pins EDRICO_0/s00_axi_aclk_0] [get_bd_pins EDRICO_0/system_clk] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/M01_ACLK] [get_bd_pins axi_mem_intercon/M02_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins data_ram/s_axi_aclk] [get_bd_pins instruction_rom/s_axi_aclk] [get_bd_pins sim_EDRICO_AV_2_test_0/system_clk]
  connect_bd_net -net rst_clk_wiz_100M_peripheral_aresetn [get_bd_pins EDRICO_0/M_AXI_ARESETN_0] [get_bd_pins EDRICO_0/s00_axi_aresetn_0] [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/M01_ARESETN] [get_bd_pins axi_mem_intercon/M02_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins data_ram/s_axi_aresetn] [get_bd_pins instruction_rom/s_axi_aresetn] [get_bd_pins sim_EDRICO_AV_2_test_0/M_AXI_ARSTN_0]
  connect_bd_net -net sim_EDRICO_AV_2_test_0_system_reset_async [get_bd_pins EDRICO_0/system_reset_async] [get_bd_pins sim_EDRICO_AV_2_test_0/system_reset_async]

  # Create address segments
  assign_bd_address -offset 0x02000000 -range 0x00008000 -target_address_space [get_bd_addr_spaces EDRICO_0/M_AXI_0] [get_bd_addr_segs EDRICO_0/S00_AXI_0/Reg0] -force
  assign_bd_address -offset 0x00000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces EDRICO_0/M_AXI_0] [get_bd_addr_segs instruction_rom/S_AXI/Mem0] -force
  assign_bd_address -offset 0xA0000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces EDRICO_0/M_AXI_0] [get_bd_addr_segs data_ram/S_AXI/Mem0] -force

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   "ActiveEmotionalView":"Default View",
   "Default View_ScaleFactor":"0.273314",
   "Default View_TopLeft":"-1416,552",
   "ExpandedHierarchyInLayout":"",
   "guistr":"# # String gsaved with Nlview 7.0r4  2019-12-20 bk=1.5203 VDI=41 GEI=36 GUI=JA:10.0 TLS
#  -string -flagsOSRD
preplace inst instruction_rom -pg 1 -lvl 3 -x 1820 -y 1410 -defaultsOSRD
preplace inst blk_mem_gen_0 -pg 1 -lvl 4 -x 2570 -y 1410 -defaultsOSRD
preplace inst data_ram -pg 1 -lvl 3 -x 1820 -y 1580 -defaultsOSRD
preplace inst blk_mem_gen_1 -pg 1 -lvl 4 -x 2570 -y 1580 -defaultsOSRD
preplace inst axi_mem_intercon -pg 1 -lvl 2 -x 1420 -y 1470 -defaultsOSRD
preplace inst sim_EDRICO_AV_2_test_0 -pg 1 -lvl 1 -x 700 -y 2380 -defaultsOSRD
preplace inst EDRICO_0 -pg 1 -lvl 3 -x 1820 -y 670 -defaultsOSRD
preplace netloc EDRICO_0_IR_debug 1 0 4 70 1450 1120J 1630 1580J 1490 2200
preplace netloc EDRICO_0_PC_debug 1 0 4 80 1460 1270J 1720 NJ 1720 2340
preplace netloc EDRICO_0_mcause_debug_0 1 0 4 90 1470 1190J 1670 NJ 1670 2210
preplace netloc EDRICO_0_mcountinhibit_debug_0 1 0 4 100 1490 1050J 1730 NJ 1730 2310
preplace netloc EDRICO_0_mcycleH_debug_0 1 0 4 110 1500 1250J 1740 NJ 1740 2300
preplace netloc EDRICO_0_mcycle_debug_0 1 0 4 30 140 NJ 140 NJ 140 2140
preplace netloc EDRICO_0_mepc_debug_0 1 0 4 20 100 NJ 100 NJ 100 2290
preplace netloc EDRICO_0_mie_debug_0 1 0 4 60 1510 1170J 1750 NJ 1750 2290
preplace netloc EDRICO_0_minstretH_debug_0 1 0 4 230 1810 NJ 1810 NJ 1810 2390
preplace netloc EDRICO_0_minstret_debug_0 1 0 4 240 1820 NJ 1820 NJ 1820 2380
preplace netloc EDRICO_0_mip_debug_0 1 0 4 40 1520 1220J 1900 NJ 1900 2430
preplace netloc EDRICO_0_misa_debug_0 1 0 4 50 1530 930J 1880 NJ 1880 2420
preplace netloc EDRICO_0_mscratch_debug_0 1 0 4 150 1750 1050J 1760 NJ 1760 2250
preplace netloc EDRICO_0_mstatus_debug_0 1 0 4 140 1670 1180J 1680 NJ 1680 2140
preplace netloc EDRICO_0_mtval_debug_0 1 0 4 120 1630 1100J 1650 1620J 1830 2330
preplace netloc EDRICO_0_mtvec_debug_0 1 0 4 130 1640 1030J 1990 NJ 1990 2440
preplace netloc EDRICO_0_x10_0 1 0 4 480 1740 960J 2030 NJ 2030 2460
preplace netloc EDRICO_0_x11_0 1 0 4 470 1730 970J 2040 NJ 2040 2450
preplace netloc EDRICO_0_x12_0 1 0 4 160 110 NJ 110 NJ 110 2240
preplace netloc EDRICO_0_x13_0 1 0 4 170 120 NJ 120 NJ 120 2230
preplace netloc EDRICO_0_x14_0 1 0 4 180 130 NJ 130 NJ 130 2220
preplace netloc EDRICO_0_x15_0 1 0 4 440 1720 1010J 1920 NJ 1920 2410
preplace netloc EDRICO_0_x16_0 1 0 4 410 1700 1020J 1930 NJ 1930 2400
preplace netloc EDRICO_0_x17_0 1 0 4 420 1710 1040J 1870 NJ 1870 2260
preplace netloc EDRICO_0_x18_0 1 0 4 390 1660 1100J 1800 NJ 1800 2160
preplace netloc EDRICO_0_x19_0 1 0 4 190 1480 1260J 1700 NJ 1700 2100
preplace netloc EDRICO_0_x1_0 1 0 4 400 1680 1120J 1770 NJ 1770 2120
preplace netloc EDRICO_0_x20_0 1 0 4 250 1540 1210J 1940 NJ 1940 2370
preplace netloc EDRICO_0_x21_0 1 0 4 260 1550 1150J 1950 NJ 1950 2360
preplace netloc EDRICO_0_x22_0 1 0 4 270 1560 1130J 1960 NJ 1960 2350
preplace netloc EDRICO_0_x23_0 1 0 4 280 1570 1110J 1710 NJ 1710 2070
preplace netloc EDRICO_0_x24_0 1 0 4 290 1580 1240J 1660 NJ 1660 2040
preplace netloc EDRICO_0_x25_0 1 0 4 300 1590 1070J 1970 NJ 1970 2280
preplace netloc EDRICO_0_x26_0 1 0 4 310 1600 1060J 1980 NJ 1980 2270
preplace netloc EDRICO_0_x27_0 1 0 4 450 1850 NJ 1850 1580J 1860 2130
preplace netloc EDRICO_0_x28_0 1 0 4 460 1860 NJ 1860 1570J 1890 2150
preplace netloc EDRICO_0_x29_0 1 0 4 430 1840 NJ 1840 NJ 1840 2110
preplace netloc EDRICO_0_x2_0 1 0 4 330 1690 1080J 1780 NJ 1780 2060
preplace netloc EDRICO_0_x30_0 1 0 4 200 1610 1230J 1640 1600J 1500 2030
preplace netloc EDRICO_0_x31_0 1 0 4 210 1620 990J 2050 NJ 2050 2320
preplace netloc EDRICO_0_x3_0 1 0 4 360 1780 1000J 1790 NJ 1790 2050
preplace netloc EDRICO_0_x4_0 1 0 4 370 1790 940J 2000 NJ 2000 2190
preplace netloc EDRICO_0_x5_0 1 0 4 220 1650 1090J 1690 NJ 1690 2020
preplace netloc EDRICO_0_x6_0 1 0 4 380 1830 NJ 1830 1600J 1850 2080
preplace netloc EDRICO_0_x7_0 1 0 4 350 1800 920J 2010 NJ 2010 2180
preplace netloc EDRICO_0_x8_0 1 0 4 340 1770 950J 2020 NJ 2020 2170
preplace netloc EDRICO_0_x9_0 1 0 4 320 1760 980J 1910 NJ 1910 2090
preplace netloc clk_wiz_clk_out1 1 1 2 1200 1310 1610
preplace netloc rst_clk_wiz_100M_peripheral_aresetn 1 1 2 1140 1300 1620
preplace netloc sim_EDRICO_AV_2_test_0_system_reset_async 1 1 2 1160J 1290 1580
preplace netloc EDRICO_0_M_AXI_0 1 1 3 1270 90 NJ 90 2200
preplace netloc axi_bram_ctrl_0_BRAM_PORTA 1 3 1 NJ 1410
preplace netloc axi_bram_ctrl_1_BRAM_PORTA 1 3 1 NJ 1580
preplace netloc axi_mem_intercon_M00_AXI 1 2 1 1580 1390n
preplace netloc axi_mem_intercon_M01_AXI 1 2 1 1590 1470n
preplace netloc axi_mem_intercon_M02_AXI 1 2 1 1570 610n
levelinfo -pg 1 0 700 1420 1820 2570 2690
pagesize -pg 1 -db -bbox -sgen 0 0 2690 2900
"
}

  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_sim_EDRICO_AV_2_tb()
cr_bd_sim_EDRICO_AV_2_tb ""
set_property REGISTERED_WITH_MANAGER "1" [get_files sim_EDRICO_AV_2_tb.bd ] 


# Create wrapper file for sim_EDRICO_AV_2_tb.bd
make_wrapper -files [get_files sim_EDRICO_AV_2_tb.bd] -import -top

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
    create_run -name synth_1 -part xc7z020clg400-1 -flow {Vivado Synthesis 2021} -strategy "Vivado Synthesis Defaults" -report_strategy {No Reports} -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2021" [get_runs synth_1]
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
    create_run -name impl_1 -part xc7z020clg400-1 -flow {Vivado Implementation 2021} -strategy "Vivado Implementation Defaults" -report_strategy {No Reports} -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2021" [get_runs impl_1]
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
