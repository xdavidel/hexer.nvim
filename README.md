# hexer.nvim

Vim has this trick using xxd to open files as hex and vice versa:

In command mode - turn buffer to hex dumped text:
```
:%!xxd
```
Reverse that after editing with:
```
:%!xxd -r
```

I find myself having to use such functionality a lot, so -

I HEX YOU Neovim!

## What It Is

Currently it just takes the current buffer and opening it's hexdump
in another buffer using only lua.

I plan to give it a full editing capability so it could be used as
a total replacement for other tools.


## Getting Started

This section will guide for the necessary steps to start using this
plugin.

### Requirements

- [neovim (v0.6.0)](https://github.com/neovim/neovim/releases/tag/v0.6.0) or above.

### Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'xdavidel/hexer.nvim',
}
```

## Usage

Just open any desired buffer and use the command
```
Hexer
```

![usage](https://raw.githubusercontent.com/xdavidel/hexer.nvim/master/assets/usage.gif)
