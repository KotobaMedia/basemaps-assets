#!/bin/bash -e

# Download fonts

OUT=$(dirname "$(realpath "$0")")/../src/fonts
TMP=$(mktemp -d)

echo "Downloading fonts to $TMP"
trap 'rm -rf "$TMP"' EXIT

curl -L -o "$TMP/noto-sans.zip" "https://github.com/notofonts/noto-cjk/releases/download/Sans2.004/06_NotoSansCJKjp.zip"
mkdir -p "$TMP/noto-sans"
unzip -d "$TMP/noto-sans" "$TMP/noto-sans.zip"

echo "Copying fonts to $OUT"
mkdir -p "$OUT"

cp "$TMP/noto-sans/NotoSansCJKjp-Regular.otf" "$OUT/Noto Sans Regular.otf"
cp "$TMP/noto-sans/NotoSansCJKjp-Medium.otf" "$OUT/Noto Sans Medium.otf"
