{ config, pkgs, ... }:

{
  home.packages = with pkgs [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.user-themes
    gnomeExtensions.caffeine
    gnomeExtensions.just-perfection
    gnomeExtensions.clipboard-history
    gnomeExtensions.extension-list
    gnomeExtensions.gnome-40-ui-improvements
    gnomeExtensions.appindicator
    gnomeExtensions.gsconnect
    gnomeExtensions.hide-top-bar
    gnomeExtensions.status-area-horizontal-spacing
    _0xproto
  ];

  # gnome customization
  dconf = {
      enable = true;
      settings = {
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = [
          "appindicatorsupport@rgcjonas.gmail.com"
          "blur-my-shell@aunetx"
          "caffeine@patapon.info"
          "clipboard-history@alexsaveau.dev"
          "extension-list@tu.berry"
          #"gnome-ui-tune@itstime.tech"
          "gsconnect@andyholmes.github.io"
          "hidetopbar@mathieu.bidon.ca"
          "just-perfection-desktop@just-perfection"
          "status-area-horizontal-spacing@mathematical.coffee.gmail.com"
          #"transparent-top-bar@zhanghai.me"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          ];
        };
        "org/gnome/desktop/interface" = {
          #show-battery-percentage = true;
          color-scheme = "prefer-dark";
          cursor-size = 24;
          cursor-theme = "Adwaita";
          enable-animations = true;
          enable-hot-corners = true;
          font-name = "0xProto, 12";
          monospace-font-name = "0xProto 12";
          #gtk-theme = "Adwaita";
          scaling-factor = 1;
          text-scaling-factor = 1;
        };
        "org/gnome/desktop/sound" = {
          allow-volume-above-100-percent = true;
          event-sounds = false;
        };
        "org/gnome/desktop/vm/preferences" = {
          focus-mode = "sloppy";
        };
        "org/gnome/mutter" = {
          center-new-windows = true;
          dynamic-workspaces = true;
        };
        "org/gnome/nautilus/preferences" = {
          default-folder-viewer = "list-view";
          migrated-gtk-settings = true;
          recursive-search = "always";
          searh-filter-time-type = "last-modified";
          show-delete-permanently = true;
          show-directory-item-count = "always";
          show-image-thumbnails = "always";
        };
        "org/gnome/shell/extensions/blur-my-shell/hidetopbar".compatibility = true;
        "org/gnome/shell/extensions/blur-my-shell/panel".static-blur = false;
        "org/gnome/shell/extensions/blur-my-shell/applications" = {
          blur = true;
          blur-on-overview = true;
          enable-all = true;
        };
        #"org/gnome/shell/extensions/gnome-ui-tune" = {
        #  hide-search = true;
        #  increase-thumbnails-size = "200%";
        #};
        "org/gnome/shell/extensions/status-area-horizontal-spacing".hpadding = 3;
        "org/gnome/shell/extensions/hidetopbar" = {
          enable-active-window = true;
          enable-intellihide = true;
          hot-corner = false;
          mouse-sensitive = true;
          mouse-triggers-overview = false;
          show-in-overview = true;
        };
      };
    };
}
