#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'


PS1='[\u@\h \W]\$ '

# load api keys
if [ -f ~/.secrets ]; then
    source ~/.secrets
fi

# load colorscheme from cache (wal)
if [ -f ~/.cache/wal/sequences ]; then
    (cat ~/.cache/wal/sequences &)
fi

# theme
alias theme='function _wal() { wal -i "$1"; gsettings set org.gnome.desktop.background picture-uri-dark "file://$(cat ~/.cache/wal/wal)"; gsettings set org.gnome.desktop.background picture-uri "file://$(cat ~/.cache/wal/wal)"; }; _wal'

# ----- TO DO ------
todo() {
    local NOTES_DIR="$HOME/notes"
    # nvim + jump to last line
    local EDITOR_CMD="nvim" 
    local JUMP_TO_END="+$"
    mkdir -p "$NOTES_DIR"

    case "$1" in
        # Yesterday
        ye)
            local TARGET_DATE=$(date -d "yesterday" +%Y_%m_%d)
            "$EDITOR_CMD" "$JUMP_TO_END" "$NOTES_DIR/${TARGET_DATE}_TODO.md"
            ;;
        # Today
        td|new)
            local TARGET_DATE=$(date +%Y_%m_%d)
            "$EDITOR_CMD" "$JUMP_TO_END" "$NOTES_DIR/${TARGET_DATE}_TODO.md"
            ;;
        # Tomorrow
        tm)
            local TARGET_DATE=$(date -d "tomorrow" +%Y_%m_%d)
            "$EDITOR_CMD" "$JUMP_TO_END" "$NOTES_DIR/${TARGET_DATE}_TODO.md"
            ;;
        # Default: Open the latest file
        "")
            local LATEST=$(ls "$NOTES_DIR"/*_TODO.md 2>/dev/null | sort | tail -n 1)
            if [[ -n "$LATEST" ]]; then
                "$EDITOR_CMD" "$JUMP_TO_END" "$LATEST"
            else
                echo "No TODO files found. Creating today's file..."
                local TARGET_DATE=$(date +%Y_%m_%d)
                "$EDITOR_CMD" "$JUMP_TO_END" "$NOTES_DIR/${TARGET_DATE}_TODO.md"
            fi
            ;;
        # Help for typos
        *)
            echo "Usage: todo [ye|td|tm|new]"
            return 1
            ;;
    esac
}
# ----- TO DO ------

. "$HOME/.local/bin/env"
