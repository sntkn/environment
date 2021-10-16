export PATH="/usr/local/sbin:$PATH"↲
alias la='ls -la'
alias ll='ls -la'

setopt nonomatch

# --------------
# cdr関連の設定
# --------------
setopt AUTO_PUSHD # cdしたら自動でディレクトリスタックする
setopt pushd_ignore_dups # 同じディレクトリは追加しない
DIRSTACKSIZE=100 # スタックサイズ
# cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# --------------
# 履歴関連の設定
# --------------
HISTFILE=~/.zsh_history #履歴ファイルの設定
HISTSIZE=1000000 # メモリに保存される履歴の件数。(保存数だけ履歴を検索できる)
SAVEHIST=1000000 # ファイルに何件保存するか
setopt extended_history # 実行時間とかも保存する
setopt share_history # 別のターミナルでも履歴を参照できるようにする
setopt hist_ignore_all_dups # 過去に同じ履歴が存在する場合、古い履歴を削除し重複しない
setopt hist_ignore_space # コマンド先頭スペースの場合保存しない
setopt hist_verify # ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_reduce_blanks #余分なスペースを削除してヒストリに記録する
setopt hist_save_no_dups # histryコマンドは残さない
setopt hist_expire_dups_first # 古い履歴を削除する必要がある場合、まず重複しているものから削除
setopt hist_expand # 補完時にヒストリを自動的に展開する
setopt inc_append_history # 履歴をインクリメンタルに追加


source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

setopt auto_cd
setopt no_beep


# Preztoのセットアップ
zinit snippet PZT::modules/helper/init.zsh

# oh-my-zshのセットアップ
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git # <- なんかおまじないらしい
zinit cdclear -q

# プロンプトのカスタマイズ
setopt promptsubst
zinit snippet OMZT::gnzh


zinit load zdharma/history-search-multi-word
zinit ice compile"*.lzui" from"notabug"
zinit load zdharma/zui
zinit ice from"gh-r" as"program"; zinit load junegunn/fzf-bin
zinit ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"; zinit load docker/compose
zinit ice as"program" atclone"rm -f src/auto/config.cache; ./configure" atpull"%atclone" make pick"src/vim"
zinit ice wait'!0'; zinit light vim/vim
zinit ice wait'!0'; zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zinit ice wait'!0'; zinit light tj/git-extras
#zinit ice wait'!0'; zinit light zsh-users/zsh-autosuggestions
#zinit ice wait'!0'; zinit light zdharma/fast-syntax-highlighting
zinit ice pick"async.zsh" src"pure.zsh"; zinit light sindresorhus/pure
# Gitの変更状態がわかる ls。ls の代わりにコマンド `k` を実行するだけ。
#zplugin ice pick'k.sh'
#zinit ice supercrabtree/k
zinit ice wait'!0'; zinit load "supercrabtree/k"


zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
  blockf \
    zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# history 
function select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | fzf --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle -R -c
}
zle -N select-history
bindkey '^r' select-history

zstyle ':completion:*' menu select


# ghq
function ghq-src () {
  local selected_dir=$(ghq list -p | fzf --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N ghq-src
bindkey '^l' ghq-src

# 現在の作業リポジトリをブラウザで表示する
alias hbr='hub browse'

eval "$(anyenv init -)"
