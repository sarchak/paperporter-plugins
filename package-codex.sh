#!/bin/sh
# Build the ZIP uploaded to the OpenAI plugin directory (ChatGPT and Codex).
# The skill, assets, README and license are shared with the Claude plugin.
set -eu
cd "$(dirname "$0")"
out="$PWD/dist/paperporter-codex.zip"
work="$(mktemp -d)"
cp -R codex/.codex-plugin codex/.mcp.json "$work/"
cp -R paperporter/skills paperporter/assets paperporter/README.md paperporter/LICENSE "$work/"
mkdir -p dist && rm -f "$out"
(cd "$work" && zip -qr -X "$out" . -x '*.DS_Store')
rm -rf "$work"
echo "$out"
