# Package catalog

Every package in `pacman.txt`, `gpu-*.txt`, and `aur.txt`, with the
description straight from pacman/AUR — generated from the current
package lists, not hand-maintained. See [`README.md`](README.md) for
how to install them.

## Official repos (pacman.txt)

### Build essentials / core utilities

| Package | Description |
| --- | --- |
| `base-devel` | Basic tools to build Arch Linux packages |
| `sudo` | Give certain users the ability to run some commands as root |
| `man-db` | A utility for reading man pages |
| `bash-completion` | Programmable completion for the bash shell |
| `pacman-contrib` | Contributed scripts and tools for pacman systems |
| `expac` | alpm data (pacman database) extraction utility |

### Bootloader / snapshots

| Package | Description |
| --- | --- |
| `limine` | An advanced, portable, multiprotocol bootloader |
| `snapper` | A tool for managing BTRFS and LVM snapshots |
| `plymouth` | Graphical boot splash screen |
| `btrfs-progs` | Btrfs filesystem utilities |
| `zram-generator` | Systemd unit generator for zram devices |
| `kernel-modules-hook` | Keeps your system fully functional after a kernel upgrade |
| `efibootmgr` | Linux user-space application to modify the EFI Boot Manager |

### Filesystem / disk tools

| Package | Description |
| --- | --- |
| `dosfstools` | DOS filesystem utilities |
| `exfatprogs` | exFAT filesystem userspace utilities for the Linux Kernel exfat driver |
| `dua-cli` | A tool to conveniently learn about the disk usage of directories, fast! |
| `gnome-disk-utility` | Disk Management Utility for GNOME |
| `gvfs-mtp` | Virtual filesystem implementation for GIO - MTP backend (Android, media player) |
| `gvfs-nfs` | Virtual filesystem implementation for GIO - NFS backend |
| `gvfs-smb` | Virtual filesystem implementation for GIO - SMB/CIFS backend (Windows file sharing) |
| `udiskie` | Removable disk automounter using udisks |

### Networking (iwd for wifi, no NetworkManager)

| Package | Description |
| --- | --- |
| `iwd` | Internet Wireless Daemon |
| `impala` | TUI for managing wifi |
| `avahi` | Service Discovery for Linux using mDNS/DNS-SD (compatible with Bonjour) |
| `nss-mdns` | glibc plugin providing host name resolution via mDNS |
| `inetutils` | A collection of common network programs |
| `wireless-regdb` | Central Regulatory Domain Database |
| `bluez` | Daemons for the bluetooth protocol stack |
| `bluez-utils` | Development and debugging utilities for the bluetooth protocol stack |
| `bluetui` | TUI for managing bluetooth devices |
| `tailscale` | A mesh VPN that makes it easy to connect your devices, wherever they are. |
| `ufw` | Uncomplicated and easy to use CLI tool for managing a netfilter firewall |
| `whois` | Intelligent WHOIS client |
| `socat` | Multipurpose relay |
| `wget` | Network utility to retrieve files from the web |

### Audio

| Package | Description |
| --- | --- |
| `pipewire` | Low-latency audio/video router and processor |
| `pipewire-alsa` | Low-latency audio/video router and processor - ALSA configuration |
| `pipewire-jack` | Low-latency audio/video router and processor - JACK replacement |
| `pipewire-pulse` | Low-latency audio/video router and processor - PulseAudio replacement |
| `wireplumber` | Session / policy manager implementation for PipeWire |
| `gst-plugin-pipewire` | Multimedia graph framework - pipewire plugin |
| `alsa-utils` | Advanced Linux Sound Architecture - Utilities |
| `libpulse` | A featureful, general-purpose sound server (client library) |
| `sof-firmware` | Sound Open Firmware |
| `pamixer` | Pulseaudio command-line mixer like amixer |

### Graphics (vendor-agnostic base; see gpu-*.txt for the driver)

| Package | Description |
| --- | --- |
| `mesa` | Open-source OpenGL drivers |
| `lib32-mesa` | Open-source OpenGL drivers - 32-bit |
| `vulkan-icd-loader` | Vulkan Installable Client Driver (ICD) Loader |
| `lib32-vulkan-icd-loader` | Vulkan Installable Client Driver (ICD) Loader (32-bit) |
| `libva-utils` | Intel VA-API Media Applications and Scripts for libva |

### Wayland desktop basics

| Package | Description |
| --- | --- |
| `sway` | Tiling Wayland compositor and replacement for the i3 window manager |
| `swaybg` | Wallpaper tool for Wayland compositors |
| `swayidle` | Idle management daemon for Wayland |
| `swaylock` | Screen locker for Wayland |
| `waybar` | Highly customizable Wayland bar for Sway and Wlroots based compositors |
| `xorg-xwayland` | run X clients under wayland |
| `brightnessctl` | Lightweight brightness control tool |
| `grim` | Screenshot utility for Wayland |
| `xdg-desktop-portal-gtk` | A backend implementation for xdg-desktop-portal using GTK |
| `xdg-desktop-portal-wlr` | xdg-desktop-portal backend for wlroots |
| `polkit` | Application development toolkit for controlling system-wide privileges |
| `polkit-gnome` | Legacy polkit authentication agent for GNOME |
| `mako` | Lightweight notification daemon for Wayland |
| `swayosd` | GTK based on-screen display for volume, brightness, and lock keys |
| `fuzzel` | Application launcher for wlroots based Wayland compositors |
| `cliphist` | wayland clipboard manager |
| `wl-clipboard` | Command-line copy/paste utilities for Wayland |
| `wtype` | xdotool type for wayland |
| `playerctl` | mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others. |
| `power-profiles-daemon` | Makes power profiles handling available over D-Bus |
| `qrencode` | C library for encoding data in a QR Code symbol. |
| `xmlstarlet` | A set of tools to transform, query, validate, and edit XML documents |
| `qt5-wayland` | Provides APIs for Wayland |
| `qt6-imageformats` | Plugins for additional image formats |

### Fonts / theming

| Package | Description |
| --- | --- |
| `fontconfig` | Library for configuring and customizing font access |
| `noto-fonts` | Google Noto TTF fonts |
| `noto-fonts-cjk` | Google Noto CJK fonts |
| `noto-fonts-emoji` | Google Noto Color Emoji font |
| `ttf-jetbrains-mono-nerd` | Patched font JetBrains Mono from nerd fonts library |
| `adwaita-fonts` | The typefaces for GNOME |
| `woff2-font-awesome` | Iconic font designed for Bootstrap - woff2 format |
| `gnome-themes-extra` | Extra GNOME themes (legacy HighContrast icon theme and index files for Adwaita) |

### Terminal / shell

| Package | Description |
| --- | --- |
| `alacritty` | A cross-platform, GPU-accelerated terminal emulator |
| `zsh` | A very advanced and programmable command interpreter (shell) for UNIX |
| `zsh-autosuggestions` | Fish-like autosuggestions for zsh |
| `zsh-syntax-highlighting` | Fish shell like syntax highlighting for Zsh |
| `starship` | The cross-shell prompt for astronauts |
| `zoxide` | A smarter cd command for your terminal |
| `fzf` | Command-line fuzzy finder |
| `eza` | A modern replacement for ls (community fork of exa) |
| `bat` | Cat clone with syntax highlighting and git integration |
| `fd` | Simple, fast and user-friendly alternative to find |
| `ripgrep` | A search tool that combines the usability of ag with the raw speed of grep |
| `tmux` | Terminal multiplexer |
| `atuin` | Magical shell history |
| `gum` | A tool for glamorous shell scripts |
| `tldr` | Command line client for tldr, a collection of simplified man pages. |
| `fastfetch` | A feature-rich and performance oriented neofetch like system information tool |
| `btop` | A monitor of system resources, bpytop ported to C++ |
| `inxi` | Full featured CLI system information tool |
| `plocate` | Alternative to locate, faster and compatible with mlocate's database. |
| `less` | A terminal based program for viewing text files |
| `jq` | Command-line JSON processor |
| `lua51` | Powerful lightweight programming language designed for extending applications |
| `luarocks` | Deployment and management system for Lua modules |
| `usage` | A specification for CLIs |

### Editor / dev tools

| Package | Description |
| --- | --- |
| `neovim` | Fork of Vim aiming to improve user experience, plugins, and GUIs |
| `git` | the fast distributed version control system |
| `github-cli` | The GitHub CLI |
| `lazygit` | Simple terminal UI for git commands |
| `lazydocker` | A simple terminal UI for docker and docker-compose, written in Go with the gocui library. |
| `docker` | Pack, ship and run any application as a lightweight container |
| `docker-buildx` | Docker CLI plugin for extended build capabilities with BuildKit |
| `docker-compose` | Fast, isolated development environments using Docker |
| `tree-sitter-cli` | CLI tool for developing, testing, and using Tree-sitter parsers |
| `clang` | C language family frontend for LLVM |
| `llvm` | Compiler infrastructure |
| `libyaml` | YAML 1.1 library |
| `mariadb-libs` | MariaDB libraries |
| `postgresql-libs` | Sophisticated object-relational DBMS - Client binaries and libraries |
| `mise` | The front-end to your dev env |
| `re2c` | A tool for generating C-based recognizers from regular expressions |
| `gd` | Library for the dynamic creation of images by programmers |
| `rust` | Systems programming language focused on safety, speed and concurrency |

### File manager

| Package | Description |
| --- | --- |
| `nautilus` | Default file manager for GNOME |
| `nautilus-python` | Python bindings for the Nautilus Extension API |
| `sushi` | A quick previewer for Nautilus |
| `gnome-keyring` | Stores passwords and encryption keys |
| `libsecret` | Library for storing and retrieving passwords and other secrets |

### Media

| Package | Description |
| --- | --- |
| `mpv` | a free, open source, and cross-platform media player |
| `mpv-mpris` | MPRIS plugin for mpv |
| `ffmpegthumbnailer` | Lightweight video thumbnailer that can be used by file managers |
| `imv` | Image viewer for Wayland and X11 |
| `imagemagick` | An image viewing/manipulation program |
| `libvips` | A fast image processing library with low memory needs |
| `obs-studio` | Free, open source software for live streaming and recording |
| `gpu-screen-recorder` | A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux |
| `kdenlive` | A non-linear video editor for Linux using the MLT video framework |
| `audacity` | A program that lets you manipulate digital audio waveforms |
| `guvcview` | Simple GTK interface for capturing and viewing video from V4L2 devices |
| `scrcpy` | Display and control your Android device |
| `moonlight-qt` | GameStream client for PCs |
| `yt-dlp` | A youtube-dl fork with additional features and fixes |
| `zbar` | Application and library for reading bar codes from various sources |

### Office / productivity

| Package | Description |
| --- | --- |
| `libreoffice-fresh` | LibreOffice branch which contains new features and program enhancements |
| `evince` | Document viewer (PDF, PostScript, XPS, djvu, dvi, tiff, cbr, cbz, cb7, cbt) |
| `xournalpp` | Handwriting notetaking software with PDF annotation support |
| `pinta` | Drawing/editing program modeled after Paint.NET. It's goal is to provide a simplified alternative to GIMP for casual users |
| `obsidian` | A powerful knowledge base that works on top of a local folder of plain text Markdown files |
| `libqalculate` | Multi-purpose desktop calculator |
| `tesseract` | An OCR program |
| `tesseract-data-eng` | Tesseract OCR data (eng) |

### Browsers

| Package | Description |
|---|---|
| `firefox` | Fast, Private & Safe Web Browser |

### Virtualization / gaming

| Package | Description |
| --- | --- |
| `virtualbox` | Powerful x86 virtualization for enterprise as well as home use |
| `qemu-user-static-binfmt` | Binary format rules for QEMU static user mode emulation |
| `steam` | Valve's digital software delivery system |

### Hardware-specific utilities

| Package | Description |
| --- | --- |
| `ddcutil` | Query and change Linux monitor settings using DDC/CI and USB. |
| `bolt` | Thunderbolt 3 device manager |
| `fwupd` | Simple daemon to allow session software to update firmware |
| `android-tools` | Android platform tools |

### Security / reverse engineering (dual-use, personal research tooling)

| Package | Description |
| --- | --- |
| `ghidra` | Software reverse engineering framework |
| `radare2` | Open-source tools to disasm, debug, analyze and manipulate binary files |
| `jadx` | Command line and GUI tools to produce Java source code from Android Dex and APK files |
| `mitmproxy` | SSL-capable man-in-the-middle HTTP proxy |
| `zaproxy` | Integrated penetration testing tool for finding vulnerabilities in web applications |

### Misc

| Package | Description |
| --- | --- |
| `inotify-tools` | inotify-tools is a C library and a set of command-line programs for Linux providing a simple interface to inotify. |
| `unzip` | For extracting and viewing files in .zip archives |
| `python-gobject` | Python bindings for GLib/GObject/GIO/GTK |
| `python-poetry-core` | Poetry PEP 517 Build Backend & Core Utilities |

## GPU drivers (gpu-*.txt — pick one)

### AMD

| Package | Description |
| --- | --- |
| `vulkan-radeon` | Open-source Vulkan driver for AMD GPUs |
| `lib32-vulkan-radeon` | Open-source Vulkan driver for AMD GPUs - 32-bit |

### Intel

| Package | Description |
| --- | --- |
| `vulkan-intel` | Open-source Vulkan driver for Intel GPUs |
| `lib32-vulkan-intel` | Open-source Vulkan driver for Intel GPUs - 32-bit |
| `intel-media-driver` | Intel Media Driver for VAAPI — Broadwell+ iGPUs |

### NVIDIA

| Package | Description |
| --- | --- |
| `nvidia-open` | NVIDIA open kernel modules |
| `nvidia-utils` | NVIDIA drivers utilities |
| `lib32-nvidia-utils` | NVIDIA drivers utilities (32-bit) |
| `opencl-nvidia` | OpenCL implemention for NVIDIA |

## AUR (aur.txt)

### Dev tools

| Package | Description |
| --- | --- |
| `claude-code` | An agentic coding tool that lives in your terminal |
| `rtk` | CLI proxy that reduces LLM token consumption by 60-90% on common dev commands |

### TUI controls (wifi's impala, bluetooth's bluetui are in pacman.txt)

| Package | Description |
|---|---|
| `wiremix-git` | A simple TUI audio mixer for PipeWire |

### Apps

| Package | Description |
| --- | --- |
| `1password` | Password manager and secure wallet |
| `1password-cli` | 1Password command line tool |
| `spotify` | A proprietary music streaming service |
| `nordvpn-bin` | NordVPN CLI tool for Linux |
| `localsend` | An open source cross-platform alternative to AirDrop |

### Bootloader (Limine + Snapper integration)

| Package | Description |
| --- | --- |
| `limine-mkinitcpio-hook` | Install kernels for the Limine bootloader. |
| `limine-snapper-sync` | Integrates Limine boot entries with Snapper snapshots. |

### Misc tools

| Package | Description |
| --- | --- |
| `xdg-terminal-exec` | Proposed standard to launching desktop apps with Terminal=true |
| `cliamp` | A retro terminal music player inspired by Winamp 2.x |
| `tensaku` | Modern screenshot annotation tool for Wayland |
| `ttf-ia-writer` | Subset of the fonts provided by iA Writer |
| `ufw-docker` | To fix the Docker and UFW security flaw without disabling iptables. |
| `tzupdate` | Set the system timezone based on IP geolocation |
| `yaru-icon-theme` | Yaru default ubuntu icon theme |

### Android / mobile RE

| Package | Description |
| --- | --- |
| `android-apktool` | A tool for reengineering Android apk files |
| `android-sdk-build-tools-36` | Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc) |

### Security / reverse engineering

| Package | Description |
| --- | --- |
| `burpsuite` | An integrated platform for performing security testing of web applications (free edition) |
| `dex2jar` | Tools to work with android .dex and java .class files. ThexXTURBOXx's fork. |
| `python-frida-bin` | Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 binary version from PyPi |
| `frida-tools` | CLI tools for Frida |
