umask 022
ulimit -c 0

export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export PAGER=less
# lsのカラー化
# LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35'
# export LS_COLORS
# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=cxfxexdxbxegedabagacad
# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
alias ls='ls -FG'
alias grep='grep --color=auto'

if [ ! -d "${HOME}/.vim/bundle" ]; then
     echo "install neobundle."
     which git && curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
fi

if [[ `uname` == 'Darwin' ]]; then
    export EDITOR=vim
    export PATH=/usr/local/heroku/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$HOME/local/bin:$PATH
    export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
    alias brew-upgrade-outdated="brew update && brew outdated | awk '{print $1}' | xargs brew upgrade"
    export PATH=/usr/texbin:$PATH
    # added by travis gem
    [ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

    GOVERSION=$(brew list go | head -n 1 | cut -d '/' -f 6)
    export GOROOT=$(brew --prefix)/Cellar/go/$GOVERSION/libexec
    export GOPATH=$HOME/src/go
    export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:$GOPATH/bin:$PATH
    . `brew --prefix`/etc/profile.d/z.sh
elif [[ `uname` == 'Linux' ]]; then
    alias composer="hhvm -v ResourceLimit.SocketDefaultTimeout=30 -v Http.SlowQueryThreshold=30000 /usr/local/bin/composer"
fi

if [[ -f ~/.bash_secret ]]; then
    . ~/.bash_secret
fi

alias bex="bundle exec"
