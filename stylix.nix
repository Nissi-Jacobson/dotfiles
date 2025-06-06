{ config, inputs, pkgs, ... }:
{
  # Stylix Configurartion
  stylix = {
    enable = true;
    #image = ./landscape.jpg;
    autoEnable = true;
    targets = {
      qt.enable = true;
      gtk.enable = true;
    };
    base16Scheme = {
      base00 = "#1A1B26"; /* Default Background */
      base01 = "#16161E"; /* Lighter Background (Used for status bars, line number and folding marks) */
      base02 = "#2F3549"; /* Selection Background */
      base03 = "#444B6A"; /* Comments, Invisibles, Line Highlighting */
      base04 = "#787C99"; /* Dark Foreground (Used for status bars) */
      base05 = "#A9B1D6"; /* Default Foreground, Caret, Delimiters, Operators */
      base06 = "#CBCCD1"; /* Light Foreground (Not often used) */
      base07 = "#D5D6DB"; /* Light Background (Not often used) */
      base08 = "#C0CAF5"; /* RED Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted */
      base09 = "#A9B1D6"; /* ORANGE Integers, Boolean, Constants, XML Attributes, Markup Link Url */
      base0A = "#0DB9D7"; /* YELLOW Classes, Markup Bold, Search Text Background */
      base0B = "#9ECE6A"; /* GREEN Strings, Inherited Class, Markup Code, Diff Inserted */
      base0C = "#B4F9F8"; /* CYAN Support, Regular Expressions, Escape Characters, Markup Quotes */
      base0D = "#2AC3DE"; /* BLUE Functions, Methods, Attribute IDs, Headings */
      base0E = "#BB9AF7"; /* MAGENTA Keywords, Storage, Selector, Markup Italic, Diff Changed */
      base0F = "#F7768E"; /* PURPLE? Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?> */
    };
    polarity = "dark";
    fonts = {
      serif.name = "0xProto Nerd Font Mono";
      sansSerif.name = "0xProto Nerd Font Mono";
      monospace.name = "0xProto Nerd Font Mono";
      sizes = {
        applications = 10;
        terminal = 10;
        desktop = 10;
        popups = 10;
      };
    };
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };
}
