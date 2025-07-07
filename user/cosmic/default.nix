{ config, cosmic-manager, ... }:
{
  imports = [
    #./inputs.nix
    #./window-management.nix
    ./example.nix
  ];

  #services.cosmic-manager = {
  #  enable = true;
  #};
}
