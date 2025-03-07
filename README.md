## Install
```bash
sudo apt-get install -y global exuberant-ctags cscope python3-pip vim-nox python3-full

git clone --recursive https://github.com/DavidPu/dotvim.git ~/.vim
cd ~/.vim
git submodule init
git submodule update --remote --recursive

python3 -m venv venv
source venv/bin/activate
pip3 install pynvim
pymodules=(pynvim msgpack jedi)
pip3 install --upgrade ${pymodules[@]}

 sed -i 's|/usr/bin/python3|~/.vim/venv/bin/python|g' vimrc


cd ~/.vim/bundle && git clone --recursive https://github.com/deoplete-plugins/deoplete-jedi && git submodule update --init
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
```
