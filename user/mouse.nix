{ pkgs, ... }:{
  home.packages = with pkgs; [
    xbindkeys
    xdotool
    libnotify
  ];
  
  systemd.user.services.mouse-profile-manager = {
    Unit = {
      Description = "Mouse Profile Manager";
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "/home/nissi/.local/bin/mouse-profile-manager start";
      RemainAfterExit = true;
    };
    Install.WantedBy = [ "default.target" ];
  };
}
