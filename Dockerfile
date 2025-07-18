# ---- Base Image: Stabile PyTorch Version mit CUDA ----
FROM pytorch/pytorch:2.4.0-cuda12.1-cudnn8-runtime

# ---- Arbeitsverzeichnis ----
WORKDIR /app

# ---- System-Pakete ----
RUN apt-get update && apt-get install -y \
    git wget ffmpeg libgl1 \
    && rm -rf /var/lib/apt/lists/*

# ---- Wan2GP klonen ----
RUN git clone https://github.com/wan-works/Wan2GP.git /app

# ---- Python Abhängigkeiten installieren ----
RUN pip install --upgrade pip
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# ---- Umgebungsvariablen (FP16 für Stabilität) ----
ENV WAN2GP_ARGS="--listen --fp16"

# ---- Port für Gradio Web UI ----
EXPOSE 7860

# ---- Startbefehl ----
CMD python wgp.py $WAN2GP_ARGS
