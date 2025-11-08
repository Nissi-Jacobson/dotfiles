# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ../stylix/stylix-system.nix
      ./locale.nix
      ./services.nix
      ./programs.nix
      ./virtualization.nix
      ./user_config.nix
      ./bootloader.nix
      ./misc.nix
    ];
}
