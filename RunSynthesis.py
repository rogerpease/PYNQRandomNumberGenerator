#!/usr/bin/env python3 

#
# NOTE: This script is my own, but most of the verilog code is from auto-generated from an AXI Peripheral TB which I adapted to my needs. 
# NOTE: Normally I'd do this with a makefile but this is more for notes/education purposes so drawing out the steps makes more sense. 
#
# Quick script to capture how to compile verilog for simulation on the command line with Vivado. 
#
#
# TODO: Make this into a python object so that I can call 
#
#


import os 
import subprocess
import json

os.environ["LD_LIBRARY_PATH"]= "/tools/Xilinx/.xinstall/Vivado_2020.2/lib/lnx64.o:/tools/Xilinx/Vivado/2020.2/lib/lnx64.o:/tools/Xilinx/.xinstall/Vivado_2020.2/lib/lnx64.o/SuSE/"

VIVADO_BIN = "/tools/Xilinx/Vivado/2020.2/bin/"



#
# Make sure to use 
#    "-L uva -L axi_vip_v1_1_8 -L xilinx_vip" for all the axi libraries and 
#    --sv for systemverilog
#





def Run(commandString):
  print("Running: "," ".join(commandString))
  result = subprocess.Popen(commandString)
  text = result.communicate()[0]
  return_code = result.returncode  
  print("Returning ",return_code)
  if (return_code != 0):
    exit(1)
   


command = [VIVADO_BIN + "vivado","-mode","batch", "-source","scripts/synthesis.module.tcl"] 
Run(command) 

