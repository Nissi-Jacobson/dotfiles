{ config, cosmic-manager, ... }:
{
  imports = [
    ./inputs.nix
    ./window-management.nix
  ];

  services.cosmic-manager = {
    enable = true;
  };
}
