{config, pkgs, ...}:

{
  imports = [
    ./gnome.nix
    ./defaultApps.nix
    ../theme.nix
  ];
}
