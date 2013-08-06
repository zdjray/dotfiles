#!/bin/sh

for name in *; do
    target="$HOME/.$name"
    if [[ -e "$target" ]]; then
        if [[ ! -L "$target" ]]; then
            echo "WARNING: $target exists but is not a symlink."
        fi
    else
        extension=${name##*.}
        if [[ "$extension" != "md" && "$extension" != "sh" ]]; then
            echo "Creating $target"
            ln -s "$PWD/$name" "$target"
        fi
    fi
done