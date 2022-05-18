# jumango nix

nix settings

## minimal img for aarch64

- required packages:
  - docker
  - make
  - bash

```bash
cd iso_build
make
```

```iso_build/nixos.iso``` is ready

## nix installation

1. install parallel desktop which has compatible with nix

2. complete 2.2 of... https://nixos.org/manual/nixos/stable/index.html#sec-installation in the mounted img

3. reboot

4. prepare user account

```bash
# in sudo
useradd ...
```

5. add sudors

edit /etc/nixos/configuration.nix and add:

```
users.extraUsers.<username> = {
    isNormalUser = true;
    home = "/home/<username>";
    extraGroups = [ "wheel" ];
}
```

6. build nix

```
nixos-rebuild switch --install-bootloader
```

7. git ssh
 TODO: better way to do this
```bash
mkdir .ssh
cd .ssh
ssh-keygen
# showing public ssh key
cat id_rsa.pub
```

## update nix

global

edit /etc/nixos/configuration.nix and add:

```
nixos-rebuild switch --install-bootloader
```

user

edit ~/.config/nixpkgs/home.nix and run:

```
home-manager switch
```
