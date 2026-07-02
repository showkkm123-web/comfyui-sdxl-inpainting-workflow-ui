#!/bin/bash
MODEL_PATH="/comfyui/models/checkpoints/sd_xl_base_1.0_inpainting_0.1.safetensors"
MODEL_URL="https://huggingface.co/diffusers/stable-diffusion-xl-1.0-inpainting-0.1/resolve/main/sd_xl_base_1.0_inpainting_0.1.safetensors"

mkdir -p /comfyui/models/checkpoints

FILE_SIZE=$(stat -c%s "$MODEL_PATH" 2>/dev/null || echo 0)
if [ "$FILE_SIZE" -gt 6000000000 ]; then
    echo "모델 이미 존재함 (${FILE_SIZE} bytes), 스킵"
    exit 0
fi

echo "모델 다운로드 중..."
wget -q --show-progress -O "$MODEL_PATH" "$MODEL_URL"
echo "다운로드 완료"
