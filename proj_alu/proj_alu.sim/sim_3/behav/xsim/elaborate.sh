#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Sat Jan 21 19:05:21 MST 2023
# SW Build 2708876 on Wed Nov  6 21:39:14 MST 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto 33f1b6663c7e484ab22f059ab2ae6008 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_calc_behav xil_defaultlib.tb_calc xil_defaultlib.glbl -log elaborate.log"
xelab -wto 33f1b6663c7e484ab22f059ab2ae6008 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_calc_behav xil_defaultlib.tb_calc xil_defaultlib.glbl -log elaborate.log

