#!/bin/bash
set -e
MODEL_PATH="/comfyui/models/checkpoints/sd_xl_base_1.0_inpainting_0.1.safetensors"
MODEL_URL="https://huggingface.co/diffusers/stable-diffusion-xl-1.0-inpainting-0.1/resolve/main/sd_xl_base_1.0_inpainting_0.1.safetensors"

mkdir -p /comfyui/models/checkpoints

FILE_SIZE=$(stat -c%s "$MODEL_PATH" 2>/dev/null || echo 0)
if [ "$FILE_SIZE" -gt 6000000000 ]; then
    echo "[model] 이미 존재함 (${FILE_SIZE} bytes), 스킵"
    exit 0
fi

# 불완전 파일 제거
rm -f "$MODEL_PATH"

echo "[model] 다운로드 시작..."
wget --tries=3 --timeout=300 --show-progress \
     -O "$MODEL_PATH" "$MODEL_URL"

FILE_SIZE=$(stat -c%s "$MODEL_PATH" 2>/dev/null || echo 0)
if [ "$FILE_SIZE" -lt 6000000000 ]; then
    echo "[model] ERROR: 파일 크기 불량 (${FILE_SIZE} bytes)"
    rm -f "$MODEL_PATH"
    exit 1
fi
echo "[model] 완료 (${FILE_SIZE} bytes)"
