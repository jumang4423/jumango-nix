{ pkgs, environment, lib, config, ...}:
let

# installs a vim plugin from git with a given tag / branch
  pluginGit = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };


	plugin = pluginGit "HEAD";
in {
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
	  (plugin "junegunn/seoul256.vim")
	  (plugin "rust-lang/rust.vim")	
	];

	extraConfig = import ./vim-extra.nix;
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
