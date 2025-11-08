{ config, lib, pkgs, ... }:
{
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

      #videoDrivers = ["nvidia"];
      #hardware.nvidia.modesetting.enable = true;
    };
    # Enable Ly terminal display manager
    displayManager = {
      ly.enable = true;
      #gdm.enable = true;
    };
    # Enable needed desktopManager
    desktopManager = {
      #gnome.enable = true;
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
    # ratbagd.enable = true;
    # input remapper
    # input-remapper.enable = true;
    # tlp
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

        #Optional helps save long term battery health
        START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
        STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

      };

    };
    
    # # Apache - MariaDB - PHP (LAMP)

    # # Apache
    # httpd = {
    #   enable = true;
    #   adminAddr = "admin@example.com";
    #   virtualHosts."localhost" = {
    #     documentRoot = "/var/www/";
    #     # enablePHP = true;
    #   };
    # };

    # MariaDB
    # Enable Sql
    # use mysql_secure_installation to complete installationn
    mysql = {
      enable = true;
      package = pkgs.mariadb;
      #ensureUsers = [
      #  {
      #    name = "root";
      #    password = "6969";  # Change this
      #  }
      #  {
      #    name = "nissi";
      #    password = "6969";
      #  }
      #];
  
      ensureDatabases = [ ];  # You can optionally define initial DBs here
  
      initialScript = pkgs.writeText "mysql-init.sql" ''
        -- Remove anonymous users
        DELETE FROM mysql.user WHERE User = "";
  
        -- Disallow root login remotely
        UPDATE mysql.user SET Host = 'localhost' WHERE User = 'root';
  
        -- Remove test database
        DROP DATABASE IF EXISTS test;
  
        -- Grant root full privileges on everything
        GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;

        -- Reload privilege tables
        FLUSH PRIVILEGES;
      '';
    };

    # # PHP for apache
    # phpfpm.pools.apache = {
    #   user = "wwwrun";
    #   group = "wwwrun";
    # };

    # gnome keyring for passwords
    gnome.gnome-keyring.enable = true;
  };  

}

