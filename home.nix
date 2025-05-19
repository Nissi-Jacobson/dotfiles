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
  ];

 # adding dotfiles
  home.file.".config/nvim".source = "./nvim";
 
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

      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
