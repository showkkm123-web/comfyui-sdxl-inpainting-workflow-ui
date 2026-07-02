FROM runpod/worker-comfyui:5.8.6-base

ARG HF_TOKEN=""

RUN apt-get update && apt-get install -y curl --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY download_model.sh /download_model.sh
RUN chmod +x /download_model.sh && /download_model.sh

CMD ["python", "-u", "/start.py"]
