{ pkgs, environment, ...}: {
imports =
    [
    ];


  programs.git = {
  	enable = true;
  	userName = "jumang4423";
  	userEmail = "catontheskate4423@gmail.com";
  };

  programs.i3status = {
      enable = true;

      general = {
        colors = true;
        color_good = "#8C9440";
        color_bad = "#A54242";
        color_degraded = "#DE935F";
      };
  };

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];


  programs.neovim = {
	enable = true;
	viAlias = true;
	package = pkgs.neovim-nightly;

	plugins = with pkgs.vimPlugins; [
		(plugin "soft-aesthetic/soft-era-vim")
	];

	#extraConfig = import ./vim-extra.nix;
};

  home.packages = with pkgs; [
    jdk
    chromium
    gcc
    fzf
    gh
    terminator
  ];

}
