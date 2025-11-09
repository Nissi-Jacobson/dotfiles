{ config, ... }:
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
          format-critical = "󰸁 {temperatureC}°C";
          format = "󰔏 {temperatureC}°";
          format-icons = ["󰜗" "󰔏" "󰸁"];
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
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        network = {
          format-wifi = "󰤨 {signalStrength}%";
          format-ethernet = "󰈀 Connected";
          tooltip-format = "{ifname}: {ipaddr}";
          format-linked = "󰈀 No IP";
          format-disconnected = "󰤭 Disconnected";
          format-alt = "󰩟 {ipaddr}/{cidr}";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon}󰂯 {volume}%";
          format-bluetooth-muted = "󰟎󰂯";
          format-muted = "󰟎";
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
            activated = "󰒳";
            deactivated = "󰒲";
          };
        };

        tray = {
          icon-size = 16;
          spacing = 4;
        };

        "custom/power" = {
          format = "{}⏻";
          tooltip = false;
          on-click = "wlogout";
        };
      };
    };

    style = with config.lib.stylix.colors.withHashtag; ''
      * {
        font-family: "${config.stylix.fonts.monospace.name}";
        font-size: 11px;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
        color: ${base05};
      }

      tooltip {
        background: ${base00};
        border: 1px solid ${base0D};
        border-radius: 4px;
        color: ${base05};
      }

      #workspaces {
        background: ${base01};
        border-radius: 8px;
        margin: 2px;
        padding: 0px 4px;
        border: 1px solid ${base03};
      }

      #workspaces button {
        background: transparent;
        color: ${base0D};
        border-radius: 6px;
        padding: 2px 6px;
        margin: 1px;
        border: none;
        transition: all 0.3s ease-in-out;
      }

      #workspaces button:hover {
        background: ${base03};
        color: ${base05};
      }

      #workspaces button.active {
        background: ${base0D};
        color: ${base00};
      }

      #workspaces button.urgent {
        background: ${base08};
        color: ${base00};
      }

      #mode {
        background: ${base08};
        color: ${base00};
        border-radius: 8px;
        margin: 2px;
        padding: 0px 6px;
        border: 1px solid ${base08};
      }

      #window {
        background: ${base01};
        border-radius: 8px;
        margin: 2px;
        padding: 0px 8px;
        border: 1px solid ${base03};
        color: ${base05};
      }

      #clock {
        background: ${base01};
        border-radius: 8px;
        margin: 2px;
        padding: 0px 8px;
        border: 1px solid ${base03};
        color: ${base05};
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
        background: ${base01};
        border-radius: 8px;
        margin: 2px;
        padding: 0px 6px;
        border: 1px solid ${base03};
        color: ${base05};
      }

      #cpu {
        color: ${base0B};
      }

      #memory {
        color: ${base0A};
      }

      #temperature {
        color: ${base09};
      }

      #temperature.critical {
        color: ${base08};
        border-color: ${base08};
      }

      #battery {
        color: ${base0B};
      }

      #battery.charging {
        color: ${base0A};
      }

      #battery.warning:not(.charging) {
        color: ${base0A};
        border-color: ${base0A};
      }

      #battery.critical:not(.charging) {
        color: ${base08};
        border-color: ${base08};
      }

      #network {
        color: ${base0D};
      }

      #network.disconnected {
        color: ${base08};
        border-color: ${base08};
      }

      #pulseaudio {
        color: ${base0E};
      }

      #pulseaudio.muted {
        color: ${base03};
      }

      #idle_inhibitor {
        color: ${base0A};
      }

      #idle_inhibitor.activated {
        color: ${base08};
        border-color: ${base08};
      }

      #tray {
        color: ${base05};
      }

      #custom-power {
        background: transparent;
        color: ${base00};
        border-radius: 8px;
        margin: 2px;
        padding: 0px 6px;
        border: 1px solid ${base03};
        font-size: 12px;
      }

      #custom-power:hover {
        background: ${base08};
        transition: all 0.3s ease-in-out;
      }
    '';
  };
}
