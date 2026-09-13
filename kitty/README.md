# Kitty

This directory contains the configuration used for the [Kitty](https://sw.kovidgoyal.net/kitty/) terminal:

- `kitty.conf`: personal settings layered on top of Kitty's defaults.
- `dracula.conf`: the Dracula palette based on the [official Dracula configuration for Kitty](https://draculatheme.com/kitty).

## Installation

Install Kitty according to the official documentation and create its configuration directory:

```bash
mkdir -p ~/.config/kitty
```

Create symbolic links from Kitty's configuration directory to the files in the
fixed project directory:

```bash
ln -sfn ~/environment_configuration_terminal/kitty/kitty.conf \
  ~/.config/kitty/kitty.conf
ln -sfn ~/environment_configuration_terminal/kitty/dracula.conf \
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

Kitty now reads the files directly from the repository. Running `git pull` in
`~/environment_configuration_terminal` updates the configuration used by Kitty
without copying files again.

The configuration uses **MesloLGS Nerd Font**. Install it before starting Kitty so the font is applied correctly.

## Application icon

The custom icon is stored in `kitty/icon.png`. Update the `Icon=` entry in
each Kitty desktop launcher so it points to the icon in this repository:

```ini
Icon=/home/julian/environment_configuration_terminal/kitty/icon.png
```

Update both files if they exist:

```text
~/.local/share/applications/kitty.desktop
~/.local/share/applications/kitty-open.desktop
```

After changing the desktop entries, refresh the application database and
restart the application launcher:

```bash
update-desktop-database ~/.local/share/applications
```

To verify that Kitty can load the configuration:

```bash
kitty --config ~/environment_configuration_terminal/kitty/kitty.conf --version
```

To apply changes in an open window, reload `kitty.conf` from Kitty or restart the application.
