{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.tungvt = {
    initialHashedPassword = "$y$j9T$vr/a36U9Nk/PCpeKC.Mq7.$RK/ar/HsGLPdq/biIZ1WtW2qNVlmpfuZ2mXHXW2G33C";
    isNormalUser = true;
    description = "tungvt";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDq5WpP1+pmXtarA5gCUHQGl4pJMNpeT2zAvMYW3CtiH8dTaQ/+yxAsDp1DdYmD7F4QAH71s0nv9GzfuktSnQYz0lESOMgVOEWrYj1Vrwx3m0bWnk+6xfsdYLcNoihjWxIhPZkX/Y2ayy46bRbxZoOA8RB5AEtGrLYeVHuz3bCn1pV6gJEKgPwLoib0Yw/wGRopFl/BkBMXz6fZnEZZOypsCx/rKlYc19QHY/yU4TKtdtBC4cec/ieelqgPyusF5lQGG9iWexyLDHgM5B1ukgCzR0dJ3bLyKqzE2GFYwLvgsvdjhF3VRoMrxSSNtkdLe70WRQehdpI086Yaaz/kXLV20sRNp0/5gplyLAXpBQmotugwqjXqWuwWR1KJcvRIE3/fkJ7yFIkH/HTMJe1sACtA4nPy2T7VMGtuUHbeQQv0odjTvsBXDssRH0z0W01R7vfNeWJE7iKyVHd9gz5rL/V5oHxSf9/Kmk/49wm1K3ipF8CyGC/Esb0ftNGWbuWoH10= SilverKnightKMA@github/119388144 # ssh-import-id gh:SilverKnightKMA"
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.tungvt =
    import ../../../home/tungvt/${config.networking.hostName}.nix;
}