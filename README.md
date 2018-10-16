# .config

Configuration files for various things

## Overview

Certain software store configuration files in `~/.config/<name>` directories.  I
like this convention, and I've moved config for software which doesn't natively
support `~/.config` to here anyway. `install.py` symlinks things to the right
places.

## Install

```sh
git clone github.com/jamesroutley/dot-config ~/.config
cd ~/.config && python install.py  # Be careful, this is a destructive operation
```
