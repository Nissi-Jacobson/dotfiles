{ config, pkgs, lib, ... }:

{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock(L)";
        action = "swaylock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate(H)";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout(E)";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown(S)";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend(U)";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot(R)";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
    
    style = with config.lib.stylix.colors; ''
      * {
          background-image: none;
          box-shadow: none;
          font-family: "${config.stylix.fonts.sansSerif.name}";
          font-size: ${toString config.stylix.fonts.sizes.applications}px;
      }
      
      window {
          background-color: rgba(${base00-rgb-r}, ${base00-rgb-g}, ${base00-rgb-b}, 0.9);
      }
      
      button {
          color: #${base05};
          background-color: #${base01};
          border-style: solid;
          border-width: 2px;
          border-color: #${base02};
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
          border-radius: 10px;
          margin: 5px;
          min-width: 120px;
          min-height: 120px;
      }
      
      button:focus, button:active, button:hover {
          background-color: #${base0D};
          border-color: #${base0C};
          color: #${base00};
          outline-style: none;
      }
      
      #lock {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
      }
      
      #logout {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
      }
      
      #suspend {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"));
      }
      
      #hibernate {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png"));
      }
      
      #shutdown {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
      }
      
      #reboot {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
      }
    '';
  };

}
