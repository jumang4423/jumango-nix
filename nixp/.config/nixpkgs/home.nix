{ pkgs, environment, ...}: {
imports =
    [
      ./pkgs/rust.nix
    ];


  programs.git = {
  	enable = true;
  	userName = "jumang4423";
  	userEmail = "catontheskate4423@gmail.com";
  };

  home.packages = with pkgs; [
    neovim
    jdk
    youtube-dl
    cargo
  ];

}
