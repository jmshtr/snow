{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.james = {
    isNormalUser = true;
    description = "James";
    shell = pkgs.bash;
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