#!/bin/bash

# APT/Flatpak APP TELEPITO SCRIPT

zenity --question --text='!!  Valtottal Wayland-re?  !!' --width='300' --height='100'
if [[ $? -eq 1 ]]; then
   echo Cancelled by $USER. Exiting!
   exit 1
fi


# Text modifiers
bold=$(tput bold)      # ${bold}
normal=$(tput sgr0)    # ${normal}
yellow=$(tput setaf 3) # ${yellow}


# Zenity ablak megjelenítése
user_choice=$(zenity --list --checklist --width='1000' --height='700' \
  --title="APP Telepítő Script base by Airman & RAVE (Magyarosította balage79)" \
  --text="Válassz az alábbi programok közül:" \
  --column="Válassz" --column="Programnév / Leírás" \
  FALSE "GNOME Screenshot - gyorsbillentyűs képernyőkép létrehozás" \
  FALSE "GNOME Clocks - ébresztő, világóra, stopper, időzítő" \
  FALSE "Steam Launcher" \
  FALSE "Heroic Launcher - Epic Games Launcher Linux verziója" \
  FALSE "GameMode" \
  FALSE "XanMod - Gaming Kernel AMD GPU-hoz. Steamhez KELL!" \
  FALSE "Liquorix - Gaming kernel Nvidia GPU-hoz, Steamhez KELL!" \
  FALSE "Oibaf AMD Driver 24.0 Erosen Beta, Lehetseges Laggok, Akadasok, viszont a legfrissebb" \
  FALSE "PeaZip - tömörítő program" \
  FALSE "Neofetch - terminálos rendszerinfó megjelenítő" \
  FALSE "Input-Remapper 2.0 - egér/bill. gomb konfiguráló, macro író progi" \
  FALSE "Mumble - hang alapú csevegőalkalmazás" \
  FALSE "Lutris - Game launchereket, és egyéb appokat futtató környezet" \
  FALSE "KVM QEMU - virtualizáció, virtuális gépek futtatása" \
  FALSE "CoreCTRL - AMD GPU beállító alkalmazás" \
  FALSE "Docker - Ha tudod mi ez akkor KELL Neked" \
  FALSE "OBS - Nyílt forrású felvételkészítő és streamelő program" \
  FALSE "Firejail - Bongeszo Zart Kontener" \
  FALSE "Vivaldi - webböngésző" \
  FALSE "Brave - webböngésző" \
  FALSE "Librewolf - Firefox ESR alapú webböngésző" \
  FALSE "FreeTube - Adatlopás-mentes YouTube-kliens" \
  FALSE "DosBox - Régi, DOS-os játék emulátor" \
  FALSE "Pavucontrol - Apponkénti hangerőszabályzás/konfigurálás" \
  FALSE "KeepassXC - Jelszókezelő, az adatbázist titkosítva tárolja a PC-n" \
  FALSE "Cider - Apple Music Player Linuxra" \
  FALSE "Spotify - Zenelejátszó Linuxra" \
  FALSE "Darktable - Adobe Lightroom Linuxos megfelelője" \
  FALSE "VLC - médialejátszó" \
  FALSE "QBittorrent - torrent kliens" \
  FALSE "Flatseal - Flatpak app jogosultság beállító" \
  FALSE "Telegram - Titkosított üzenetküldő" \
  FALSE "Signal - Titkosított üzenetküldő" \
  FALSE "Kdenlive - Linuxos videószerkesztő program" \
  FALSE "Gnome Extension Manager - Gnome bővítménykezelő" \
  FALSE "PhotoGIMP - Adobe Photoshop-szerű képszerkesztő Linuxra" \
  FALSE "Discord - VoIP-, és csevegőalkalmazás" \
  FALSE "Easy Effects - Hangkártyát vezérlő program (Hangeffektek)" \
  FALSE "Parabolic - Videóletöltő, működik minden platformon" \
  FALSE "Vibrant - Szín szaturáció beállító program" \
  TRUE  "User beállítások! NE SZEDD KI A PIPÁT!" \
  FALSE "Csak a FO Monitoron jelenjen meg a Login Screen - Tobb monitoros setupoknal" \
  FALSE "MangoHud/Goverlay - MSI Afterburner Linuxos megfelelője, FPS kijelzés, stb." \
  FALSE "Double Commander - Total Commander Linuxos megfelelője" \
  FALSE "Midnight Commander - 2 ablakos file kezelő" \
  FALSE "Windows 11 Telepítő - Csak Profiknak!")

if [[ $user_choice = *"GNOME Screenshot - gyorsbillentyűs képernyőkép létrehozás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GNOME Screenshot - DEB Pkg${normal}
  echo
  sudo apt install gnome-screenshot -y
  echo
  echo ${bold}${yellow}GNOME Screenshot ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"GNOME Clocks - ébresztő, világóra, stopper, időzítő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GNOME Clocks - DEB Pkg${normal}
  echo
  sudo apt install gnome-clocks -y
  sudo rsync -ap --info=progress2 /usr/share/sounds/Yaru/stereo/complete.oga /usr/share/sounds/freedesktop/stereo/
  sudo rsync -ap --info=progress2 alarm-clock*.oga /usr/share/sounds/freedesktop/stereo
  echo
  echo ${bold}${yellow}GNOME Clocks with sound changes ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Steam Launcher"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Steam Launcher - DEB Pkg${normal}
  echo
  sudo apt install steam-installer -y
  sudo chmod +x update-proton-ge
  ./update-proton-ge
  echo
  echo ${bold}${yellow}Steam + Latest ProtonGE ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Heroic Launcher - Epic Games Launcher Linux verziója"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Heroic Launcher - flatpak with MangoHud${normal}
  echo
  flatpak install flathub com.heroicgameslauncher.hgl -y
  flatpak installruntime/org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/21.08 -y
  flatpak installruntime/org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/22.08 -y
  flatpak installruntime/org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/23.08 -y
  flatpak override --user --filesystem=xdg-config/MangoHud:ro
  echo
  echo ${bold}${yellow}Heroic Launcher with MangoHud ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"GameMode"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GameMode - DEB Pkg${normal}
  echo
  sudo apt install gamemode -y
  echo
  echo ${bold}${yellow}GameMode ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"XanMod - Gaming Kernel AMD GPU-hoz. Steamhez KELL!"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}XanMod - Gaming Kernel AMD - DEB Pkg${normal}
  echo
  wget -qO - https://dl.xanmod.org/archive.key | sudo gpg --dearmor -o /usr/share/keyrings/xanmod-archive-keyring.gpg
  echo 'deb [signed-by=/usr/share/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-release.list
  sudo apt update && sudo apt install linux-xanmod-x64v4 -y
  echo
  echo ${bold}${yellow}XanMod - Gaming Kernel AMD ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Liquorix - Gaming Kernel Nvidia GPU-hoz - Steamhez KELL!"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Liquorix - Gaming Kernel Nvidia - DEB Pkg${normal}
  echo
  curl -s 'https://liquorix.net/install-liquorix.sh' | sudo bash
  echo
  echo ${bold}${yellow}Liquorix  - Gaming Kernel Nvidia ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Oibaf AMD Driver 24.0 Erosen Beta, Lehetseges Laggok, Akadasok, viszont a legfrissebb"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Oibaf AMD Driver 24.0 - DEB Pkg${normal}
  echo
  sudo add-apt-repository ppa:oibaf/graphics-drivers -y
  sudo rsync -ap --info=progress2 oibaf-pin1002 /etc/apt/preferences.d/
  sudo apt update
  sudo apt upgrade -y --allow-downgrades
  echo
  echo ${bold}${yellow}Oibaf AMD Driver 24.0 ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"PeaZip - tömörítő program"* ]]; then
  echo
  echo Installing ${bold}${yellow}PeaZip - flatpak${normal}
  echo
  flatpak install flathub io.github.peazip.PeaZip -y
  echo
  echo ${bold}${yellow}PeaZip ${normal}installed.
  echo
fi

if [[ $user_choice = *"Neofetch - terminálos rendszerinfó megjelenítő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Neofetch - DEB Pkg${normal}
  echo
  sudo apt install neofetch -y
  echo
  echo ${bold}${yellow}Neofetch ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Input-Remapper 2.0 - egér/bill. gomb konfiguráló, macro író progi"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Input-Remapper 2.0 - DEB Pkg${normal}
  echo
  sudo apt install build-essential libpython3-dev libdbus-1-dev python3-evdev python3-pydbus libgtksourceview-4-dev python3-pydantic libavahi-compat-libdnssd1 gettext -y
  sudo dpkg -i input-remapper*.deb
  echo
  echo ${bold}${yellow}Input-Remapper 2.0 ${normal}installed.
  echo ---------------------------------------------
  echo
fi


if [[ $user_choice = *"Mumble - hang alapú csevegőalkalmazás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Mumble - DEB Pkg${normal}
  echo
  sudo apt install libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5sql5 libqt5svg5 libqt5widgets5 libqt5xml5 libspeexdsp1 -y
  sudo apt install mumble -y
  echo
  echo ${bold}${yellow}Mumble ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Lutris - Game launchereket, és egyéb appokat futtató környezet"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Lutris - flatpak with MangoHud - flatpak${normal}
  echo
  flatpak install flathub net.lutris.Lutris -y
  flatpak installruntime/org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/21.08 -y
  flatpak installruntime/org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/22.08 -y
  flatpak install runtime/org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/23.08 -y
  flatpak override --user --filesystem=xdg-config/MangoHud:ro
  echo
  echo ${bold}${yellow}Lutris with MangoHud compatibility ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"KVM QEMU - virtualizáció, virtuális gépek futtatása"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}KVM QEMU - DEB Pkg${normal}
  echo
  sudo apt install libvirt0 libvirt-daemon libvirt-daemon-system-systemd libvirt-daemon-config-network libvirt-daemon-config-nwfilter libvirt-daemon-system-systemd libfdt1 libibverbs1 libpmem1 librdmacm1 libslirp0 qemu-system-common qemu-system-data seabios ipxe-qemu ipxe-qemu-256k-compat-efi-roms gir1.2-gtk-vnc-2.0 gir1.2-libosinfo-1.0 gir1.2-libvirt-glib-1.0 python3-libvirt virtinst -y
  sudo apt install qemu-system-x86 qemu-utils libvirt-daemon-system libvirt-clients bridge-utils virt-manager ovmf -y
  sudo usermod -aG kvm $USER
  sudo usermod -aG input $USER
  sudo usermod -aG libvirt $USER
  # qemu.conf sed parancs $USER-el hogy ne kelljen kezzel csinalni
  echo
  echo ${bold}${yellow}KVM QEMU ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"CoreCTRL - AMD GPU beállító alkalmazás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}CoreCTRL and User Settings - DEB Pkg${normal}
  echo
  sudo add-apt-repository ppa:ernstp/mesarc -y
  sudo apt install libbotan-2-19 libqt5charts5 libqt5qml5 libqt5quick5 libquazip5-1 qml-module-qtquick2 qml-module-qtquick-controls2 qml-module-qtquick-layouts qml-module-qtquick-window2 qml-module-qt-labs-platform qml-module-qtcharts vulkan-tools -y
  sudo apt update
  sudo apt install corectrl -y
  sudo kernelstub -o "amdgpu.ppfeaturemask=0xffffffff"
  cp /usr/share/applications/org.corectrl.CoreCtrl.desktop ~/.config/autostart/org.corectrl.CoreCtrl.desktop
  echo "Identity=unix-group:$USER" >> 90-corectrl.pkla
  sudo rsync -ap --info=progress2 90-corectrl.pkla /etc/polkit-1/localauthority/50-local.d/
  echo
  echo ${bold}${yellow}CoreCTRL and User settings ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Docker - Ha tudod mi ez akkor KELL Neked"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Docker - DEB Pkg${normal}
  echo
  sudo apt-get install ca-certificates curl gnupg -y
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg
  echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "jammy")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
  echo
  echo ${bold}${yellow}Docker ${normal}installed.
  echo ---------------------------------------------
  echo
fi


if [[ $user_choice = *"OBS - Nyílt forrású felvételkészítő és streamelő program"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}OBS Studio - flatpak${normal}
  echo
  flatpak install flathub com.obsproject.Studio -y
  echo
  echo ${bold}${yellow}OBS Studio ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Firejail - Bongeszo Zart Kontener"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}FireJail${normal}
  echo
  sudo apt install firejail -y
  echo
  echo ${bold}${yellow}FireJail ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Vivaldi - webböngésző"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Vivaldi - DEB Pkg${normal}
  echo
  sudo nala install ffmpeg -y
  wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/vivaldi-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/vivaldi-archive-keyring.gpg] https://repo.vivaldi.com/archive/deb/ stable main" | sudo tee /etc/apt/sources.list.d/vivaldi.list
  sudo apt update
  sudo apt install vivaldi-stable -y
  echo
  echo ${bold}${yellow}Vivaldi ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Brave - webböngésző"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Brave - flatpak${normal}
  echo
  sudo nala install ffmpeg -y
  flatpak install flathub com.brave.Browser -y
  echo
  echo ${bold}${yellow}Brave ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Librewolf - Firefox ESR alapú webböngésző"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Librewolf - flatpak${normal}
  echo
  sudo nala install ffmpeg -y
  flatpak install flathub io.gitlab.librewolf-community -y
  echo
  echo ${bold}${yellow}LibreWolf ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"FreeTube - Adatlopás-mentes YouTube-kliens"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}FreeTube - flatpak${normal}
  echo
  flatpak install flathub io.freetubeapp.FreeTube -y
  echo
  echo ${bold}${yellow}FreeTube ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"DosBox - Régi, DOS-os játék emulátor"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}DosBox Staging - flatpak${normal}
  echo
  sudo apt install libsdl-sound1.2 -y
  flatpak install flathub io.github.dosbox-staging -y
  echo
  echo ${bold}${yellow}DosBox - Staging ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Pavucontrol - Apponkénti hangerőszabályzás/konfigurálás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Pavucontrol - DEB Pkg${normal}
  echo
  sudo apt install pavucontrol -y
  echo
  echo ${bold}${yellow}Pavucontrol ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"KeepassXC - Jelszókezelő, az adatbázist titkosítva tárolja a PC-n"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}KeepassXC - flatpak${normal}
  echo
  flatpak install flathub org.keepassxc.KeePassXC -y
  echo
  echo ${bold}${yellow}KeePassXC ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Cider - Apple Music Player Linuxra"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Cider - flatpak${normal}
  echo
  flatpak install flathub sh.cider.Cider -y
  echo
  echo ${bold}${yellow}Cider ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Spotify - Zenelejátszó Linuxra"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Spotify - flatpak${normal}
  echo
  flatpak install flathub com.spotify.Client -y
  echo
  echo ${bold}${yellow}Spotify ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Darktable - Adobe Lightroom Linuxos megfelelője"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Darktable - flatpak${normal}
  echo
  flatpak install flathub org.darktable.Darktable -y
  echo
  echo ${bold}${yellow}Darktable ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"VLC - médialejátszó"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}VLC Media Player - flatpak${normal}
  echo
  sudo nala install ffmpeg -y
  flatpak install flathub org.videolan.VLC -y
  echo
  echo ${bold}${yellow}VLC Media Player ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"QBittorrent - torrent kliens"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}QBittorrent - flatpak${normal}
  echo
  flatpak install flathub org.qbittorrent.qBittorrent -y
  echo
  echo ${bold}${yellow}QBittorrent ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Flatseal - Flatpak app jogosultság beállító"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Flatseal - flatpak${normal}
  echo
  flatpak install flathub com.github.tchx84.Flatseal -y
  echo
  echo ${bold}${yellow}Flatseal ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Telegram - Titkosított üzenetküldő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Telegram - flatpak${normal}
  echo
  flatpak install flathub org.telegram.desktop -y
  echo
  echo ${bold}${yellow}Telegram ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Signal - Titkosított üzenetküldő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Signal - flatpak${normal}
  echo
  flatpak install flathub org.signal.Signal -y
  echo
  echo ${bold}${yellow}Signal ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Kdenlive - Linuxos videószerkesztő program"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Kdenlive - flatpak${normal}
  echo
  echo ${bold}${yellow}Kdenlive ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Gnome Extension Manager - Gnome bővítménykezelő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Gnome Extension Manager - DEB Pkg${normal}
  echo
  sudo apt install gnome-shell-extensions -y
  sudo rsync -ap --info=progress2 gnome-shell /home/$USER/.local/share/
  sudo rsync -ap --info=progress2 burn-my-windows /home/$USER/.config/
  echo
  echo ${bold}${yellow}Gnome Extension Manager & All Gnome Extensions ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"PhotoGIMP - Adobe Photoshop-szerű képszerkesztő Linuxra"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}PhotoGIMP- flatpak${normal}
  echo
  flatpak install flathub org.gimp.GIMP -y
  sudo rsync -ap --info=progress2 PhotoGIMP/. ~/
  echo
  echo ${bold}${yellow}GIMP with PhotoGIMP Addon ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Discord - VoIP-, és csevegőalkalmazás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Discord - flatpak${normal}
  echo
  sudo nala install ffmpeg -y
  flatpak install flathub com.discordapp.Discord -y
  echo
  echo Installing ${bold}${yellow}Vencord Discord Plugin${normal}
  echo
  sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
  echo
  echo ${bold}${yellow}Discord / Vencord ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Easy Effects - Hangkártyát vezérlő program (Hangeffektek)"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Easy Effects - flatpak${normal}
  echo
  flatpak install flathub com.github.wwmm.easyeffects -y
  echo
  echo ${bold}${yellow}Easy Effects ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Parabolic - Videóletöltő, működik minden platformon"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Parabolic - flatpak${normal}
  echo
  flatpak install flathub org.nickvision.tubeconverter -y
  echo
  echo ${bold}${yellow}Parabolic ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Vibrant - Szín szaturáció beállító program"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Vibrant - flatpak${normal}
  echo
  flatpak install flathub io.github.libvibrant.vibrantLinux -y
  echo
  echo ${bold}${yellow}Vibrant ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"User beállítások! NE SZEDD KI A PIPÁT!"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}User settings${normal}
  echo
  sudo nala install ffmpeg -y
  sudo rsync -ap --info=progress2 raveos-bg.png /usr/share/backgrounds/
  sudo rsync -ap --info=progress2 gnome-shell /home/$USER/.local/share/
  sudo rsync -ap --info=progress2 burn-my-windows /home/$USER/.config/
  sudo apt install git -y
  git clone --depth=1 https://github.com/realmazharhussain/gdm-tools.git
  cd gdm-tools
  sudo rsync -ap --info=progress2 install.sh gdm-settings/
  ./install.sh
  cd -
  set-gdm-theme set Yaru-purple-dark /usr/share/backgrounds/raveos-bg.png
  sudo update-initramfs -u
  dconf load / < raveui-*
  sudo apt update
  sudo apt upgrade -y
  echo
  echo ${bold}${yellow}User settings ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Csak a FO Monitoron jelenjen meg a Login Screen - Tobb monitoros setupoknal"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Only main monitor on login${normal}
  echo
  zenity --warning --text='!!  SWITCH TO PRIMARY MONITOR ONLY  !!' --width='300' --height='100'
  sudo cp ~/.config/monitors.xml /var/lib/gdm3/.config/monitors.xml
  sudo chown gdm:gdm /var/lib/gdm3/.config/monitors.xml
  echo
  echo ${bold}${yellow}Only main monitor on login ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"MangoHud/Goverlay - MSI Afterburner Linuxos megfelelője, FPS kijelzés, stb."* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}MangoHud/Goverlay - built from source${normal}
  echo
  sudo apt install meson ninja-build gcc g++ glslang-dev glslang-tools libxnvctrl-dev git libx11-dev lazarus-ide mesa-common-dev breeze -y
  sudo dpkg -i libqt5pas1*.deb
  sudo dpkg -i libqt5pas-dev*.deb
  sudo apt install -f -y
  sudo dpkg -i libqt5pas1*.deb
  sudo dpkg -i libqt5pas-dev*.deb
  sudo mkdir -p /home/$USER/.mangohud
  sudo chown -R $USER:$GROUP /home/$USER/.mangohud
  cd /home/$USER/.mangohud
  git clone --recurse-submodules https://github.com/flightlessmango/MangoHud.git
  cd MangoHud
  meson build
  sudo ninja -C build install
  cd -
  git clone https://github.com/benjamimgois/goverlay.git
  cd goverlay
  make
  sudo make install
  cd -
  sudo rm -rf /home/$USER/.mangohud
  echo
  echo ${bold}${yellow}MangoHud/Goverlay - built from source ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Double Commander - Total Commander Linuxos megfelelője"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Double Commander - DEB Pkg${normal}
  echo
  sudo apt install doublecmd-gtk -y
  echo
  echo ${bold}${yellow}Double Commander ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Midnight Commander - 2 ablakos file kezelő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Midnight Commander - DEB Pkg${normal}
  echo
  sudo apt install mc -y
  echo
  echo ${bold}${yellow}Midnight Commander ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Windows 11 Telepítő - Csak Profiknak"* ]]; then
  zenity --warning --text='!! MAJOM VAGY !!' --width='300' --height='100'
fi

# Script END
zenity --question --title='Restart required!' --text='Restart in 5 seconds?' --width='300' --height='100'
if [ $? = 0 ]; then
  echo
  echo ${bold}${yellow}Restarting the computer in 5s...${normal}
  echo

(
echo "0" ; 
echo "# Restart in 5s" ; sleep 1
echo "20" ; 
echo "# Restart in 4s" ; sleep 1
echo "40" ; 
echo "# Restart in 3s" ; sleep 1
echo "60" ; 
echo "# Restart in 2s" ; sleep 1
echo "80" ; 
echo "# Restart in 1s" ; sleep 1 

) |
zenity --progress \
 --title="All apps are Installed!" --width='300' \
 --text="Restart" \
 --auto-close \
 --no-cancel
 sudo reboot;
 else
 echo ${bold}${yellow}User exited the script. Ending!${normal}
 exit 0;
fi



