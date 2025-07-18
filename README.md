# docker-img2vid

Custom RunPod image for Wan2GP with a stable CUDA/PyTorch environment.

## Features
- PyTorch 2.4.0 + CUDA 12.1 (stable)
- FP16 by default (`--fp16`)
- Gradio Web UI exposed on port 7860

## Usage on RunPod
1. Upload this repo to GitHub.
2. In RunPod: **Create Pod → Custom Docker Image → Build from GitHub**.
3. Port: `7860`
4. Open Web UI: `https://<your-pod-id>-7860.proxy.runpod.net`

## Environment Variables
You can override defaults via RunPod:
- `WAN2GP_ARGS="--listen --fp16 --profile 2"`
- `CUDA_LAUNCH_BLOCKING=1` (for debugging)
