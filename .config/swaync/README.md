Configuration files for swaync. To use copy & paste to your `~/.config`, but see the note bellow

## buttons-grid

buttons-grid swaync module uses four of my scripts (To be exact: **"quiet"**, **"microphone"**, **caffeine**, **light theme switcher** ), That means you can't really just copy it and it will work out of the box.

### What should I do?

By default, `config.json` will look to `~/.local/bin/` for these scripts:

- [powerprofile](https://github.com/cebem1nt/dotfiles/blob/main/.local/bin/powerprofile): Sets quiet / balanced mode.

- [caffeine](https://github.com/cebem1nt/dotfiles/blob/main/.local/bin/caffeine): idle inhibitor

- [mictoggle](https://github.com/cebem1nt/dotfiles/blob/main/.local/bin/mictoggle): toggles microphone state on / off

- [themesw](https://github.com/cebem1nt/dotfiles/blob/main/.local/bin/themesw): Sets light theme on click

You can replace buttons definitions with some of yours, or copy these scripts into `~/.local/bin/`