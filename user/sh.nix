{ config, pkgs, ... }:

let
  myShellAliases = {
    ll = "ls -l";
    la = "ls -a";
    lal = "ls -al";
    ".." = "cd ..";
    dotnvim = "cd ~/dotfiles/ && nvim";
    obsnvim = "cd ~/Documents/brain-dump/ && nvim";
    codenvim = "cd ~/Documents/codes && nvim";
  };
  myShellAbbrs = myShellAliases;
in

{
  # fish customization
  programs.fish = {
    plugins = [];
    shellAbbrs = myShellAliases;
    preferAbbrs = true;
  };

  # zsh customization
  programs.zsh = {
    shellAliases = myShellAliases;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
  };

}
