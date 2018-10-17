#!/usr/bin/python3

import collections
import os

Symlink = collections.namedtuple("Symlink", ["src", "dst"])


symlinks = [
    Symlink("~/.config/editorconfig/.editorconfig", "~/.editorconfig"),
    Symlink("~/.config/tmux/.tmux.conf", "~/.tmux.conf"),
    Symlink("~/.config/zsh/.zshrc", "~/.zshrc"),
]


def clean():
    for symlink in symlinks:
        try:
            os.remove(os.path.expanduser(symlink.dst))
        except OSError as e:
            # Ignore the error thrown if the symlink doesn't already exist
            continue


def run():
    clean()
    for symlink in symlinks:
        os.symlink(os.path.expanduser(symlink.src), os.path.expanduser(symlink.dst))


if __name__ == "__main__":
    run()
