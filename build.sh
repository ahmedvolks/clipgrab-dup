#!/usr/bin/env bash
# Builds ClipGrab (with duplicate-download detection) without root and without qmake.
# Output: ./clipgrab
#
# Usage:   ./build.sh
# Env:     QT_PREFIX=/path   (where to place extracted Qt dev files, default /tmp/clipgrab-qt-dev)
#          BUILD_DIR=/path   (object dir, default /tmp/clipgrab-build)
set -euo pipefail
cd "$(dirname "$0")"
SRC="$PWD"
QT="${QT_PREFIX:-/tmp/clipgrab-qt-dev}"
BUILD="${BUILD_DIR:-/tmp/clipgrab-build}"
VERSION="$(awk '$1=="VERSION"{print $3}' clipgrab.pro)"

# --- 1) Qt dev files (headers + moc/uic/rcc); apt-get download works without root ---
if [ ! -d "$QT/usr/include/x86_64-linux-gnu/qt5" ]; then
    echo "==> Fetching Qt development files (no root required)"
    mkdir -p "$QT/debs"
    pick() { apt-cache madison "$1" | grep -v esm | head -1 | awk '{print $3}'; }
    for p in qtbase5-dev qtbase5-dev-tools qtwebengine5-dev libqt5webchannel5-dev \
             qtdeclarative5-dev qtpositioning5-dev libgl-dev libglx-dev mesa-common-dev; do
        v="$(pick "$p")"
        [ -n "$v" ] || { echo "error: no installable version of $p" >&2; exit 1; }
        (cd "$QT/debs" && apt-get download "$p=$v")
    done
    for d in "$QT"/debs/*.deb; do dpkg-deb -x "$d" "$QT"; done
fi
QTBIN="$QT/usr/lib/qt5/bin"
QTINC="$QT/usr/include/x86_64-linux-gnu/qt5"

# --- 2) code generation: uic / moc / rcc ---
echo "==> Generating ui_*.h, moc_*.cpp, qrc_*.cpp"
mkdir -p "$BUILD/ui" "$BUILD/gen" "$BUILD/obj"
for f in *.ui; do "$QTBIN/uic" "$f" -o "$BUILD/ui/ui_${f%.ui}.h"; done
for h in *.h; do
    grep -q Q_OBJECT "$h" || continue
    [ "$h" = login_dialog.h ] && continue   # dead upstream file, not in clipgrab.pro
    "$QTBIN/moc" "$h" -o "$BUILD/gen/moc_${h%.h}.cpp"
done
"$QTBIN/rcc" resources.qrc -o "$BUILD/gen/qrc_resources.cpp"

# --- 3) compile ---
echo "==> Compiling"
INCS="-I$SRC -I$BUILD/ui -I$QT/usr/include -I$QTINC \
 -I$QTINC/QtCore -I$QTINC/QtGui -I$QTINC/QtWidgets -I$QTINC/QtNetwork -I$QTINC/QtXml \
 -I$QTINC/QtWebEngineWidgets -I$QTINC/QtWebEngineCore -I$QTINC/QtWebChannel \
 -I$QTINC/QtQml -I$QTINC/QtQmlModels -I$QTINC/QtQuick -I$QTINC/QtPositioning"
FLAGS="-fPIC -std=c++17 -w -O1 -DCLIPGRAB_VERSION=$VERSION"
compile() {
    g++ -c $FLAGS $INCS "$1" -o "$BUILD/obj/$(basename "${1%.cpp}").o"
}
for f in *.cpp; do
    [ "$f" = login_dialog.cpp ] && continue
    compile "$SRC/$f"
done
for f in "$BUILD"/gen/*.cpp; do compile "$f"; done

# --- 4) link against the system's installed Qt runtime libraries ---
echo "==> Linking"
mkdir -p "$BUILD/qtlibs"
for l in Core Gui Widgets Network Xml WebEngineWidgets WebEngineCore WebChannel \
         Qml QmlModels Quick QuickWidgets Positioning; do
    [ -e "/usr/lib/x86_64-linux-gnu/libQt5$l.so.5" ] && \
        ln -sfn "/usr/lib/x86_64-linux-gnu/libQt5$l.so.5" "$BUILD/qtlibs/libQt5$l.so"
done
g++ -o "$SRC/clipgrab" "$BUILD"/obj/*.o -L"$BUILD/qtlibs" \
    -lQt5Widgets -lQt5Gui -lQt5Core -lQt5Network -lQt5Xml \
    -lQt5WebEngineWidgets -lQt5WebEngineCore -lQt5WebChannel \
    -lQt5Qml -lQt5QmlModels -lQt5Quick -lQt5Positioning

echo "==> Done: $SRC/clipgrab"
echo "    Run it with:  $SRC/clipgrab"
