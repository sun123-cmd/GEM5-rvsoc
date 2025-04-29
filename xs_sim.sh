#!/bin/bash

alias rvgem5='/home/sun/soc/GEM5-rvsoc/build/RISCV/gem5.opt'
export GCBV_REF_SO='/home/sun/soc/GEM5-rvsoc/configs/example/xs_workloads/riscv64-nemu-interpreter-c1469286ca32-so'
export DRAMSIM3_ROOT=/home/sun/soc/GEM5-rvsoc/ext/dramsim3/DRAMSim3
export gem5_home='/home/sun/soc/GEM5-rvsoc'
# rvgem5 xiangshan.py --generic-rv-cpt /path/to/rv-cpt -n 2 --mem-type DDR4_2400_8x8 --mem-size 8GB --l2cache

# For simple run sim
# rvgem5 xiangshan.py --raw-cpt --generic-rv-cpt=./ready-to-run/coremark-2-iteration.bin
# Current script
./build/RISCV/gem5.opt ./configs/example/xiangshan.py \
    --mem-type=DDR4_2400_8x8 \
    --raw-cpt \
    --generic-rv-cpt=./configs/example/xs_workloads/ready-to-run/coremark-2-iteration.bin \
    --difftest-ref-so=./configs/example/xs_workloads/riscv64-nemu-interpreter-c1469286ca32-so