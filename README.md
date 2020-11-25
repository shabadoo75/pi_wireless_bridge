# Raspberry Pi wireless bridge

Use a Raspberry Pi as a WiFi bridge! I wired up my house so rooms that are a long way from the WiFi router can still get decent internet. Problem is some devices like Google Chromecast and the Nintendo Switch are wireless only. By connecting a Raspberry Pi to wired ethernet then using it as a WiFi bridge these devices get a strong signal.

All this does is automate the steps from the excellent guide at https://www.raspberrypi.org/documentation/configuration/wireless/access-point-bridged.md

## Installation

ssh to the pi you want to use as the bridge

download the code 
```
curl -L -O https://github.com/shabadoo75/pi_wireless_bridge/archive/main.zip
```

unzip
```
unzip main.zip
```

install
```
cd pi_wireless_bridge-main
./install.sh
```

install latest PiOS lite
connect cable and keyboard
login as pi user
change password
