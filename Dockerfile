FROM runpod/worker-comfyui:5.8.6-base

RUN apt-get update && apt-get install -y wget --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY download_model.sh /download_model.sh
RUN chmod +x /download_model.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
