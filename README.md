# snow
This repository contains my personal NixOS configurations. It includes system configurations, module configurations, host-specific settings, and other related files.

See an overview of the flake outputs by running: 
```
nix flake show github:jmshtr/snow
```

## Why NixOS?
NixOS offers several compelling advantages over traditional Linux distributions:

1. **Declarative Configuration**: Simplify system management with configuration files.
2. **Immutable System**: Ensure stability by treating the OS as immutable.
3. **Atomic Upgrades**: Switch between configurations without risk.
4. **Package Management**: Use a functional package manager for reproducible environments.
5. **Hermetic Environments**: Isolate dependencies for consistent development and deployment.

## Usage
My laptop configuration:
```
sudo nixos-rebuild switch --flake path:.#laptop
```

My desktop configuration:
```
sudo nixos-rebuild switch --flake path:.#desktop
```

#
<p align="center">
  <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/white.png" width="50px" alt="NixOS logo"/>
</p>