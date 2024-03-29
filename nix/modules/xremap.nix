{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.xremap.nixosModules.default
  ];

  services.xremap = {
    userName = "yuki";
    serviceMode = "system";
    config = {
      modmap = [ { name = "CapsLock is dead"; remap = { CapsLock = "Ctrl_L"; }; } ];
      keymap = [
        {
          name = "Ctrl+H should be enabled on all apps as BackSpace";
          remap = { C-h = "Backspace"; };
          application = { not = ["Alacritty" "Kitty" "Wezterm"]; };
        }
      ];
    };
  };
}

