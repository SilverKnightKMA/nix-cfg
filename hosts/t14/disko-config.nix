# https://jefftp.com/nixos-disko/

{
  disko.devices = {
    disk.sda = {
      type = "disk";
      device = "/dev/nvme0n1";
      content = {
        type = "gpt"; # Initialize the disk with a GPT partition table
        partitions = {
          boot = {
            name = "boot";
            size = "1M";
            type = "EF02";
          };
          ESP = { # Setup the EFI System Partition
            name = "ESP";
            type = "EF00"; # Set the partition type
            size = "1000M"; # Make the partition a gig
            content = {
              type = "filesystem";
              format = "vfat"; # Format it as a FAT32 filesystem
              mountpoint = "/boot"; # Mount it to /boot
            };
          };
          primary = { # Setup the LVM partition
            name = "primary";
            size = "100%"; # Fill up the rest of the drive with it
            content = {
              type = "lvm_pv"; # pvcreate
              vg = "vg1";
            };
          };
        };
      };
    };
    lvm_vg = { # vgcreate
      vg1 = { # /dev/vg1
        type = "lvm_vg";
        lvs = { # lvcreate
          swap = { # Logical Volume = "swap", /dev/vg1/swap
            size = "25G";
            content = {
              type = "swap";
            };
          };
          nix = { # Logical Volume = "nix", /dev/vg1/nix
            size = "100G";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/nix";
              mountOptions = [
                "noatime" # Reduce writes--we don't care about access times
              ];
            };
          };
          root = { # Logical Volume = "root", /dev/vg1/root
            size = "100%FREE"; # Use the remaining space in the Volume Group
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              mountOptions = [
                "defaults"
              ];
            };
          };
        };
      };
    };
  };
}
