{ ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../../modules/core/nixpkgs.nix
    ../../modules/core/nix.nix
    ../../modules/core/zram.nix
    ../../modules/boot/systemd-boot.nix
    ../../modules/desktop/gnome.nix
    ../../modules/networking/networkmanager-iwd.nix
    ../../modules/services/sing-box.nix
    ../../modules/packages/default.nix
    ../../modules/users/ivankurbakov.nix
    ../../modules/core/state-version.nix
  ];

  networking.hostName = "big-lesi";
  
  my.singbox.secretsSingBox = ./sing-box-secrets.nix;
}
