#!/bin/sh
find . -name '*.h' | xargs sed -i 's/__STL_BEGIN_NAMESPACE/namespace std {/'
find . -name '*.h' | xargs sed -i 's/__STL_END_NAMESPACE/}/'
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
