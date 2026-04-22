Different kernel module configs used on my laptop with hybrid graphics

## Tour

- `nvidia.conf`: Module configuration for nvidia GPU driver.
- `blacklist.conf`: Module blacklist (nouveau)
- `v4l2loopback.conf`: Configuration for v4l2loopback used with [scrcpy](https://github.com/Genymobile/scrcpy)

### Nvidia

```txt
nvidia.conf
```
`options nvidia NVreg_UsePageAttributeTable=1`: Increases the comunication speed between iGPU and dGPU by enabling PAT. for more details see [this thread](https://bbs.archlinux.org/viewtopic.php?id=242007)

```txt
blacklist.conf
```
`blacklist nouveau`: Long story short, nobody loves nouveau on linux (only if you have an old gpu that is no more supported by oficial drivers) and generally it might just cause some problems when you don't expect it to