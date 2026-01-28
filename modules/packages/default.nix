{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    asahi-bless

    firefox

    nodejs docker docker-compose vscode
    git neovim

    obsidian
    
    telegram-desktop

    libnotify logiops

    gnomeExtensions.just-perfection
    gnomeExtensions.blur-my-shell

    hyprpaper nemo kitty nwg-look quickshell hyprshot mako dconf jq socat
  ];
}
