{ config, lib, ... }:
{
  virtualisation = {
    waydroid = {
      enable = true;
    };
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
        # Optionally customize rootless Docker daemon settings
        daemon.settings = {
          dns = [ "1.1.1.1" "8.8.8.8" ];
          registry-mirrors = [ "https://mirror.gcr.io" ];
        };
      };
    };
  };
}
