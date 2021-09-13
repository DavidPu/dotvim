## Install
```bash
sudo apt-get install global exuberant-ctags cscope python-pip python3-pip vim-nox

pymodules=(pynvim msgpack jedi)
pip3 install --user --upgrade ${pymodules[@]}
pip install --user --upgrade ${pymodules[@]}
git clone --recursive https://github.com/DavidPu/dotvim.git ~/.vim
cd ~/.vim
git submodule init
git submodule update
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
```
