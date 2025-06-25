# NixOS configuration for Wayland Mouse Profile Manager
# Add this to your configuration.nix or separate mouse.nix file

{ config, pkgs, ... }:

{
  # Required packages for Wayland mouse profile management
  environment.systemPackages = with pkgs; [
    # Core tools for Wayland input handling
    libinput-gestures    # For capturing mouse button events on Wayland
    wtype               # Wayland equivalent of xdotool for sending keys
    ydotool             # Alternative input tool for Wayland
    libnotify           # For notifications
    
    # Debugging and setup tools
    libinput            # For device detection and debugging
    evtest              # For testing input events
    
    # Optional: Advanced input tools
    wev                 # Wayland event viewer (like xev for X11)
  ];

  # Enable libinput for better mouse/touchpad support
  services.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";  # or "adaptive" based on preference
      middleEmulation = false;
    };
  };

#  # For Hyprland users
#  programs.hyprland = {
#    enable = true;
#    xwayland.enable = true;  # Still useful for some applications
#  };

#  # For GNOME on Wayland
#  services.xserver = {
#    enable = true;
#    displayManager.gdm = {
#      enable = true;
#      wayland = true;  # Ensure Wayland is enabled
#    };
#    desktopManager.gnome.enable = true;
#  };

  # Enable udev rules for input devices
  services.udev.extraRules = ''
    # Allow users in input group to access input devices
    KERNEL=="event[0-9]*", SUBSYSTEM=="input", MODE="0664", GROUP="input"
    
    # Specific rule for mouse devices
    SUBSYSTEM=="input", ATTRS{name}=="*mouse*", MODE="0664", GROUP="input"
    SUBSYSTEM=="input", ATTRS{name}=="*Mouse*", MODE="0664", GROUP="input"
    
    # Zebronics mouse specific rule (adjust vendor/product ID as needed)
    # Find your mouse ID with: lsusb | grep -i zebronics
    # SUBSYSTEM=="usb", ATTRS{idVendor}=="XXXX", ATTRS{idProduct}=="XXXX", MODE="0666"
  '';

  # Ensure users are in required groups
  users.users.nissi = {
    extraGroups = [ 
      "input"     # Required for libinput-gestures
      "wheel"     # General admin access
    ];
  };

  # Security wrapper for ydotool (needed for system-wide key sending)
  security.wrappers.ydotool = {
    owner = "root";
    group = "input";
    permissions = "u+s,g+x";
    source = "${pkgs.ydotool}/bin/ydotool";
  };

  # Systemd service for ydotoold daemon (required for ydotool)
  systemd.services.ydotoold = {
    description = "Ydotool daemon";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      ExecStart = "${pkgs.ydotool}/bin/ydotoold";
      User = "root";
      Group = "input";
    };
  };

  # User service for mouse profile manager
  systemd.user.services.mouse-profile-manager = {
    enable = true;
    description = "Wayland Mouse Profile Manager";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.bash}/bin/bash -c 'sleep 10 && /home/YOUR_USERNAME/.local/bin/mouse-profile-manager setup'";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };

  # Home-manager integration (if you use home-manager)
  # Uncomment and adjust the following section:
  
  # home-manager.users.YOUR_USERNAME = {
  #   home.packages = with pkgs; [
  #     libinput-gestures
  #     wtype
  #     ydotool
  #     libnotify
  #     wev
  #   ];
  #   
  #   # Autostart libinput-gestures
  #   systemd.user.services.libinput-gestures = {
  #     Unit = {
  #       Description = "Libinput Gestures";
  #       After = [ "graphical-session.target" ];
  #     };
  #     Service = {
  #       Type = "simple"; 
  #       ExecStart = "${pkgs.libinput-gestures}/bin/libinput-gestures";
  #       Restart = "on-failure";
  #       RestartSec = "5s";
  #     };
  #     Install.WantedBy = [ "default.target" ];
  #   };
  #   
  #   # Mouse profile manager service
  #   systemd.user.services.mouse-profile-manager = {
  #     Unit = {
  #       Description = "Mouse Profile Manager";
  #       After = [ "libinput-gestures.service" ];
  #     };
  #     Service = {
  #       Type = "oneshot";
  #       ExecStart = "/home/YOUR_USERNAME/.local/bin/mouse-profile-manager setup";
  #       RemainAfterExit = true;
  #     };
  #     Install.WantedBy = [ "default.target" ];
  #   };
  # };

  # Environment variables for Wayland
  environment.sessionVariables = {
    # Ensure applications use Wayland when possible
    NIXOS_OZONE_WL = "1";  # For Electron apps
    MOZ_ENABLE_WAYLAND = "1";  # For Firefox
    
    # XDG settings
    XDG_SESSION_TYPE = "wayland";
  };

  # Optional: Polkit rules for input device access
  security.polkit.extraConfig = ''
    // Allow users in input group to access input devices without password
    polkit.addRule(function(action, subject) {
        if ((action.id == "org.freedesktop.libinput-gestures") &&
            subject.isInGroup("input")) {
            return polkit.Result.YES;
        }
    });
  '';

  # Font and theme settings for consistent UI across DEs
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    font-awesome
  ];

  # Enable flatpak for additional app compatibility
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;  # For wlroots-based compositors like Hyprland
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
}
