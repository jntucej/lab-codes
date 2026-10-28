# Session Hiding — Terminal Incognito Mode (Ubuntu)

Two scripts to keep terminal activity private:

1. **`incognito.sh`** — disables shell history for the current session
2. **`cleanup_traces.sh`** — clears history + system logs after the session

## Start a Private Session

```bash
chmod +x incognito.sh
source ./incognito.sh
# ... work in terminal ...
```

## Clean Up After

```bash
sudo -S -p '' bash cleanup_traces.sh
```

## Quick One-Liner Alternative

```bash
set +o history   # disable history for current shell
```

## Optional: covermytracks (comprehensive)

```bash
sudo -S -p '' curl -sSL https://raw.githubusercontent.com/sagarkhandve/covermytracks/main/covermytracks -o /usr/bin/covermytracks && sudo -S -p '' chmod +x /usr/bin/covermytracks
covermytracks
```

> ⚠️ These only work on systems you own or have permission to manage.
