{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    asahi-bless
    git vim

    ghostty neovim
    chromium firefox

    nodejs docker docker-compose vscode

    siyuan
    telegram-desktop

    libnotify logiops
  ];
}
