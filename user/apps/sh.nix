{ config, pkgs, ... }:

let
  myShellAliases = {
    ll = "ls -l";
    la = "ls -a";
    lal = "ls -al";
    ".." = "cd ..";
  };
  myShellAbbrs = myShellAliases;
in

{
  # fish customization
  programs.fish = {
    enable = true;
    plugins = [];
    shellInit = ''
      eval (direnv hook fish)
    '';
    shellAbbrs = myShellAliases;
    preferAbbrs = true;
    shellAliases = myShellAliases;
    functions = {
      pyshell = ''
        nix-shell ~/dotfiles/user/user-shells/pyShell.nix
      '';
      codenvim = ''
        cd ~/Documents/codes/
        nvim
      '';
      snaknvim = ''
        cd ~/Documents/codes/
        pyshell
      '';
      obsnvim = ''
        cd ~/Documents/brain-dump/
        nvim
      '';
      dotnvim = ''
        cd ~/dotfiles/
        nvim
      '';
    };
  };

  # zsh customization
  programs.zsh = {
    shellAliases = myShellAliases;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
  };

}
