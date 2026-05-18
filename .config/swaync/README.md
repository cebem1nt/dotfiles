# Swaync

Configuration files for swaync. To use copy & paste to your `~/.config`, ***but*** [see the note bellow](#buttons-grid)

<table>
  <tr>
    <td><img width="480" height="1080" alt="579648976-35eefadf-c996-4ba5-ae8d-d9131ec9f59b" src="https://github.com/user-attachments/assets/cdc50ecf-b36e-4b6b-9945-cb7d948d80b8" /></td>
    <td><img width="480" height="1080" alt="579648556-a1dfa789-ab78-4c54-94bc-4362003e86e6" src="https://github.com/user-attachments/assets/9d0601fb-6b0d-4af5-a299-2ab69c4358f5" /></td>
  </tr>
</table>

## buttons-grid

> [!IMPORTANT]
> `buttons-grid` module uses four of [my scripts](../../.local/bin/). ***That means you can't really just copy it and it will work out of the box.***

By default, `config.json` will look to `~/.local/bin/` for these scripts:

- [`powerprofile`](../../.local/bin/powerprofile): Sets quiet / balanced mode.

- [`caffeine`](../../.local/bin/caffeine): idle inhibitor

- [`mictoggle`](../../.local/bin/mictoggle): toggles microphone state on / off

- [`themesw`](../../.local/bin/themesw): Sets light theme on click

You can replace buttons definitions with some of yours, or copy these scripts into `~/.local/bin/`
