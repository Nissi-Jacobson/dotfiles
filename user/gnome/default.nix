{config, pkgs, ...}:

{
  imports = [
    ./gnome.nix
    ./defaultApps.nix
    ../apps/default.nix
  ];
}
