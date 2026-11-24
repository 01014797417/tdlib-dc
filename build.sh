#!/usr/bin/env bash
# يبني libtdjson 1.8.69 معدّلة: المتغير TD_MAIN_DC=<1-5> يحدد الـ DC الابتدائي (غير موجود = DC1 = السلوك الأصلي).
set -euo pipefail
COMMIT=9d92b49bc5d0d2e29fe518239af647a88f8680e6
HERE="$(cd "$(dirname "$0")" && pwd)"
SRC="${1:-$HOME/tdlib-src}"
rm -rf "$SRC" && git clone https://github.com/tdlib/td.git "$SRC"
cd "$SRC" && git checkout "$COMMIT" && git apply "$HERE/td-main-dc.patch"
mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --target tdjson -j2
echo "تم: $SRC/build/libtdjson.so"
