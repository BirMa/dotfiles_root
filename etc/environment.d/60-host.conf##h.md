# Host-specific environment for md. yadm alternate: linked as 60-host.conf only on host md.
# Overrides /etc/environment.d/50-global.conf.

# dark mode
#GTK_THEME=Adwaita:dark # gtk-4 settings.ini and gsettings don't do anything
GTK_THEME=Adwaita-dark
# these make qt apps respect my dark-mode preference (by looking at my gtk3 settings)
QT_QPA_PLATFORMTHEME=gtk3

PATH=${PATH}:/opt/unreal-engine/Engine/Binaries/Linux/
