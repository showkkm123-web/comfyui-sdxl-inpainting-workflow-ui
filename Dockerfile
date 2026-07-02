FROM runpod/worker-comfyui:5.8.6-base

RUN apt-get update && apt-get install -y wget --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY download_model.sh /download_model.sh
RUN chmod +x /download_model.sh

# /start.sh 앞에 모델 다운로드 삽입
RUN sed -i '1a /download_model.sh' /start.sh
