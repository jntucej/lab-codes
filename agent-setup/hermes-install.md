# Hermes Agent — Install (Single Command)

## 1. One-line install (Ubuntu / macOS / Linux)

```bash
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
```

Prerequisites: `git` installed. That's it — the script pulls Python,
Node.js, `ripgrep`, and everything else.

## 2. After install

```bash
source ~/.bashrc        # or ~/.zshrc on macOS
hermes setup            # configuration wizard
hermes                  # start chatting
```

## 3. Wire up the OMNIROUTE endpoint

Edit `~/.hermes/config.yaml`:

```yaml
model:
  provider: omniroute
  base_url: https://omniroute.ucej.in/v1
providers:
  omniroute:
    base_url: https://omniroute.ucej.in/v1
    api_key: sk-6520980b9b390c95-1b09c8-9f6cd034
```

Then `hermes` picks it up on next start.
