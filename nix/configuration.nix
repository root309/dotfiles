{ config, pkgs, ... }:
{
  imports = [
    ./modules/boot.nix
    ./modules/fonts.nix
    ./modules/hardware.nix
    ./modules/i18n.nix
    ./modules/networking.nix
    ./modules/services.nix
    ./modules/sound.nix
    ./modules/system.nix
    ./modules/time.nix
    ./modules/users.nix
    ./modules/virtualisation.nix
    ./modules/xremap.nix
  ];
}

