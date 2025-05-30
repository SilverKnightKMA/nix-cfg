{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              partlabel = "ESP";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
              partlabel = "root";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
            swap = {
              size = "16G"; # hoặc dung lượng RAM thực tế
              partlabel = "swap";
              content = {
                type = "swap";
              };
            };
          };
        };
      };
    };
  };
}
