{ lib, pkgs, ... }: 

{
	home.packages = (with pkgs; [
		# Web Browsers
		firefox             # Mozilla Firefox web browser
		librewolf           # Librewolf, a privacy-focused web browser
		google-chrome       # Google Chrome web browser

		# Development Tools
		vscodium            # Visual Studio Code without the Microsoft branding
		onlyoffice-bin_7_5  # OnlyOffice, an office suite
		github-desktop      # GitHub Desktop application
		btop                # Process viewer and system monitor
		xdg-utils           # Command line utilities for desktop integration
		fzf                 # Command-line fuzzy finder
		atuin               # Atuin, a simple, easy-to-use window manager for X11
		chezmoi             # Chezmoi, a tool for managing your dotfiles
		eza                 # eza, a package for XYZ

		# Node.js and related packages
		nodejs              # Node.js runtime environment
		nodePackages.npm    # Node Package Manager
		nodePackages.pnpm   # Fast, disk space efficient package manager
		yarn                # Fast, reliable, and secure dependency management

		# Utilities
		fish                # Fish shell, an alternative shell with powerful features
		openssl             # Secure Sockets Layer and Transport Layer Security toolkit
		expect              # Scripting language for automating interactive applications
		du-dust             # du-dust, a more intuitive version of 'du' for disk usage analysis
		bat                 # bat, a cat clone with syntax highlighting and Git integration
		tldr                # tldr, a collection of community-driven simplified man pages
		zellij              # zellij, a terminal workspace with tmux-like features
		tree                # tree, display directory structures in a tree-like format

		# Communication
		discord             # Discord, a VoIP, instant messaging and digital distribution platform
	]);
}
