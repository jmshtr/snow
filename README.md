# snow

Welcome to the README for my NixOS configurations!

## File Structure

```ini
├── flake.lock
├── flake.nix
├── home
│   ├── default.nix
│   ├── home.nix
│   └── programs
│       ├── browsers.nix
│       ├── common.nix
│       ├── default.nix
│       ├── git.nix
│       ├── media.nix
│       └── xdg.nix
├── hosts
│   ├── desktop
│   │   ├── default.nix
│   │   └── hardware-configuration.nix
│   └── laptop
│       ├── default.nix
│       └── hardware-configuration.nix
└── modules
    ├── gnome.nix
    ├── system.nix
    └── username.nix
```