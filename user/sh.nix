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
