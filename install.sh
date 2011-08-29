ln -s $HOME/src/dot-files/.emacs.el $HOME/.emacs.el
ln -s $HOME/src/dot-files/.bashrc $HOME/.bashrc
ln -s $HOME/src/dot-files/.zshenv $HOME/.zshenv
ln -s $HOME/src/dot-files/.zshrc $HOME/.zshrc
ln -s $HOME/src/dot-files/.gvimrc $HOME/.gvimrc
ln -s $HOME/src/dot-files/.vimrc $HOME/.vimrc
ln -s $HOME/src/dot-files/.vim $HOME/.vim
ln -s $HOME/src/dot-files/.screenrc $HOME/.screenrc
ln -s $HOME/src/dot-files/.lv $HOME/.lv

if [ ! -d .vim/bundle/vundle/.git ]; then
  git submodule add http://github.com/gmarik/vundle.git .vim/bundle/vundle
fi
