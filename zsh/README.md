# Zsh

This directory contains the configuration and documentation for the Z shell.

## Installation

Install Zsh by following the official Oh My Zsh installation guide for your
operating system:

[Installing Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

## Oh My Zsh

Install Oh My Zsh to configure and extend Zsh using the official
documentation:

[Oh My Zsh documentation](https://github.com/ohmyzsh/ohmyzsh/wiki)

## zsh-autosuggestions

Install the `zsh-autosuggestions` plugin for Oh My Zsh by following the
[official installation instructions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md):

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Then enable the plugin in `~/.zshrc`:

```bash
plugins=(... zsh-autosuggestions)
```

Restart Zsh or reload the configuration:

```bash
source ~/.zshrc
```

## zsh-syntax-highlighting

Install the `zsh-syntax-highlighting` plugin for Oh My Zsh by following the
[official installation instructions](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md):

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Add the plugin to the `plugins` list in `~/.zshrc`. Keep
`zsh-syntax-highlighting` at the end of the list:

```zsh
plugins=(... zsh-autosuggestions zsh-syntax-highlighting)
```

Reload the configuration:

```bash
source ~/.zshrc
```

## Powerlevel10k

Install and configure the Powerlevel10k theme for Oh My Zsh by following the
[official Oh My Zsh instructions](https://github.com/romkatv/powerlevel10k#oh-my-zsh):

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set the theme in `~/.zshrc`:

```zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Restart Zsh or reload the configuration:

```bash
source ~/.zshrc
```

On the first start, Powerlevel10k opens its configuration wizard. Complete the
wizard to select the prompt style, transient prompt behavior, and other
appearance options.

## autoenv

Install `autoenv` by following the
[official autoenv repository](https://github.com/hyperupcall/autoenv):

```bash
git clone https://github.com/hyperupcall/autoenv.git ~/.autoenv
```

Oh My Zsh includes an `autoenv` plugin that integrates the tool with Zsh. Enable
it in `~/.zshrc` together with the other plugins:

```zsh
plugins=(... zsh-autosuggestions zsh-syntax-highlighting autoenv)
```

See the
[Oh My Zsh autoenv plugin documentation](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autoenv)
for the integration details.

Reload the configuration:

```bash
source ~/.zshrc
```

## copypath

Enable the `copypath` plugin included with Oh My Zsh. It does not require a
separate installation:

```zsh
plugins=(... zsh-autosuggestions zsh-syntax-highlighting autoenv copypath)
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

Reload the configuration after updating `~/.zshrc`:

```bash
source ~/.zshrc
```

## copyfile

Enable the `copyfile` plugin included with Oh My Zsh. It does not require a
separate installation:

```zsh
plugins=(... zsh-autosuggestions zsh-syntax-highlighting autoenv copypath copyfile)
```

See the
[Oh My Zsh copyfile plugin documentation](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copyfile)
for details. The plugin uses the same `clipcopy` helper as `copypath`, so
Linux users must have `xclip` or `xsel` installed. Run `copyfile` with a file
path to copy the file contents to the clipboard:

```bash
copyfile path/to/file
```

Reload the configuration after updating `~/.zshrc`:

```bash
source ~/.zshrc
```

## Example configuration

The repository includes a complete [`.zshrc` example](.zshrc) that combines
the theme and plugins described above. Use it as a reference when creating or
updating `~/.zshrc`; review the plugin list and personal settings before
copying any entries into your own configuration.

Configuration files and additional Zsh setup will be added to this directory
as they are introduced.
