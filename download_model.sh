#!/bin/bash
MODEL_PATH="/comfyui/models/checkpoints/sd_xl_base_1.0_inpainting_0.1.safetensors"
MODEL_URL="https://huggingface.co/diffusers/stable-diffusion-xl-1.0-inpainting-0.1/resolve/main/sd_xl_base_1.0_inpainting_0.1.safetensors"

mkdir -p /comfyui/models/checkpoints

echo "모델 다운로드 중..."
if [ -n "$HF_TOKEN" ]; then
    wget -q --show-progress --header="Authorization: Bearer $HF_TOKEN" -O "$MODEL_PATH" "$MODEL_URL"
else
    wget -q --show-progress -O "$MODEL_PATH" "$MODEL_URL"
fi

# 파일 크기 검증 (최소 6GB)
FILE_SIZE=$(stat -c%s "$MODEL_PATH" 2>/dev/null || echo 0)
if [ "$FILE_SIZE" -lt 6000000000 ]; then
    echo "ERROR: 모델 파일 불완전 (${FILE_SIZE} bytes). 재다운로드..."
    rm -f "$MODEL_PATH"
    exit 1
fi
echo "다운로드 완료 (${FILE_SIZE} bytes)"
