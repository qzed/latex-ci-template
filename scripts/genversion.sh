echo "\makeatletter%"

if [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]]; then
    echo "\def\git@dirty{*}"
else
    echo "\def\git@dirty{}"
fi

git --no-pager log -1 --date=short --decorate=short --pretty=format:"\def\git@ref{%H}%
\def\git@shortref{%h}%
" HEAD

echo "\makeatother%"
