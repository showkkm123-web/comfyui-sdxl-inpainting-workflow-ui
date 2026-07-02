#!/bin/bash
MODEL_PATH="/comfyui/models/checkpoints/sd_xl_base_1.0_inpainting_0.1.safetensors"
MODEL_URL="https://huggingface.co/diffusers/stable-diffusion-xl-1.0-inpainting-0.1/resolve/main/sd_xl_base_1.0_inpainting_0.1.safetensors"

if [ ! -f "$MODEL_PATH" ]; then
    echo "모델 다운로드 중..."
    mkdir -p /comfyui/models/checkpoints
    wget -q --show-progress -O "$MODEL_PATH" "$MODEL_URL"
    echo "다운로드 완료"
else
    echo "모델 이미 존재함, 스킵"
fi
