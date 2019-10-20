# .config

Configuration files for various things

## Overview

Certain software store configuration files in `~/.config/<name>` directories.  I like this convention, and I've moved config for software which doesn't natively support `~/.config` to here anyway.

## Install

```sh
git clone github.com/jamesroutley/dot-config ~/.config
cd ~/.config
make link
```

## Git ignore

The `.gitignore` file is set up to only watch explicitly included files and directories, so we don't accidentally commit unexpected applications' config
