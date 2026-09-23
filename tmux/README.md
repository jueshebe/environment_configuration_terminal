# Tmux

This directory configures [Tmux](https://github.com/tmux/tmux), a terminal
multiplexer that runs multiple persistent terminal sessions, windows, and panes
inside one terminal. The included configuration adds custom key bindings,
mouse support, vi-style copy mode, and session persistence.

## Installation

Follow the [official Tmux installation documentation](https://github.com/tmux/tmux/wiki/installing)
to install the `tmux` command used by this configuration.

## Plugins

This configuration will use
[Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm) to install
and manage Tmux plugins.

Install TPM by cloning its repository. TPM reads the plugin declarations from
`.tmux.conf` and installs or updates the configured Tmux plugins:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Configuration

Optionally create a symbolic link from Tmux's default configuration path to
the tracked file in this repository. Use this link only when you want Tmux's
active configuration to synchronize automatically after `git pull`; otherwise,
copy the repository file to `~/.tmux.conf`:

```bash
ln -s ~/environment_configuration_terminal/tmux/.tmux.conf ~/.tmux.conf
```

Without a symbolic link, copy the configuration file instead. The resulting
local copy must be copied again after repository updates:

```bash
cp ~/environment_configuration_terminal/tmux/.tmux.conf ~/.tmux.conf
```

Start Tmux, then press `prefix` (`C-Space`) followed by `I` (capital i) to let TPM install
the declared plugins. This activates pane navigation, the Dracula theme,
session restore, automatic session saving, and URL/file opening support.

The configured prefix is `prefix` (`C-Space`); it replaces Tmux's default
`Ctrl-b`.
