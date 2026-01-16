#!/usr/bin/python3

from gi.repository import Gio, GLib, GObject
import subprocess, os

CAFFEINE = os.path.join(
    os.path.expanduser("~/"), ".local/bin/caffeine"
) 

def on_changed_props(proxy, changed_props, invalidated_props):
    profile = changed_props["ActiveProfile"]

    if profile == "power-saver":
        subprocess.Popen([CAFFEINE, "--off"])
    else:
        subprocess.Popen([CAFFEINE, "--on"])

if __name__ == "__main__":
    loop = GLib.MainLoop()
    bus = Gio.bus_get_sync(Gio.BusType.SYSTEM, None)

    proc = subprocess.run(
        ["powerprofilesctl", "get"],
        text=True,
        capture_output=True
    )

    if not ("power-saver" in proc.stdout):
        subprocess.Popen([CAFFEINE, "--on"])

    proxy = Gio.DBusProxy.new_sync(
        bus, Gio.DBusProxyFlags.NONE, None,
        "net.hadess.PowerProfiles",
        "/net/hadess/PowerProfiles",
        "net.hadess.PowerProfiles", 
        None
    )

    proxy.connect("g-properties-changed", on_changed_props)
    loop.run()
