## retroverlay

Gentoo libretro overlay.


To use the overlay, add this in `/etc/portage/repos.conf/retroverlay.conf`:

```
[retroverlay]
location = /var/portage/retroverlay
sync-type = git
sync-uri = https://github.com/gen2brain/gentoo-retroverlay.git
masters = gentoo
auto-sync = yes
```
