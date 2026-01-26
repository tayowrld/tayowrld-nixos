{ pkgs, ... }:
{
  stylix = {
    enable = true;

    # Палитра base16. Можно взять готовую из base16-schemes
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";

    polarity = "dark";

    # Если хочешь, чтобы само включало большинство таргетов:
    autoEnable = true;

    # Явно фиксируем важное:
    targets = {
      gtk.enable = true;
      qt.enable = true;

      # Ghostty (у тебя он как раз основной)
      ghostty.enable = true;

      # Flatpak иногда требует отдельного включения:
      gtk.flatpak.enable = true;
    };
  };
}

