{ config, lib, pkgs, ... }:
{

  hardware = {
    # Enable bluetooth
    bluetooth.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nissi = {
    isNormalUser = true;
    description = "Nissi Jacobson";
    extraGroups = [ "networkmanager" "wheel" "plugdev" "disk" "storage" "video" ];
    packages = with pkgs; [
    ];
  };

}
