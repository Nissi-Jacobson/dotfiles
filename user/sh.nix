{ config, pkgs, ... }:

let
  myShellAliases = {
    "ll" = "ls -l";
    "la" = "ls -a";
    "lal" = "ls -al";
    ".." = "cd ..";
    "dotnvim" = "cd ~/dotfiles/ && nvim";
    "obsnvim" = "cd ~/Documents/brain-dump/ && nvim";
    "codenvim" = "cd ~/Documents/codes && nvim";
  };
in

{
  # fish customization
  programs.fish = {
    plugins = [];
    shellAliases = myShellAliases;
  };

  # zsh customization
  programs.zsh = {
    shellAliases = myShellAliases;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
  };

}
