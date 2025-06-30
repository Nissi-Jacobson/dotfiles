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
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-e00484b7-da1d-4f30-b2f0-7c5019584e53".device = "/dev/disk/by-uuid/e00484b7-da1d-4f30-b2f0-7c5019584e53";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # experimental features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # All services
  # List services that you want to enable:
  services = {
    xserver = {
      # Enable the X11 windowing system.
      # You can disable this if you're only using the Wayland session.
      enable = true;
      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "colemak";
      };
    };
    # Enable Ly terminal display manager
    displayManager.ly.enable = true;
    #displayManager.gdm.enable = true;
    # Enable needed desktopManager
    desktopManager = {
      #gnome.enable = true;
      #plasma6.enable = true;
      cosmic.enable = true;
    };
    # Enable CUPS to print documents.
    printing.enable = true;
    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;
    # Enable Blueman
    blueman.enable = true;
    # Pulse Audio
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
    # Enable gvfs
    gvfs.enable = true;
    # Enable devmon
    devmon.enable = true;
    # Enalbe udisks
    udisks2.enable = true;
    # ratbagd for piper to configure mouse
    ratbagd.enable = true;
    # input remapper
    input-remapper.enable = true;
  };


  # Comment / Uncomment to toggle 
  programs = {
    direnv.enable = true;
    fish.enable = true;
    nm-applet.enable = true;
    hyprland.enable = true;
    kdeconnect.enable = true;
    # ksshaskpass
    # or for seahorse:
    ssh.askPassword = lib.mkForce "${pkgs.seahorse}/libexec/seahorse/ssh-askpass";
  };

  virtualisation = {
    waydroid.enable = true;
    docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };


  # default shell for all users
  users.defaultUserShell = pkgs.fish;

  # Enable sound with pipewire.
  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nissi = {
    isNormalUser = true;
    description = "Nissi Jacobson";
    extraGroups = [ "networkmanager" "wheel" "plugdev" "disk" "storage" "video" "docker" ];
    packages = with pkgs; [
    ];
  };

  # Enable Font Config
  fonts.fontconfig.enable = true;

  # disabling xterm
  # programs.xterm.enable = false;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
