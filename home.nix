{ config, pkgs, ... }:

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
  pkgs.gnomeExtensions.transparent-top-bar
  pkgs.gnomeExtensions.caffeine
  pkgs.gnomeExtensions.just-perfection
  pkgs.gnomeExtensions.clipboard-history
  pkgs.gnomeExtensions.extension-list
  pkgs.gnomeExtensions.gnome-40-ui-improvements
  pkgs.gnomeExtensions.appindicator
  pkgs.gnomeExtensions.gsconnect
 # end of gnome shells extensions
  ];

 # adding dotfiles
  #home.file.".config/nvim".source = builtins.toPath "./nvim";
 
  # The home.sessionVariables option allows you to install Nix packages into your
  # sessionVariables
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

 # customizations
  
  # cursor customizations
  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    size = 24;
    package = pkgs.bibata-cursors;
  };

  # bash customization
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      ".." = "cd ..";
    };
  };

  # gnome extension customizations
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/sound" = {
        allow-volume-above-100-percent = true;
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "caffeine@patapon.info"
        "clipboard-history@alexsaveau.dev"
        "extension-list@tu.berry"
        "gnome-ui-tune@itstime.tech"
        "gsconnect@andyholmes.github.io"
        "just-perfection-desktop@just-perfection"
        "transparent-top-bar@zhanghai.me"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        ];
      };
      "org/gnome/shell/extensons/blur-my-shell" = {
        "./panel".blur-type = "dynamic";
#        "./applications".blur-on-overview = true;
#        "./applications".enable-all-by-default = true;
      };
      "org/gnome/desktop/interface".show-battery-percentage = true;
      
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
