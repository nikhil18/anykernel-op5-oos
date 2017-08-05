# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# EDIFY properties
kernel.string=Lightning Kernel
do.devicecheck=1
do.initd=1
do.modules=1
do.system_blobs=0
do.cleanup=1
do.ukm=0
device.name1=OnePlus5
device.name2=OnePlus 5
device.name3=oneplus5
device.name4=cheeseburger
device.name5=

# shell variables
block=/dev/block/bootdevice/by-name/boot;
add_seandroidenforce=0
is_slot_device=0;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

## AnyKernel permissions
# set permissions for included ramdisk files
chmod -R 755 $ramdisk

## AnyKernel install
dump_boot;

# begin ramdisk changes

# Start ramdisk changes
backup_file init.qcom.rc;
insert_line init.qcom.rc "init.lk.rc" after "import init.qcom.test.rc" "import init.lk.rc";
insert_line init.qcom.rc "init.spectrum.rc" after "import init.lk.rc" "import init.spectrum.rc";

### DEBUGGING ONLY!!!! ###
# backup_file default.prop
# replace_line default.prop "ro.debuggable=0" "ro.debuggable=1";
# replace_line default.prop "ro.adb.secure=1" "ro.adb.secure=0";
# replace_line default.prop "ro.secure=1" "ro.secure=0";
### DEBUGGING ONLY!!!! ###

# end ramdisk changes

write_boot;

## end install

