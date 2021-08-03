#!/usr/bin/env python3 


#
# In a production environment with a full EDA staff you'd probably have this done with include config files/etc. :) 
#
#

import os

PYNQHOST="xilinx@192.168.1.128"
PYNQROOTHOST="root@192.168.1.128"
ProjectName="PYNQRandomNumberGenerator"
PYNQDIR="/home/xilinx/"+ProjectName
PYNQSCPTARGET=PYNQHOST+":"+PYNQDIR


def Run(command):
  print("Running: "+command)
  os.system(command)

#
# Copy all files to ZYNQ 
#

Run("ssh "+PYNQHOST + " rm "+PYNQDIR+"/*")
Run("ssh "+PYNQHOST + " mkdir "+PYNQDIR)
Run("scp ./FPGAImage/FPGAImage.runs/impl_1/design_1_wrapper.bit "+                 PYNQSCPTARGET+"/"+ProjectName+".bit")
Run("scp ./FPGAImage/FPGAImage.gen/sources_1/bd/design_1/hw_handoff/design_1.hwh "+PYNQSCPTARGET+"/"+ProjectName+".hwh")
#Run("scp ./python/RunSBNOverlay.py ./python/ZYNQRunSBNRegression.sh "+PYNQSCPTARGET)

Run("ssh "+PYNQROOTHOST + ' ' + PYNQDIR +"/ZYNQRunSBNRegression.sh" )
