#!/usr/bin/env bash
ARD_VER="1.8.5"
# "/sbin/start-stop-daemon --start --quiet --pidfile /tmp/custom_xvfb_1.pid --make-pidfile --background --exec /usr/bin/Xvfb -- :1 -ac -screen 0 1280x1024x16"
# sleep 5
# export DISPLAY=:1.0
echo "Downloading version $ARD_VER of the Arduino IDE..."
wget http://downloads.arduino.cc/arduino-$ARD_VER-linux64.tar.xz
echo "Extracting the Arduino IDE..."
tar xf arduino-$ARD_VER-linux64.tar.xz

ln -s $PWD arduino-$ARD_VER/libraries/GUIslice 

./arduino-$ARD_VER/arduino --install-library "Adafruit GFX Library,Adafruit ILI9341,Adafruit STMPE610,Adafruit BusIO"

# echo "Moving Arduino IDE..."
# sudo mv arduino-$ARD_VER /usr/local/share/arduino
# echo "Linking Arduino IDE..."
# sudo ln -s /usr/local/share/arduino/arduino /usr/local/bin/arduino
# echo "Removing Arduino IDE ver $ARD_VER tar that was downloaded..."
rm arduino-$ARD_VER-linux64.tar.xz

echo "=== TESTCASE 1 UNO + Display + NoTouch + FLASH"
# Select config
GUISLICE_CONFIG="ard-adagfx-ili9341-notouch.h"
echo "Selecting config=[$GUISLICE_CONFIG]"
mv $PWD/src/GUIslice_config.h $PWD/src/GUIslice_config.h.bak
sed "s/^.*my-config.*/#include \"..\/configs\/$GUISLICE_CONFIG\" \/\/ my-config/" $PWD/src/GUIslice_config.h.bak > $PWD/src/GUIslice_config.h
# Run the regression
./arduino-$ARD_VER/arduino --pref build.path=. --verbose-build --verify --board arduino:avr:uno $PWD/examples/arduino_min/ex07_ardmin_slider/ex07_ardmin_slider.ino
