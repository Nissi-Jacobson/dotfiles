{ ... }: {
  # OR Home Manager configuration (preferred approach)
  programs.waybar = {
    enable = true;
    
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        
        # Module configuration
        modules-left = [ "hyprland/workspaces" "cpu" "memory" "temperature" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ 
          "tray" 
          "network" 
          #"backlight"
          "pulseaudio" 
          "battery"
        ];

        # Hyprland workspaces
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
            urgent = " ";
            focused = " ";
            default = " ";
          };
        };

        # Window title
        "hyprland/window" = {
          format = "{}";
          max-length = 50;
          separate-outputs = true;
        };

        # System tray
        tray = {
          icon-size = 21;
          spacing = 10;
        };

        # Clock
        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%d-%m-%Y}";
          #format = "{:%H:%M}";
          format = "{:%I:%M %p}";
        };

        # CPU
        cpu = {
          format = " {usage}%";
          tooltip = false;
        };

        # Memory
        memory = {
          format = " {}%";
        };

        # Temperature
        temperature = {
          thermal-zone = 2;
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          format-critical = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
        };

        # Battery
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        # Audio
        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon}󰂯 {format_source}";
          format-bluetooth-muted = "󰝟 {icon}󰂯 {format_source}";
          format-muted = "󰝟 {format_source}";
          format-source = "{volume}% 󰍬 ";
          format-source-muted = "󰍭 ";
          format-icons = {
            headphone = "󰋋 ";
            hands-free = " ";
            headset = "󰋎 ";
            phone = " ";
            portable = "󱄟 ";
            car = " ";
            default = [" " "󱄠 " " "];
            microphone = " ";
          };
          on-click = "pavucontrol";
        };

        # Network
        network = {
          format-wifi = " {signalStrength}%";
          format-ethernet = " {ipaddr}/{cidr}";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        # BackLight
        backlight = {
          device = "amdgpu_bl2"; # Change this to your actual device name
          format = "{percentage}% {icon} {format_icons}";
          format-icons = [" 󰃚 " " 󰃛 " " 󰃜 " " 󰃝 " " 󰃞 " " 󰃟 " " 󰃠 "];
          on-scroll-up = "brightnessctl set 1%+";
          on-scroll-down = "brightnessctl set 1%-";
        };
      };
    };


    # Waybar styling with 0xProto Nerd Font and transparency
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "0xProto Nerd Font Mono, JetBrains Mono Nerd Font" ;
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background-color: transparent; 
        color: #ffffff;
        margin-top: 2px;
        transition-property: background-color;
        transition-duration: .5s;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #ffffff;
      }

      #workspaces button:hover {
        background: transparent;
        box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button.active {
        background-color: transparent;
        border-bottom: 3px solid #ffffff;
      }

      #workspaces button.urgent {
        background-color: #eb4d4b;
      }

      #mode {
        background-color: #64727D;
        border-bottom: 3px solid #ffffff;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #mpd {
        padding: 0 10px;
        color: #ffffff;
        background-color: rgba(0, 0, 0, 0.2);
        margin: 3px 3px;
        border-radius: 5px;
      }

      #window,
      #workspaces {
        margin: 0 4px;
      }

      .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
      }

      .modules-right > widget:last-child > #workspaces {
        margin-right: 0;
      }

      #clock {
        background-color: rgba(29, 32, 33, 0.6);
        color: #ffffff;
        font-weight: bold;
      }

      #battery {
        background-color: rgba(255, 255, 255, 0.1);
        color: #ffffff;
      }

      #battery.charging, #battery.plugged {
        color: #ffffff;
        background-color: rgba(38, 162, 105, 0.6);
      }

      @keyframes blink {
        to {
          background-color: rgba(255, 255, 255, 0.6);
          color: #000000;
        }
      }

      #battery.critical:not(.charging) {
        background-color: rgba(235, 77, 75, 0.6);
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      label:focus {
        background-color: #000000;
      }

      #cpu {
        background-color: rgba(46, 134, 193, 0.6);
        color: #ffffff;
      }

      #memory {
        background-color: rgba(155, 89, 182, 0.6);
      }

      #disk {
        background-color: rgba(241, 196, 15, 0.6);
      }

      #backlight {
        background-color: rgba(144, 190, 109, 0.6);
      }

      #network {
        background-color: rgba(52, 152, 219, 0.6);
      }

      #network.disconnected {
        background-color: rgba(231, 76, 60, 0.6);
      }

      #pulseaudio {
        background-color: rgba(241, 196, 15, 0.6);
        color: #000000;
      }

      #pulseaudio.muted {
        background-color: rgba(149, 165, 166, 0.6);
        color: #ffffff;
      }

      #temperature {
        background-color: rgba(46, 204, 113, 0.6);
      }

      #temperature.critical {
        background-color: rgba(231, 76, 60, 0.6);
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: rgba(231, 76, 60, 0.6);
      }

      #idle_inhibitor {
        background-color: rgba(33, 47, 60, 0.6);
      }

      #idle_inhibitor.activated {
        background-color: rgba(236, 240, 241, 0.6);
        color: #2d3436;
      }

      #mpd {
        background-color: rgba(102, 217, 239, 0.6);
        color: #2a5c45;
      }

      #mpd.disconnected {
        background-color: rgba(244, 67, 54, 0.6);
      }

      #mpd.stopped {
        background-color: rgba(149, 165, 166, 0.6);
      }

      #mpd.paused {
        background-color: rgba(81, 132, 148, 0.6);
      }

      #language {
        background: rgba(0, 123, 255, 0.6);
        color: #740864;
        padding: 0 5px;
        margin: 0 5px;
        min-width: 16px;
      }

      #keyboard-state {
        background: rgba(151, 220, 0, 0.6);
        color: #26A65B;
        padding: 0 0px;
        margin: 0 5px;
        min-width: 16px;
      }

      #keyboard-state > label {
        padding: 0 5px;
      }

      #keyboard-state > label.locked {
        background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad {
        background: rgba(0, 123, 255, 0.2);
      }

      #scratchpad.empty {
        background-color: transparent;
      }
    '';
  };

}

