alias la='ls -la'
alias ll='ls -la'
export PATH=/usr/local/Cellar/curl/7.57.0/bin:/usr/local/Cellar/openssl/1.0.**/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$PATH:/usr/local/bin:/usr/local/sbin

# setting for node
export PATH=$HOME/.nodebrew/current/bin:$PATH


# setting for php
# export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/php@7.1/lib"
export CPPFLAGS="-I/usr/local/opt/php@7.1/include"
export PATH=$PATH:$HOME/.composer/vendor/bin

# setting for python
export PYENV_ROOT=~/.pyenv
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"


# setting for golang
export GOPATH=~/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export PORT=5000
export DATABASE_URL=postgres://admin:admin@localhost:5432/demo?sslmode=disable


# setting for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
#rbenv global 2.5.0
 
