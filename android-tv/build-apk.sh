#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

if [[ -x /root/.local/share/mise/installs/java/17.0.2/bin/java ]]; then
  export JAVA_HOME=/root/.local/share/mise/installs/java/17.0.2
  export PATH="$JAVA_HOME/bin:$PATH"
fi

echo "Using Java: $(java -version 2>&1 | head -n 1)"

./gradlew --no-daemon clean assembleDebug

APK_PATH="app/build/outputs/apk/debug/app-debug.apk"
if [[ ! -f "$APK_PATH" ]]; then
  echo "Build finished but APK not found: $APK_PATH" >&2
  exit 1
fi

cp -f "$APK_PATH" "$ROOT_DIR/KVideo-TV-debug.apk"
echo "APK ready: $ROOT_DIR/KVideo-TV-debug.apk"
