#!/usr/bin/env bash
# Run all available models — one-click.
#
# Usage:
#   bash run-models.sh              # run everything, 10 turns each
#   bash run-models.sh 20           # run everything, 20 turns each

set -euo pipefail

TURN_LIMIT="${1:-10}"

echo "============================================================"
echo " OLLAMA + LOCAL MODELS"
echo "============================================================"

# 1. Ollama Llama 3.2 (auto-installs if not present)
for model in llama3.2 llama3.2:1b; do
  if ollama list 2>/dev/null | grep -q "$model"; then
    echo ""
    echo ">>> $model (chat ${TURN_LIMIT} turns)"
    ollama run "$model" "Say hello in 5 words. Then answer: what is 2+2?"
  else
    echo "[skip] $model not installed locally"
  fi
done

# 2. Tinytron (code-tuned)
echo ""
echo ">>> Tinytron 1B code (if installed)"
if ollama list 2>/dev/null | grep -q "Tinytron-1B"; then
  ollama run "Agnuxo/Tinytron-1B-TinyLlama-Instruct_CODE_Python-Spanish_English_GGUF_16bit" \
    "Write a Python function that reverses a string. 5 lines max."
else
  echo "[skip] Tinytron not installed"
fi

echo ""
echo "============================================================"
echo " HERMES (OMNIROUTE CLOUD MODELS)"
echo "============================================================"

# 3. Hermes via OMNIROUTE — agnes + gemini
#    Requires Hermes installed: see hermes-install.md
if command -v hermes >/dev/null 2>&1; then
  echo ">>> hermes model omniroute/agnes-3.0-flash"
  hermes --model omniroute/agnes-3.0-flash \
    "Say hello in 3 words, then name 2 programming languages."

  echo ""
  echo ">>> hermes model omniroute/agy/gemini-3.1-flash-lite"
  hermes --model omniroute/agy/gemini-3.1-flash-lite \
    "Say hello in 3 words, then name 2 programming languages."
else
  echo "[skip] Hermes not installed. Run: curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash"
fi

echo ""
echo "All done."
