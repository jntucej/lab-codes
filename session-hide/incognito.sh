#!/bin/bash
# incognito.sh - Disable shell history for the current session
# Usage: source ./incognito.sh   (must be sourced, not executed)
set +o history
echo "Incognito mode enabled. Commands will not be saved to history."
echo "Run 'set -o history' to re-enable logging."
