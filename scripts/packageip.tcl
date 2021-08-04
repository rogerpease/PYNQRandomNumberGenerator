#-----------------------------------------------------------
# Vivado v2020.2 (64-bit)
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
# IP Build 3064653 on Wed Nov 18 14:17:31 MST 2020
# Start of session at: Tue Aug  3 19:40:03 2021
# Process ID: 16703
# Current directory: /home/rpease/PYNQRandomNumberGenerator
# Command line: vivado
# Log file: /home/rpease/PYNQRandomNumberGenerator/vivado.log
# Journal file: /home/rpease/PYNQRandomNumberGenerator/vivado.jou
#-----------------------------------------------------------
create_project RNGProject /home/rpease/PYNQRandomNumberGenerator/RNGProject -part xc7z020clg400-1
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
ipx::infer_core -vendor user.org -library user -taxonomy /UserIP /home/rpease/PYNQRandomNumberGenerator/Verilog/module
ipx::edit_ip_in_project -upgrade true -name AXIRandomNumberGenerator -directory /home/rpease/PYNQRandomNumberGenerator/RNGProject/RNGProject.tmp /home/rpease/PYNQRandomNumberGenerator/Verilog/module/component.xml
ipx::current_core /home/rpease/PYNQRandomNumberGenerator/Verilog/module/component.xml
update_compile_order -fileset sources_1
# Disabling source management mode.  This is to allow the top design properties to be set without GUI intervention.
set_property source_mgmt_mode None [current_project]
set_property top RNGModuleTop [current_fileset]
# Re-enabling previously disabled source management mode.
set_property source_mgmt_mode All [current_project]
update_compile_order -fileset sources_1
ipx::merge_project_changes files [ipx::current_core]
ipx::merge_project_changes hdl_parameters [ipx::current_core]
set_property previous_version_for_upgrade user.org:user:RouteRingOscillatorValue:1.0 [ipx::current_core]
set_property core_revision 1 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]
ipx::move_temp_component_back -component [ipx::current_core]
close_project -delete
set_property  ip_repo_paths  /home/rpease/PYNQRandomNumberGenerator/Verilog/module [current_project]
update_ip_catalog
update_ip_catalog -rebuild
