#ª/bin/sh
#Script para comprobar lo que ocupan las carpetas en home. He decidido ordenarlo por tamnio, usando el sort.

#du significa "disk usage", -h implica "human readable", la maxima profundidad del arbol la he puesto en '1'.
du -h --max-depth=1 /home/ | sort -hr


