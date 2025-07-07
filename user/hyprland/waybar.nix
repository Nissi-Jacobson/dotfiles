{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;
        spacing = 2;
        margin-top = 2;
        margin-bottom = 0;
        margin-left = 4;
        margin-right = 4;
        
        modules-left = [
          "hyprland/workspaces"
          "hyprland/mode"
          "hyprland/window"
        ];
        
        modules-center = [
          "clock"
        ];
        
        modules-right = [
          "tray"
          #"idle_inhibitor"
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "temperature"
          "battery"
          "custom/power"
        ];

        # Module configurations
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
            urgent = "●";
            focused = "●";
            default = "○";
          };
        };

        "hyprland/window" = {
          format = "󰈈 {}";
          max-length = 40;
          separate-outputs = true;
        };

        clock = {
          timezone = "Asia/Kolkata";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "󰥔 {:%H:%M}";
          format-alt = "󰃭 {:%m/%d %H:%M}";
        };

        cpu = {
          format = "󰻠 {usage}%";
          tooltip = true;
          interval = 2;
        };

        memory = {
          format = "󰍛 {}%";
          tooltip-format = "{used:0.1f}G/{total:0.1f}G";
        };

        temperature = {
          critical-threshold = 80;
          format-critical = "󰈸 {temperatureC}°C";
          format = "󰔏 {temperatureC}°";
          format-icons = ["󰜗" "󰔏" "󰈸"];
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰚥 {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        network = {
          format-wifi = "󰤨 {signalStrength}%";
          format-ethernet = "󰈀 Connected";
          tooltip-format = "{ifname}: {ipaddr}";
          format-linked = "󰈀 No IP";
          format-disconnected = "󰤭 Disconnected";
          format-alt = " {ipaddr}/{cidr}";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon}󰂯 {volume}%";
          format-bluetooth-muted = "󰝟󰂯";
          format-muted = "󰝟";
          format-source = "󰍬 {volume}%";
          format-source-muted = "󰍭";
          format-icons = {
            headphone = "󰋋";
            hands-free = "󱡏";
            headset = "󰋎";
            phone = "󰏲";
            portable = "󰦧";
            car = "󰄋";
            default = ["󰕿" "󰖀" "󰕾"];
          };
          on-click = "pavucontrol";
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        tray = {
          icon-size = 16;
          spacing = 4;
        };

        "custom/power" = {
          format = "{icon}⏻";
          tooltip = false;
          on-click = "wlogout";
        };
      };
    };

    style = ''
      * {
        font-family: "0xProto Nerd Font Mono", "JetBrains Mono Nerd Font";
        font-size: 11px;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
        color: #c0caf5;
      }

      tooltip {
        background: #1a1b26;
        border: 1px solid #7aa2f7;
        border-radius: 4px;
        color: #c0caf5;
      }

      #workspaces {
        background: #24283b;
        border-radius: 8px;
        margin: 2px;
        padding: 0px 4px;
        border: 1px solid #414868;
      }

      #workspaces button {
        background: transparent;
        color: #7aa2f7;
        border-radius: 6px;
        padding: 2px 6px;
        margin: 1px;
        border: none;
        transition: all 0.3s ease-in-out;
      }

      #workspaces button:hover {
        background: #414868;
        color: #c0caf5;
      }

      #workspaces button.active {
        background: #7aa2f7;
        color: #1a1b26;
      }

      #workspaces button.urgent {
        background: #f7768e;
        color: #1a1b26;
      }

      #mode {
        background: #f7768e;
        color: #1a1b26;
        border-radius: 8px;
        margin: 2px;
        padding: 0px 6px;
        border: 1px solid #f7768e;
      }

      #window {
        background: #24283b;
        border-radius: 8px;
        margin: 2px;
        padding: 0px 8px;
        border: 1px solid #414868;
        color: #c0caf5;
      }

      #clock {
        background: #24283b;
        border-radius: 8px;
        margin: 2px;
        padding: 0px 8px;
        border: 1px solid #414868;
        color: #c0caf5;
        font-weight: bold;
      }

      #cpu,
      #memory,
      #temperature,
      #battery,
      #network,
      #pulseaudio,
      #tray,
      #idle_inhibitor {
        background: #24283b;
        border-radius: 8px;
        margin: 2px;
        padding: 0px 6px;
        border: 1px solid #414868;
        color: #c0caf5;
      }

      #cpu {
        color: #9ece6a;
      }

      #memory {
        color: #e0af68;
      }

      #temperature {
        color: #ff9e64;
      }

      #temperature.critical {
        color: #f7768e;
        border-color: #f7768e;
      }

      #battery {
        color: #9ece6a;
      }

      #battery.charging {
        color: #e0af68;
      }

      #battery.warning:not(.charging) {
        color: #e0af68;
        border-color: #e0af68;
      }

      #battery.critical:not(.charging) {
        color: #f7768e;
        border-color: #f7768e;
      }

      #network {
        color: #7aa2f7;
      }

      #network.disconnected {
        color: #f7768e;
        border-color: #f7768e;
      }

      #pulseaudio {
        color: #bb9af7;
      }

      #pulseaudio.muted {
        color: #565f89;
      }

      #idle_inhibitor {
        color: #e0af68;
      }

      #idle_inhibitor.activated {
        color: #f7768e;
        border-color: #f7768e;
      }

      #tray {
        color: #c0caf5;
      }

      #custom-power {
        background: transparent;
        color: #1a1b26;
        border-radius: 8px;
        margin: 2px;
        padding: 0px 6px;
        border: 1px solid #414868;
        font-size: 12px;
      }

      #custom-power:hover {
        background: #ff7a93;
        transition: all 0.3s ease-in-out;
      }
    '';
  };
}
