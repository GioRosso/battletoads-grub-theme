# Battletoads GRUB Theme

A retro, high-contrast, 1080p arcade theme for the GRUB 2 bootloader. 

Designed with a "contrast void" layout, this theme isolates the boot menu text on the dark left side of the screen to ensure perfect legibility, while keeping the vibrant Battletoads pixel art on the right. It is optimized for 1920x1080 displays and built specifically with Fedora Linux in mind (though it is strictly compatible with most GRUB 2 distributions).

## Features
* **Strict 1080p Resolution:** Configures `GRUB_GFXMODE` to 1920x1080 to prevent stretching and letterboxing.
* **Custom Arcade Typography:** Includes a pre-compiled 18pt `.pf2` bitmap arcade font.
* **Automated Deployment:** Includes a safe installation script that backs up your existing `/etc/default/grub` configuration before applying changes.

## Prerequisites
* A Linux distribution utilizing the GRUB 2 bootloader (tested on Fedora).
* `git` installed on your system.
* A physical display capable of 1920x1080 resolution.

## Installation
You can install this theme automatically using the provided bash script.

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/GioRosso/battletoads-grub-theme.git
