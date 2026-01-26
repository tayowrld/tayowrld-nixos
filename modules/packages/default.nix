{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    asahi-bless
    git vim

    neovim
    firefox

    nodejs docker docker-compose vscode

    obsidian
    telegram-desktop

    libnotify logiops

    gnomeExtensions.just-perfection
    gnomeExtensions.blur-my-shell
  ];
}
