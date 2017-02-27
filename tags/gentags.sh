gentags() {
    files=tags.files
    find "$@"  -type f ! -name ".*" ! -path "*.git/*" ! -path "*Documentation*" > $files
    gtags -f $files
    ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++  -L $files
#    cscope -i$files
}
