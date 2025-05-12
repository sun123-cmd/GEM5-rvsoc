#!/bin/bash


export gem5_home='/home/sun/soc/GEM5-rvsoc'
# For NEMU Difftest
# export GCBV_REF_SO='/home/sun/soc/GEM5-rvsoc/configs/example/xs_workloads/riscv64-nemu-interpreter-c1469286ca32-so'

# FOor Spike Difftest, just for single core
export GCBV_REF_SO=`realpath /home/sun/soc/spike/difftest/build/riscv64-spike-so`

# DRAM SIM Settings
export DRAMSIM3_ROOT=/home/sun/soc/GEM5-rvsoc/ext/dramsim3/DRAMSim3

# For multi-core sim
export GCB_MULTI_CORE_RESTORER=/path/to/multi_core_restorer
export GCBV_MULTI_CORE_REF_SO=$(pwd)/configs/example/xs_workloads/riscv64-nemu-interpreter-c1469286ca32-so

# rvgem5 xiangshan.py --generic-rv-cpt /path/to/rv-cpt -n 2 --mem-type DDR4_2400_8x8 --mem-size 8GB --l2cache

# For simple run sim
# rvgem5 xiangshan.py --raw-cpt --generic-rv-cpt=./ready-to-run/coremark-2-iteration.bin
# Current script
# ./build/RISCV/gem5.opt ./configs/example/xiangshan.py \
#     --mem-type=DDR4_2400_8x8 \
#     --raw-cpt \
#     --generic-rv-cpt=./configs/example/xs_workloads/ready-to-run/coremark-2-iteration.bin \
#     --difftest-ref-so=./configs/example/xs_workloads/riscv64-nemu-interpreter-c1469286ca32-so
    
/home/sun/soc/GEM5-rvsoc/build/RISCV/gem5.opt ./configs/example/xiangshan.py \
    --num-cpus=1 \
        --cpu-clock=2GHz \
        --mem-type=DDR4_2400_8x8 \
        --caches \
        --l2cache \
        --l3cache \
        --l1d_size=64kB \
        --l1i_size=64kB \
        --l1d_assoc=8 \
        --l1i_assoc=8 \
        --l2_size=512kB \
        --l2_assoc=8 \
        --l3_size=8MB \
        --l3_assoc=16 \
        --cacheline_size=64 \
        --raw-cpt \
        --generic-rv-cpt=./configs/example/xs_workloads/ready-to-run/coremark-2-iteration.bin \
        --difftest-ref-so=./configs/example/xs_workloads/riscv64-nemu-interpreter-c1469286ca32-so
        # --difftest-ref-so=/home/sun/soc/NEMU/build/riscv64-nemu-interpreter-so
        # --difftest-ref-so=/home/sun/soc/spike/difftest/build/riscv64-spike-so