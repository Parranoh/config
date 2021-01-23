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

## Oh My Zsh
To automatically update custom plugins and themes along with Oh My Zsh, put this
at the end of `$ZSH/tools/upgrade.sh`:

```sh
printf "\n${BLUE}%s${RESET}\n" "Updating custom plugins and themes"
cd custom/
for plugin in plugins/*/ themes/*/
do
  if [[ -d "$plugin/.git" ]]
  then
     printf "${YELLOW}%s${RESET}\n" "${plugin%/}"
     git -C "$plugin" pull
  fi
done
```
