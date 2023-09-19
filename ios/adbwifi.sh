# Check if ADB is installed
if ! command -v adb &> /dev/null; then
    echo "❌  ADB (Android Debug Bridge) is not installed. Please install it first."
    exit 1
fi

# Get a list of connected devices
connected_devices=$(adb devices | tail -n +2 | cut -f 1)

# Check if no devices are connected
if [ -z "$connected_devices" ]; then
    echo "❌  No devices are connected via ADB."
    exit 1
fi

# Find the first physical device (not an emulator)
first_physical_device=""
for device in $connected_devices; do
    device_type=$(adb -s "$device" shell getprop ro.product.device | tr -d '[:space:]')
    echo "🔰  $device ------> $device_type"
    if [ "$device_type" != "generic" ]; then
        first_physical_device="$device"
        break
    fi
done

# Check if no physical devices were found
if [ -z "$first_physical_device" ]; then
    echo "❌  No physical devices are connected via ADB."
    exit 1
fi

#disconnecting every connected devices
adb disconnect

# Get the device's IP address
device_ip=$(adb -s "$first_physical_device" shell ip -f inet addr show wlan0 | grep -oE 'inet [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | cut -d ' ' -f 2)
echo "🔰  $first_physical_device ============> $device_ip"

# Restart ADB in TCP/IP mode for the selected device
adb -s "$first_physical_device" tcpip 5555

# Disconnect the USB cable for the selected device
#adb -s "$first_physical_device" disconnect


# Check if no physical devices were found
if [ -z "$device_ip" ]; then
    echo "❌  Couldn't get IP address"
    exit 1
fi

# Connect to the selected device wirelessly
adb connect "$device_ip:5555"

#Check if the wireless connection was successful
connected_devices=$(adb devices | tail -n +2)
if [[ $connected_devices == *$device_ip* ]]; then
    echo "✅  Connected to the first physical device ($first_physical_device) wirelessly at IP address $device_ip:5555."
else
    echo "❌  Failed to connect to the first physical device wirelessly."
fi
