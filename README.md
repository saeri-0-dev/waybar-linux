# waybar-linux

Minimal Waybar configuration for Linux.

## Features

* Application launcher (Wofi)
* Clock
* Ping monitor
* System tray
* Music information (Playerctl)
* Workspace indicators
* CAVA visualizer
* CPU/System bars
* Bluetooth status
* Wi-Fi status
* Battery indicator

## Screenshot

![screenshot](screenshot.jpg)

## Included

```text
waybar-linux/
├── waybar/
├── cava/
├── gtk-3.0/
├── gtk-4.0/
└── screenshot.png
```

### waybar

Contains the Waybar configuration, styling, and custom scripts.

### cava

Contains the CAVA configuration used by the visualizer module.

### gtk-3.0

GTK 3 configuration files.

### gtk-4.0

GTK 4 configuration files.

## Modules

### Left

* Menu
* Clock
* Ping
* Tray
* Music

### Center

* Workspaces

### Right

* CAVA
* System bars
* Bluetooth
* Wi-Fi
* Battery

## Required Scripts

```text
~/.config/waybar/scripts/cava.sh
~/.config/waybar/scripts/cpu_bar.sh
~/.config/waybar/scripts/bluetooth.sh
~/.config/waybar/scripts/wifi.sh
```

## Installation

Clone the repository:

```bash
git clone https://github.com/saeri-0-dev/waybar-linux.git
```

Copy the folders you need to your configuration directory and make sure the script paths match your system.
