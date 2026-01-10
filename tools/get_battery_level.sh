########
# Function to get battery level from all parts of a device
# 
# Run directly with the BLE device name as a parameter, 
# or source the file to add the function get_battery_level
# to your scope (can be added to .bashrc, .zshrc or other)
# 
# example (direct usage):
# ----
# ./get_battery_level.sh MyKeyboard
# ----
# 
# example (sourcing usage):
# ----
# . get_battery_level.sh
# get_battery_level MyKeyboard
# ----
########
# Dependancies (unknown version requirements): Python, pydbus, bluez
########
# Authors: namori
########
# License: MIT License
#
# Copyright (c) 2026 namori
########

get_battery_level() {
local dev_name=$@

local battery_service_uuid="0000180f-0000-1000-8000-00805f9b34fb"
local battery_level_uuid="00002a19-0000-1000-8000-00805f9b34fb"
local battery_descriptor_uuid="00002901-0000-1000-8000-00805f9b34fb"

python << EOF
dev_name='$dev_name'

battery_service_uuid='$battery_service_uuid'
battery_level_uuid='$battery_level_uuid'
battery_descriptor_uuid='$battery_descriptor_uuid'

import pydbus

bus = pydbus.SystemBus()
obj_mngr = bus.get('org.bluez', '/')

mngd_objs = obj_mngr.GetManagedObjects()

named_and_paired_devs = {path: interfaces 
    for (path, interfaces) in mngd_objs.items() 
    if 'org.bluez.Device1' in interfaces
    and 'Name' in interfaces['org.bluez.Device1']
    and interfaces['org.bluez.Device1']['Name'] == dev_name
    and 'Paired' in interfaces['org.bluez.Device1']
    and interfaces['org.bluez.Device1']['Paired']}

if len(named_and_paired_devs) != 1:
    raise Exception("Please verify the device name (as seen by BLE) and that it is correctly paired.")

dev = named_and_paired_devs.popitem()
if not 'Connected' in dev[1]['org.bluez.Device1'] \
    or not dev[1]['org.bluez.Device1']['Connected']:
    raise Exception("The device is not connected. Please connect it to check the battery level.")

kb_objs = {path: interfaces 
    for (path, interfaces) in mngd_objs.items() 
    if path.startswith(dev[0])}

battery_levels = [{"path":path}  
    for (path, interfaces) in kb_objs.items()
    if 'org.bluez.GattCharacteristic1' in interfaces
    and 'UUID' in interfaces['org.bluez.GattCharacteristic1']
    and interfaces['org.bluez.GattCharacteristic1']['UUID'] == battery_level_uuid]

# Get description for battery level bus, if present (else '?')
for battery in battery_levels:
    battery_level_descr_paths = [path
        for (path, interfaces) in mngd_objs.items() 
        if path.startswith(battery["path"]) 
        and 'org.bluez.GattDescriptor1' in interfaces
        and 'UUID' in interfaces['org.bluez.GattDescriptor1']
        and interfaces['org.bluez.GattDescriptor1']['UUID'] == battery_descriptor_uuid]
    if battery_level_descr_paths:
        battery_descr_mngr = bus.get('org.bluez', battery_level_descr_paths[0])
        battery["Description"] = ''.join(map(chr, battery_descr_mngr.ReadValue({})))
    else:
        battery["Description"] = "?"
    battery_mngr = bus.get('org.bluez', battery["path"])
    values = battery_mngr.ReadValue({})
    if values:
        battery['Value'] = f"{values[0]} %"
    else:
        battery['Value'] = "?"


print(f"{'Description':<20} Level")
print(26*"-")

for battery_level in battery_levels:
    print(f"{battery_level["Description"]:<20} {str(battery_level['Value'])}")

EOF
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
    get_battery_level $@
else
    echo "Script is sourced. You can nom run 'get_battery_level <deviceName>'."
fi



