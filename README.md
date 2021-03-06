# dotfiles

My bash and vim setups!

### nvim Setup:
- config file for neovim is at `~/.config/nvim/init.vim`
- open neo vim with command `nvim`
- use following commands to install plugins:
```
:PlugInstall [name ...] [#threads]	Install plugins
:PlugUpdate [name ...] [#threads]	Install or update plugins
:PlugClean[!]	Remove unlisted plugins (bang version will clean without prompt)
:PlugUpgrade	Upgrade vim-plug itself
```

----------

### Inspirations:
- ThePrimeagen
  - https://www.youtube.com/watch?v=n9k9scbTuvQ (video guide on getting started with .vimrc)
  - https://github.com/erkrnt/awesome-streamerrc/blob/master/ThePrimeagen/init.vim

### vim cheatsheet:
![cheatsheet](http://www.viemu.com/vi-vim-cheat-sheet.gif)

----------

### Instructions
#### YouCompleteMe:

1. create undo directory
```
mkdir ~/.vim/undodir -p
```

2. install plug: https://github.com/junegunn/vim-plug

3. open vim and run `:PlugInstall`

4. YouCompleteMe install
```
$ cd ~/.vim/plugged/YouCompleteMe
$ ./install.py
```
