#!/bin/bash
set -e

MODEL_PATH="/comfyui/models/checkpoints/sd_xl_base_1.0_inpainting_0.1.safetensors"
MODEL_URL="https://huggingface.co/diffusers/stable-diffusion-xl-1.0-inpainting-0.1/resolve/main/sd_xl_base_1.0_inpainting_0.1.safetensors"

if [ ! -f "$MODEL_PATH" ]; then
    echo "모델 다운로드 중..."
    mkdir -p /comfyui/models/checkpoints
    python3 -c "
import urllib.request, sys
print('Downloading SDXL inpainting model...')
urllib.request.urlretrieve('$MODEL_URL', '$MODEL_PATH')
import os
size = os.path.getsize('$MODEL_PATH')
print(f'Downloaded: {size} bytes')
assert size > 1000000, f'File too small: {size}'
"
    echo "완료"
else
    echo "모델 이미 존재함, 스킵"
fi
