#!/bin/bash

# QWERTY-Ar Linux Installer
# Arabic Keyboard Layout - كوارتي
# (c) 2025 BENALIA Mohamed

echo "Installing QWERTY-Ar Arabic Keyboard Layout..."

# Copy layout file
sudo cp qwerty-ar.xkb /usr/share/X11/xkb/symbols/qwerty-ar
echo "Layout file copied to /usr/share/X11/xkb/symbols/"

if grep -q "qwerty-ar" /usr/share/X11/xkb/rules/evdev.xml; then
    echo "Layout already registered in evdev.xml. Skipping modification."
else
    echo "Registering layout in evdev.xml..."

    sudo sed -i '/<\/layoutList>/i \
    <layout>\n\
      <configItem>\n\
        <name>qwerty-ar</name>\n\
        <shortDescription>ar</shortDescription>\n\
        <description>Arabic - QWERTY-Ar</description>\n\
        <languageList>\n\
          <iso639Id>ara</iso639Id>\n\
        </languageList>\n\
      </configItem>\n\
    </layout>\n' /usr/share/X11/xkb/rules/evdev.xml

    echo "✅ Layout registered in evdev.xml"
fi

setxkbmap qwerty-ar
echo "✅ Layout applied. You can now type using QWERTY-Ar."

echo "ℹ️ For permanent use, set 'setxkbmap qwerty-ar' in your startup applications or .xprofile"

echo "-- Installation complete! --"
