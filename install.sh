#!/bin/bash
set -e  

# clear build dirs
rm -rf build
rm -rf *.egg-info
rm -rf ktransformers/ktransformers_ext/build
rm -rf ktransformers/ktransformers_ext/cuda/build
rm -rf ktransformers/ktransformers_ext/cuda/dist
rm -rf ktransformers/ktransformers_ext/cuda/*.egg-info

echo "Installing python dependencies from requirements.txt"
pip install -r requirements-local_chat.txt

# 设置CUDA架构标志 - 支持P100(sm_60)和RTX 4060(sm_89)
export TORCH_CUDA_ARCH_LIST="6.0;8.9"

echo "Installing ktransformers"
KTRANSFORMERS_FORCE_BUILD=TRUE pip install . --no-build-isolation
echo "Installation completed successfully"