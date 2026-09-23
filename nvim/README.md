# Neovim

This directory contains the Neovim configuration used by this repository. It
includes the main `init.lua` entry point, Lua modules for editor options and
key bindings, and plugin configuration under `lua/plugins/`.

The configuration uses [vim-plug](https://github.com/junegunn/vim-plug) to
install and update plugins. The plugin declarations are kept in
`lua/plugins/init.vim`.

## Requirements

Install the following before using this configuration:

- [Neovim](https://neovim.io/doc/install/) 0.12.0 or newer.
- Git, which vim-plug uses to download plugins.
- A C compiler and `make` for plugins that compile native extensions.
- `tree-sitter-cli` 0.26.1 or newer, installed through the system package
  manager rather than npm.
- `tar` and `curl`, which nvim-treesitter uses to download and install
  parsers.
- Node.js and npm for JavaScript and TypeScript tooling used by some LSP and
  debugger configurations.

Some language features also require language servers, formatters, debuggers,
or other external tools. The configuration includes
[Mason](https://github.com/williamboman/mason.nvim) to help install many of
these tools from inside Neovim.

## Installation

Create the Neovim configuration directory if it does not exist:

```bash
mkdir -p ~/.config
```

Optionally back up an existing configuration, then link the entire tracked
directory. Linking the directory is important because `init.lua` loads
`lua/plugins/init.vim` and the other Lua modules from the same configuration
tree:

```bash
if [ -e ~/.config/nvim ] || [ -L ~/.config/nvim ]; then
  mv ~/.config/nvim ~/.config/nvim.backup
fi
ln -sfn ~/environment_configuration_terminal/nvim ~/.config/nvim
```

If the repository is not located at
`~/environment_configuration_terminal`, replace that path with the actual
clone location.

To use an independent copy instead of a symbolic link:

```bash
cp -R ~/environment_configuration_terminal/nvim ~/.config/nvim
```

The copy must be repeated after repository updates. With the symbolic link,
pulling changes into the repository updates the active configuration directly.

## Install plugins

Install vim-plug for Neovim using its official installation command:

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Start Neovim and install the declared plugins:

```bash
nvim
```

Inside Neovim, run:

```vim
:PlugInstall
```

Restart Neovim after the installation completes. Use `:PlugUpdate` later to
update the plugins.

## Language tools

Open Mason from Neovim with:

```vim
:Mason
```

Install the language servers, formatters, and debuggers required by the
languages you use. Some configurations refer to tools installed under
`~/.local/share/nvim/mason/bin`, so those tools must be installed before their
corresponding LSP features are used.

## Updating

When the repository is managed with the symbolic link, update the
configuration with:

```bash
cd ~/environment_configuration_terminal
git pull
```

Then restart Neovim. Plugin updates are separate; run `:PlugUpdate` inside
Neovim when needed.

## Troubleshooting

- Run `:checkhealth` to identify missing Neovim dependencies.
- Run `:PlugStatus` to inspect plugin installation errors.
- If Neovim cannot find the configuration, check that
  `~/.config/nvim` points to this repository's `nvim` directory.
- If an LSP or debugger does not start, open `:Mason` and verify that its
  required external tool is installed.
