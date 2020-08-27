# config
A collection of useful configuration files

## Setup
The included `Makefile` can be used to put all files where they need to be (at
least on my machine), using symlinks. It will move any existing config file to
`~/.old`.

## p10k
If you'd rather like the right prompt elements in color 000 instead of 016, just
delete all lines containing the string `16` from `p10k.zsh`, for example using
`sed(1)`:

```sh
sed -ri '/16/d' p10k.zsh
```
