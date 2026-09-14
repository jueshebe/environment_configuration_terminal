# Kitty

This directory configures [Kitty](https://sw.kovidgoyal.net/kitty/), the
terminal emulator. It defines its appearance and behavior:

- `kitty.conf`: personal settings layered on top of Kitty's defaults.
- `dracula.conf`: the Dracula palette based on the [official Dracula configuration for Kitty](https://draculatheme.com/kitty).

## Install and optionally link the configuration

Install Kitty according to the official documentation, then create its
configuration directory. This is where Kitty looks for its active settings:

```bash
mkdir -p ~/.config/kitty
```

Optionally create symbolic links from Kitty's configuration directory to the
tracked files. Use these links only when you want Kitty's active configuration
to synchronize automatically after `git pull`; otherwise, configure Kitty with
copies of the repository files:

```bash
ln -sfn ~/environment_configuration_terminal/kitty/kitty.conf \
  ~/.config/kitty/kitty.conf
ln -sfn ~/environment_configuration_terminal/kitty/dracula.conf \
  ~/.config/kitty/dracula.conf
```

Without symbolic links, copy both files to the same configuration directory.
This creates independent local copies, so repeat the copy after future
repository updates when you want to use them:

```bash
cp ~/environment_configuration_terminal/kitty/kitty.conf \
  ~/.config/kitty/kitty.conf
cp ~/environment_configuration_terminal/kitty/dracula.conf \
  ~/.config/kitty/dracula.conf
```

The wallpaper is loaded directly from the repository by `kitty.conf`:

```conf
background_image ~/environment_configuration_terminal/kitty/wallpaper.jpg
background_image_layout cscaled
background_image_linear yes
background_opacity 0.5
background_tint 0.9
background_blur 0
```

`background_opacity` controls the terminal transparency, while
`background_tint` controls how strongly Kitty blends the wallpaper with the
configured background color. The desktop compositor must support transparency
for `background_opacity` to reveal what is behind the Kitty window.

The configuration uses **MesloLGS Nerd Font**. Install it before starting
Kitty; the font provides the glyphs used by the terminal and shell prompt.

## Application icon

The Kitty application is installed separately, following Kitty's official
documentation. This repository only provides its configuration and the custom
icon image at:

```text
~/environment_configuration_terminal/kitty/icon.png
```

`Icon=` must contain the absolute path to that image. It does not point to the
Kitty executable. Set it in each Kitty desktop launcher:

```ini
Icon=/home/julian/environment_configuration_terminal/kitty/icon.png
```

Keep the existing `Exec=` entry unchanged; that entry is the one that points to
the installed Kitty application.

Update both files if they exist:

```text
~/.local/share/applications/kitty.desktop
~/.local/share/applications/kitty-open.desktop
```

After changing the desktop entries, refresh the application database so the
desktop environment discovers the new icon, then restart the application
launcher:

```bash
update-desktop-database ~/.local/share/applications
```

Confirm that Kitty can read the linked configuration:

```bash
kitty --config ~/environment_configuration_terminal/kitty/kitty.conf --version
```

To apply changes in an open window, reload `kitty.conf` from Kitty or restart the application.
