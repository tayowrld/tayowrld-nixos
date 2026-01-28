{ ... }:
{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.settings.General.DisplayServer = "wayland";

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
}
