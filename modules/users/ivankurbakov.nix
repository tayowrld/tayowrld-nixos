{ pkgs, ... }:
{
  users.mutableUsers = true;

  users.users.ivankurbakov = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "input" "docker" ];
  };
}
