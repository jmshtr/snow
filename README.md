# snow

Welcome to the README for my NixOS configurations! Below, you'll find details about two separate configurations tailored for desktop and laptop usage.

## Table of Contents

1. NixOS Configurations
    - [Desktop Configuration](#desktop-configuration)
    - [Laptop Configuration](#laptop-configuration)
2. [Usage](#usage)
3. [Additional Notes](#additional-notes)
4. [TODO](#todo)

## Desktop Configuration

**Purpose:** This configuration is designed for desktop systems, focusing on gaming, multimedia, and general productivity.

**Key Features:**
- **Boot Options:** Utilizes systemd-boot as the bootloader, latest Linux kernel, and AMDGPU driver for optimal performance.
- **Networking:** NetworkManager is enabled for easy network configuration.
- **Time, Locale, and Keyboard Options:** Time zone set to Europe/London, default locale to en_GB.UTF-8, and console and X11 keymaps configured for UK layout.
- **Desktop Environment:** GNOME desktop environment with GDM display manager enabled.
- **Multimedia:** Sound support enabled with Pipewire, Flatpak for additional software installation, and printing support via CUPS.
- **Gaming:** Steam package installed with firewall configurations for Steam Remote Play and Source Dedicated Server. VirtualBox enabled for virtualization needs.
- **User Management:** User account 'james' created with necessary permissions and packages.

## Laptop Configuration

**Purpose:** This configuration is optimized for laptop usage, focusing on portability, power management, and productivity.

**Key Features:**
- **Boot Options:** Similar to the desktop configuration, systemd-boot is used with the latest kernel and additional Broadcom drivers for wireless support.
- **Networking:** NetworkManager enabled for seamless wireless connectivity.
- **Time, Locale, and Keyboard Options:** Time zone set to Europe/London, default locale to en_GB.UTF-8, with UK keyboard layout configured for both console and X11.
- **Desktop Environment:** GNOME desktop environment with GDM display manager enabled.
- **Multimedia:** Sound support enabled with Pipewire, Flatpak for additional software installation, and printing support via CUPS.
- **Power Management:** Logind configurations for lid switch behavior and suspend functionality.
- **User Management:** User account 'james' created with necessary permissions and packages.

## Usage

To use these configurations:
1. Clone this repository to your local machine.
2. Copy the appropriate configuration file (desktop or laptop) to `/etc/nixos/configuration.nix`.
3. Modify the configuration as needed, especially user-specific settings.
4. Run `sudo nixos-rebuild switch` to apply the changes and reboot your system.

## Additional Notes

- Ensure that hardware configurations in `hardware-configuration.nix` match your system.
- Be cautious when modifying system-critical settings to avoid unintended consequences.
- Consult the NixOS manual and relevant documentation for further customization and troubleshooting.

## TODO

- Implement Nix flakes for more reproducible and efficient NixOS setups.
- Explore Home Manager for managing user-specific configurations and packages.
- Create a default configuration with separate changes for the laptop and desktop setups to streamline the setup process.