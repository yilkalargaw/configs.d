{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "containerland";
  home.homeDirectory = "/home/containerland";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.gtypist
    pkgs.cudatext
    # pkgs.lxappearance
    pkgs.arc-theme
    pkgs.adw-gtk3
    pkgs.vscodium
    pkgs.axel
    pkgs.aria
    pkgs.lf
    pkgs.brightnessctl
    # pkgs.volumeicon
    pkgs.libsForQt5.qtstyleplugin-kvantum
    pkgs.gnome.dconf-editor
    pkgs.starship
    pkgs.zathura
    pkgs.pandoc
    pkgs.tldr
    pkgs.groff
    pkgs.ghostscript
    pkgs.texlive.combined.scheme-full
    pkgs.neofetch
    pkgs.pfetch
    pkgs.dwt1-shell-color-scripts
    pkgs.libsForQt5.kdeconnect-kde
    pkgs.io
    pkgs.tree-sitter
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/containerland/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

   programs.emacs = {
     package = pkgs.emacs29;
     enable = true;
     extraPackages = epkgs: [
       epkgs.nix-mode
       epkgs.pdf-tools
       epkgs.vterm
       epkgs.auctex
       epkgs.tree-sitter-langs
     ];
   };
}
