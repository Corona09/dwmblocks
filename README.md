# dwmblocks

Modular status monitor for dwm written in C.

# Usage

`dwmblocks [-d delimiter]`

# Modifying blocks

Blocks are added and removed by editing the blocks.h file. Read it for more
info.

# Colored output and clickability

The patches folder contains a patch for dwm which is required for dwmblocks to
function properly. It adds support for colored text, clickability and cursor
hinting when hovering on text output of clickable blocks (inspired by polybar).

Clickability is inspired by the statuscmd patch for dwm. On clicking on text
corresponding to a clickable block, the program specified to handle clicks for
that block is executed with the first argument specifying which button was
clicked (1 for left, 2 for middle and 3 for right by default).

Colored output is inspired by the statuscolors patch for dwm. To add colors,
have your programs for the blocks output raw characters from '\x11' to '\x31'.
'\x11' in status text switches the active colorscheme to the first one in the
scheme array in dwm and so on. See
[statuscolors patch](https://dwm.suckless.org/patches/statuscolors/)
for more info. Keep in mind that you have to start from '\x11' instead of '\x01'
as instructed on the page.

# Signaling changes

To signal a specific block to update, run `sigdwmblocks signal [sigval]`.
`sigval` is optional and must be an integer. When not provided it defaults to 0.
`sigval` is passed as the first argument to the program specified for updating
the block.

# xgetrootname

It is a small program to get the current root name. May prove helpful in
debugging.

# Installation

Clone the repository and run `make clean install` after getting in the project
directory. By default the program is installed in `$HOME/.local/bin`. If
xgetrootname is required run `make xgetrootname`.

# Acknowledgements

Some ideas and code was taken from other projects. Credits for those go to -

* torrinfail ([original dwmblocks implementation](https://github.com/torrinfail/dwmblocks))
* Daniel Bylinka ([statuscmd patch for dwm](https://dwm.suckless.org/patches/statuscmd/))
* Jeremy Jay ([statuscolors patch for dwm](https://dwm.suckless.org/patches/statuscolors/))