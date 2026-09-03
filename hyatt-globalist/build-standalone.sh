#!/usr/bin/env sh
# Wraps artifact.html (an Artifact fragment) into a full HTML document that can
# be opened locally or served from GitHub Pages. The Claude Artifact runtime is
# absent there, so the app falls back to localStorage on that single device.
set -e
cd "$(dirname "$0")"
{
  printf '%s\n' '<!doctype html>' '<html lang="en">' '<head>' \
    '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">' \
    '<meta name="apple-mobile-web-app-capable" content="yes">' \
    '<meta name="apple-mobile-web-app-title" content="Globalist">' \
    '<style>*{box-sizing:border-box}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>'
  printf '%s\n' '</head>' '<body>'
  cat artifact.html
  printf '%s\n' '</body>' '</html>'
} > index.html
echo "wrote $(pwd)/index.html"
