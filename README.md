# adbwifi
This is a Batch script that can automate the process of connecting an android device with PC (adb over Wi-Fi)

## 

## How tho use ✅
* Download the `adbwifi.bat` file and save it into `C:\Windows` folder.
* Now you can run `adbwifi` command from anywhere.
* After you run that command, Device IP will be shown. 
* Then press Enter to connect with that device.

![Demo](/demo.gif)

## Important things 🟨
* Please make sure `Developer Options` is turned ON in the device. (To turn ON click on the `Build Number` several time)
* Make sure you turned on the `USB Debugging` from the `Developer option`
* Make sure android device and the PC is connected in a same Wi-Fi network.
* Make sure android divice and the PC is connected via a USB cable.
* Make sure you allowed `USB Debugging` in the popup.

## The old boring method ❌
The usual procedure to set up a wireless adb connection has to many steps:

* Set up an tcpip port using following command
  ```bash
  adb tcpip 5555
  ```
* Look up the IP address of your android device using this following command
  ```bash
  adb shell ip addr show wlan0
  ```
* enable an wireless connection with 
  ```bash
  adb connect <ip address>:5555
  ````
