# nix-cfg

Create hw profile: 
``` bash
sudo nix run github:nix-community/nixos-anywhere -- --flake '.#vm' --generate-hardware-config nixos-generate-config ./hosts/vm/hardware-configuration.nix nixos@192.168.10.181
```

Install: 
``` bash
nix run github:nix-community/nixos-anywhere -- --flake '.#vm' nixos@192.168.10.181
```