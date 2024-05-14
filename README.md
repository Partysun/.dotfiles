## Install .dotfiles:

First, check out the .dotfiles repo in your $HOME directory

```
git clone git@github.com/Partysun/.dotfiles.git
cd dotfiles
```

then use [stow](https://www.gnu.org/software/stow/) to create symlinks

```bash
stow -v .
```

Want to simulate any stow action before execution ```-n```


Remove dotfiles:

```bash
stow -v -D .
```

Copy a new config to dotfiles folder first time:

```bash
stow -v --adopt .
```
