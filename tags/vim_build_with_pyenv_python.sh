#!/bin/bash
# https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
PY3CONFIG="~/.pyenv/versions/3.6.4/lib/python3.6/config-3.6m-x86_64-linux-gnu"
PY2CONFIG="~/.pyenv/versions/2.7.14/lib/python2.7/config"
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=${PY2CONFIG} \
            --enable-python3interp \
            --enable-python2interp \
            --with-python3-config-dir=${PY3CONFIG} \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/opt/vim  \
	    --enable-gui=auto

make -j12 VIMRCLOC=/opt/vim/etc VIMRUNTIMEDIR=/opt/vim/share/vim/vim81 MAKE="make -e"
