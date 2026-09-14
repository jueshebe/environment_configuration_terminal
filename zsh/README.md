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

Reload the configuration to activate the newly enabled plugin:

```bash
source ~/.zshrc
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
plugins=(... zsh-autosuggestions zsh-syntax-highlighting)
```

Reload the configuration to activate syntax highlighting:

```bash
source ~/.zshrc
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

Restart Zsh or reload the configuration to display the new prompt:

```bash
source ~/.zshrc
```

On the first start, Powerlevel10k opens its configuration wizard. Complete the
wizard to select the prompt style, transient prompt behavior, and other
appearance options.

## autoenv

Install `autoenv` from its
[official repository](https://github.com/hyperupcall/autoenv). It loads
project-specific environment settings when you enter a directory:

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

Reload the configuration to make the integration available:

```bash
source ~/.zshrc
```

## copypath

Enable the `copypath` plugin included with Oh My Zsh. It copies the current
directory's absolute path to the clipboard and does not require a separate
installation:

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

Reload the configuration after updating `~/.zshrc` to register the command:

```bash
source ~/.zshrc
```

## copyfile

Enable the `copyfile` plugin included with Oh My Zsh. It copies a file's
contents to the clipboard and does not require a separate installation:

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

Reload the configuration after updating `~/.zshrc` to register the command:

```bash
source ~/.zshrc
```

## Example configuration

The repository includes a complete [`.zshrc` example](.zshrc) that combines
the theme and plugins described above. Optionally link it to `~/.zshrc` when
you want the active Zsh configuration to synchronize automatically after
`git pull`:

```bash
ln -sfn ~/environment_configuration_terminal/zsh/.zshrc ~/.zshrc
```

If you do not want automatic synchronization, manage `~/.zshrc` separately.
Copy the repository file to `~/.zshrc` instead:

```bash
cp ~/environment_configuration_terminal/zsh/.zshrc ~/.zshrc
```

This creates a local copy, so repeat the copy after repository updates when
you want to use them. Review the plugin list and personal settings first:
either approach replaces the existing `~/.zshrc` file. Afterwards, reload Zsh
with `source ~/.zshrc`.
