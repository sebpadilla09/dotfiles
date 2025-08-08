# Install nixos steps
- Get minimal iso image
- Set root previlege `sudo -i`

## Activate networking using wpa_supplicant
- systemctl start wpa_supplicant
- wpa_cli

## Partitioning and formatting

NixOS ships with parted, fdisk, gdisk,  cfdisk and cgdisk, in my case I prefere use parted, fdisk or gdisk. let's use gdisk...

### Create partitions
- know devices: `lsblk`
- init gdisk: `gdisk /dev/volumeName` 
- create a gpt (GUID partition table): option o
- create EFI partition: option n, default, +1G, ef00 (code for EFI partition)
- create LVM partition: option n, default, default, 8e00 (code for LVM partition)
- Write changes: option w

### Create logical volumes

- create physical volume: `pvcreate /dev/LVMPartitionName` (Reference to LVM partition created in previos step)
- create volume group: `vgcreate groupName /dev/LVMPartitionName`
- create logical volume for root: `lvcreate --size sizeG,M --name root groupName`

### Format partitions
