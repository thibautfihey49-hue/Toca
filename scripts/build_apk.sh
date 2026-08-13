#!/bin/bash
set -euo pipefail

GODOT_VERSION="4.3-stable"
PROJET_DIR="$(cd "$(dirname "$0")/.." && pwd)/godot-project"
BUILD_DIR="$(dirname "$0")/../build"

if command -v termux-setup-storage &>/dev/null; then
    GODOT_BIN="$HOME/Godot/Godot"
else
    GODOT_BIN="/usr/local/bin/godot"
fi

if [ ! -x "$GODOT_BIN" ]; then
    echo "🔽 Installation Godot..."
    mkdir -p "$(dirname "$GODOT_BIN")"
    cd "$(dirname "$GODOT_BIN")"
    wget -q "https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}/Godot_v${GODOT_VERSION}_linux.x86_64.zip"
    unzip -q "Godot_v${GODOT_VERSION}_linux.x86_64.zip"
    mv "Godot_v${GODOT_VERSION}_linux.x86_64" Godot
    chmod +x Godot
    GODOT_BIN="$(pwd)/Godot"
    rm -f "Godot_v${GODOT_VERSION}_linux.x86_64.zip"
fi

mkdir -p "$BUILD_DIR"
cd "$PROJET_DIR"
"$GODOT_BIN" --headless --export-debug "Android" "$BUILD_DIR/MaVilleMonde.apk"
echo "✅ APK : $BUILD_DIR/MaVilleMonde.apk"
