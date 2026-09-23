# Zsh

This directory configures [Zsh](https://www.zsh.org/), the interactive shell.
The included `.zshrc` uses Oh My Zsh, the Powerlevel10k prompt, and plugins to
improve the Zsh command-line experience with suggestions, syntax highlighting,
project-specific environments, and clipboard commands.

## Installation

Install Zsh by following the official guide for your operating system. This
provides the shell that loads the rest of this configuration:

[Installing Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

## Oh My Zsh

Install Oh My Zsh using the official documentation. It is the framework that
loads the theme and plugins configured in `.zshrc`:

[Oh My Zsh documentation](https://github.com/ohmyzsh/ohmyzsh/wiki)

## zsh-autosuggestions

Install `zsh-autosuggestions` according to the
[official installation instructions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md).
It suggests commands from shell history as you type:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Then enable it in `~/.zshrc` so Oh My Zsh loads it when the shell starts:

```bash
plugins=(... zsh-autosuggestions)
```

## zsh-syntax-highlighting

Install `zsh-syntax-highlighting` according to the
[official installation instructions](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md).
It highlights valid commands, paths, and shell syntax as they are entered:

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Add the plugin to the `plugins` list in `~/.zshrc` so it runs at shell startup. Keep
`zsh-syntax-highlighting` at the end of the list:

```zsh
plugins=(... zsh-syntax-highlighting)
```

## Powerlevel10k

Install Powerlevel10k according to the
[official Oh My Zsh instructions](https://github.com/romkatv/powerlevel10k#oh-my-zsh).
It provides the configurable prompt shown in each terminal:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set the theme in `~/.zshrc` so Oh My Zsh loads it:

```zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
```

On the first start, Powerlevel10k opens its configuration wizard. Complete the
wizard to select the prompt style, transient prompt behavior, and other
appearance options.


## copypath

Enable the `copypath` plugin included with Oh My Zsh. It copies the current
directory's absolute path to the clipboard and does not require a separate
installation:

```zsh
plugins=(... copypath)
```

See the
[Oh My Zsh copypath plugin documentation](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copypath)
for details. On Linux, install `xclip` or `xsel`, which `clipcopy` uses to
write to the clipboard:

```bash
sudo apt install xclip
```

Run `copypath` from a directory to copy its absolute path to the clipboard:

```bash
copypath
```

## copyfile

Enable the `copyfile` plugin included with Oh My Zsh. It copies a file's
contents to the clipboard and does not require a separate installation:

```zsh
plugins=(... copyfile)
```

See the
[Oh My Zsh copyfile plugin documentation](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copyfile)
for details. The plugin uses the same `clipcopy` helper as `copypath`, so
Linux users must have `xclip` or `xsel` installed. Run `copyfile` with a file
path to copy the file contents to the clipboard:

```bash
copyfile path/to/file
```

## Apply the configuration

After installing the selected plugins in `.zshrc`,
reload the configuration once:

```bash
source ~/.zshrc
```

## Example configuration

The repository includes a complete [`.zshrc` example](.zshrc).
