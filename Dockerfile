FROM runpod/worker-comfyui:5.8.4-base

ARG HF_TOKEN=""

COPY download_model.sh /download_model.sh
RUN chmod +x /download_model.sh && /download_model.sh

CMD ["python", "-u", "/start.py"]
