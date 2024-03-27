{ pkgs, ... }:

{
  virtualisation = {
    virtualbox.host.enable = true;
    docker.enable = true;
  };
}