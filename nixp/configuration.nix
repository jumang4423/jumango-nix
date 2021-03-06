{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  virtualisation.docker.enable = true; 

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
 environment = {
	pathsToLink = [ "libexec" ];
	variables = {
		EDITOR = "nvim";
	};
};

fonts.fonts = with pkgs; [
	(nerdfonts.override { fonts = [ "AnonymousPro"]; })
];


services.xserver = {
	enable = true;
	desktopManager = {
		xterm.enable = false;
	};

	dpi = 96;

	displayManager = {
		defaultSession = "none+i3";
	};

	windowManager.i3 = {
		enable = true;
		extraPackages =  with pkgs; [
			dmenu
			i3status
			i3lock
			i3blocks
		];
	};
};

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
users.extraUsers.jumango = {
	isNormalUser = true;
	shell = pkgs.bash;
	home = "/home/jumango";
	extraGroups = [ "wheel" ];
};


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	neofetch
	home-manager
	starship
	python3
	vim
	gnome.gedit

	# st from luke
	(st.overrideAttrs (oldAttrs: rec {
          src = fetchFromGitHub {
            owner = "LukeSmithxyz";
            repo = "st";
            rev = "8ab3d03681479263a11b05f7f1b53157f61e8c3b";
            sha256 = "1brwnyi1hr56840cdx0qw2y19hpr0haw4la9n0rqdn0r2chl8vag";
          };
          # Make sure you include whatever dependencies the fork needs to build properly!
          buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
        # If you want it to be always up to date use fetchTarball instead of fetchFromGitHub
        # src = builtins.fetchTarball {
        #   url = "https://github.com/lukesmithxyz/st/archive/master.tar.gz";
        # };
        }))
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

programs.bash = {
	shellAliases = {
		la = "ls -al";
		mm = "cd ..";
		nandakke_cd = "cd $(find . | fzf)";
	};
};


programs.starship.enable = true;
  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

