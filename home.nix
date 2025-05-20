{ config, pkgs, ... }:

let
  myShellAliases = {
    ll = "ls -l";
    la = "ls -a";
    lal = "ls -al";
    ".." = "cd ..";
  };
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nissi";
  home.homeDirectory = "/home/nissi";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  # home.stateVersion = "25.05"; # Please read the comment before changing.
  home.stateVersion = "24.11"; # edited to be the same with system packages

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
 # gnome shell extensions
  pkgs.gnomeExtensions.blur-my-shell
  pkgs.gnomeExtensions.user-themes
  #pkgs.gnomeExtensions.transparent-top-bar
  pkgs.gnomeExtensions.caffeine
  pkgs.gnomeExtensions.just-perfection
  pkgs.gnomeExtensions.clipboard-history
  pkgs.gnomeExtensions.extension-list
  pkgs.gnomeExtensions.gnome-40-ui-improvements
  pkgs.gnomeExtensions.appindicator
  pkgs.gnomeExtensions.gsconnect
  pkgs.gnomeExtensions.hide-top-bar
  pkgs.gnomeExtensions.status-area-horizontal-spacing
 # end of gnome shells extensions
  pkgs._0xproto
  pkgs.oh-my-zsh
  ];

 # adding dotfiles
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/nissi/dotfiles/nvim";
  
  #  Session Environment Variables -> sessionVariables
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "brave";
    TERMINAL = "kitty";
  };

 # customizations
 
  # ghostty customization
  programs.ghostty = {
    enable = true;
    #clearDefaultKeybinds = true;
    #installVimSyntax = true;
    settings = {
      theme = "tokyonight_night";
      font-family = "0xproto";
      font-size = 10;
      #background-opacity = 0.69;
      #background-blur = true;
      focus-follows-mouse = true;
      quit-after-last-window-closed = true;
    };
  };

  # fish customization
  programs.fish = {
    plugins = [];
    shellAliases = myShellAliases;
  };
  
  # kitty configuration
  programs.kitty = {
    font = {
      name = "0xProto";
      size = 10;
    };
    settings = {
      background_opacity = "0.8";
      confirm_os_window_close = -1;
    };
  };
 
  # zsh customization
  programs.zsh = {
    shellAliases = myShellAliases;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
  };

  # gnome extension customizations
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
        font-name = "0xProto, 10";
        monospace-font-name = "0xProto 10";
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
