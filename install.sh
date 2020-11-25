#!/bin/bash

echo "Welcome to the Raspberry Pi wireless bridge setup!"
echo
echo

echo "Installing Ansible"
sudo apt-get update
sudo apt-get -y install ansible
echo
echo

echo "Now we need some configuration details for your bridge"
echo

read -e -p "Hostname for the Pi: " -i "bridge" hostname

read -e -p "WiFi country code: " -i "AU" counry_code

read -e -p "ssid for your bridge: " -i "home_bridge" ssid_name

read -e -sp "WiFi password for your bridge: " wpa_passphrase
echo

read -e -p "WiFi mode [a,b,g]: " -i "g" wifi_mode

read -e -p "WiFi channel: " -i "11" wifi_channel

echo

echo "****************************"
echo "Configuration values:"
echo "Hostname: $hostname"
echo "Country code: $counry_code"
echo "Bridge ssid: $ssid_name"
echo "Bridge WiFi password: ********"
echo "WiFi mode: $wifi_mode"
echo "WiFi channel: $wifi_channel"
echo "****************************"
echo

read -e -p "Looks good, start the install? [Y/N]: " -i "N" install
if [ "$install" = "Y" or "$install" = "y" ]; then
  echo "starting..."
  echo
else
  echo "exit"
  exit 0
fi

ansible-playbook -u pi \
    -e "hostname=$hostname" \
    -e "wpa_passphrase=$wpa_passphrase" \
    -e "counry_code=$country_code" \
    -e "ssid_name=$ssid_name" \
    -e "wifi_mode=$wifi_mode" \
    -e "wifi_channel=$wifi_channel" \
    -i ansible/hosts \
    ansible/playbook.yml
