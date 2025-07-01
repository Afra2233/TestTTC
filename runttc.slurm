#!/bin/bash
#SBATCH --job-name=ttc_test
#SBATCH --output=ttc_log_%j.txt
#SBATCH --time=48:00:00
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --mem=32G
#SBATCH --cpus-per-task=4
#SBATCH -A bdlan08

# 加载conda环境
source ~/.bashrc
conda activate TTC

# 进入项目目录
cd /nobackup/projects/bdlan08/jzhang89/TestTTC

# 执行 Python 脚本
python code/test_time_counterattack.py \
    --batch_size 256 \
    --test_attack_type 'pgd' \
    --test_eps 1 \
    --test_numsteps 10 \
    --test_stepsize 1 \
    --outdir 'TTC_results' \
    --seed 1 \
    --ttc_eps 4 \
    --beta 2 \
    --tau_thres 0.2 \
    --ttc_numsteps 2
