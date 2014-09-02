# dotfiles

These are my personal dotfiles with the majority of the configuration around Vim. Feel free to base your own dotfiles on these, in fact, I encourage it. Using these settings blindly probably isn't a good idea though, it's set up exactly how I want things, not how you want them.

If you do wish to try any of this out though, all you have to do is source or symlink the config file from each directory. This varies depending on the tool. JSHint requires a symlink, but you can source with bash or Vim, for example.

Please [hit me on twitter][twitter] or some other medium, such as signal fires, if you have a question. I hope you find this useful!

## Installation (for my own benefit mainly)

All of these instructions assume the repository has been cloned into your home directory under the name `dotfiles`.


### tmux

Add this to `~/.tmux.conf`.

```
source-file $HOME/dotfiles/tmux/config.conf
```

### vim

Add this to `~/.vimrc`.

```vim
source $HOME/.vim/config.vim
```

### jshint

``bash
ln -s ~/dotfiles/jshint/config.json ~/.jshintrc
``
`
