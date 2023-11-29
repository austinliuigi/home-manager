{ pkgs, lib, config, inputs, ... }:

let
  cfg = config.modules.programs.wayland.rofi;
in
{
  options.modules.programs.wayland.rofi.enable = lib.mkEnableOption "rofi module";

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.rofi-wayland ];

    home.file = {
      ".local/share/rofi/themes/_palette.rasi" = config.configuration.interpolateConfigFileWithMsg { file = "${/. + "${config.dotfiles.rofi}/.local/share/rofi/themes/_palette.rasi"}"; comment_start = "//"; };
      ".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.rofi}/.config/rofi";
    };
  };
}
