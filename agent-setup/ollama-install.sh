#!/usr/bin/env bash
# One-click Ollama + Llama install (Linux / macOS)
#
# Usage:
#   curl -fsSL <this-script> | bash
#   # or:
#   bash ollama-install.sh

set -euo pipefail

# 1. Install Ollama
if command -v ollama >/dev/null 2>&1; then
  echo "[ok] Ollama already installed: $(ollama -v 2>&1 || true)"
else
  echo "[..] Installing Ollama..."
  curl -fsSL https://ollama.com/install.sh | sh
fi

# 2. Verify server is up
sleep 2
if ! curl -s http://127.0.0.1:11434 >/dev/null 2>&1; then
  echo "[..] Ollama server not running, starting it..."
  (ollama serve >/dev/null 2>&1 &)
  sleep 3
fi

# 3. Pull models (one-time ~1.3–2.0 GB download each)
echo "[..] Pulling llama3.2 (3B)..."
ollama pull llama3.2 2>&1 | tail -3 || true

echo "[..] Pulling llama3.2:1b..."
ollama pull llama3.2:1b 2>&1 | tail -3 || true

echo ""
echo "Done. Available models:"
ollama list

echo ""
echo "Run any of these:"
echo "  ollama run llama3.2              # 3B, general"
echo "  ollama run llama3.2:1b           # 1B, CPU-friendly"
echo "  ollama run Agnuxo/Tinytron-1B-TinyLlama-Instruct_CODE_Python-Spanish_English_GGUF_16bit"
echo "  ollama run Agnuxo/Tinytron-TinyLlama-Instruct_CODE_Python-GGUF_Spanish_English_8bit"
