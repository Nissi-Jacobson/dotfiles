{ pkgs, ... }:

{
  programs.neovim = {
      extraLuaPackages = ps: [ ps.magick ];
      extraPackages = [ pkgs.imagemagick ];
      # ... other config
  };
}
