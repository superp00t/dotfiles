# read bash aliases
source ~/.bash_aliases

# enable fzf niceties
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# enable vim mode
bindkey -v

if [ -d "$HOME/lua-language-server/bin" ]; then
    PATH="$HOME/lua-language-server/bin":$PATH
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin":$PATH
fi

if [ -d "$HOME/go/bin" ]; then
    PATH="$HOME/go/bin":$PATH
fi

if [ -d "/usr/local/osxcross/bin" ]; then
    PATH="/usr/local/osxcross/bin":$PATH
fi

# load .env file
[ -f "$HOME/.env" ] && source "$HOME/.env"

# define utility functions

update-album-titles() {
    local file base title

    for file in "$@"; do
        if [[ ! -f "$file" ]]; then
            echo "Skipping (not a file): $file" >&2
            continue
        fi

        # Strip directory and .flac extension
        base="${file##*/}"
        base="${base%.[fF][lL][aA][cC]}"

        # Strip leading digits (any number of zeroes) and following whitespace
        title="${base#"${base%%[![:digit:]]*}"}"
        title="${title#"${title%%[![:space:]]*}"}"

        if [[ -z "$title" ]]; then
            echo "Skipping (empty title after parsing): $file" >&2
            continue
        fi

        echo "$file: setting title to $title"
        metaflac --remove-tag=TITLE --set-tag="TITLE=$title" "$file" \
            || echo "metaflac failed on: $file" >&2
    done
}
