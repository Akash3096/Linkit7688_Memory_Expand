opkg update
echo "Packages Updated"
opkg install block-mount kmod-fs-ext4 kmod-usb-storage-extras e2fsprogs fdisk
echo "Installed necessary tools"
mkfs.ext4 /dev/mmcblk0p1
echo "Formatted the Ext SD card"
mount /dev/mmcblk0p1 /mnt
tar -C /overlay -cvf - . | tar -C /mnt -xf -
umount /mnt
block detect > /etc/config/fstab
echo "config 'mount'"  
echo "option  target  '/overlay'" 
echo "..."  
echo "option  enabled '1'"
vi /etc/config/fstab
