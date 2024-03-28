{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;

  users.users.james = {
    isNormalUser = true;
    description = "James";
    shell = pkgs.zsh;
    extraGroups = [ 
      "wheel"
      "input"
      "video"
      "audio"
      "disk"
      "networkmanager"
      "vboxusers"
      "docker"
    ];
  };
}