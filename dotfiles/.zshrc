# read bash aliases
source ~/.bash_aliases

# enable fzf niceties
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# enable vim mode
bindkey -v

if [ -d "$HOME/lua-language-server/bin" ]; then
    PATH="$HOME/lua-language-server/bin":$PATH
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin":$PATH
fi
