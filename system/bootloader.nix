{ config, lib, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-e00484b7-da1d-4f30-b2f0-7c5019584e53".device = "/dev/disk/by-uuid/e00484b7-da1d-4f30-b2f0-7c5019584e53";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.



}
