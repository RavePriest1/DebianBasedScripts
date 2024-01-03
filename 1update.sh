#!/bin/bash

# Nala install
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}NALA - DEB Pkg${normal}
  echo
sudo apt update
sudo apt install nala -y
  echo
  echo ${bold}${yellow}NALA - DEB Pkg ${normal}installed.
  echo ---------------------------------------------
  echo

# Wayland Enable
  echo
  echo ---------------------------------------------
  echo Enabling ${bold}${yellow}Wayland Window Manager${normal}
  echo
sudo sed -i 's/WaylandEnable=false/WaylandEnable=true/' /etc/gdm3/custom.conf
  echo
  echo ${bold}${yellow}Wayland Window Manager ${normal}enabled.
  echo ---------------------------------------------
  echo

# Installing GNOME UI
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GNOME Software and Flatpak Plugin - DEB Pkg${normal}
  echo
    sudo apt install gnome-software gnome-software-plugin-flatpak -y
  echo
  echo ${bold}${yellow}GNOME Software and Flatpak Plugin ${normal}installed.
  echo ---------------------------------------------
  echo
# Yaru Theme
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Yaru theme - DEB Pkg${normal}
  echo
    sudo apt install yaru-theme-* -y
  echo
  echo ${bold}${yellow}Yaru theme ${normal}installed.
  echo ---------------------------------------------
  echo

# Yaru Dark Black Theme
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Setting correct Rave Theme${normal}
  echo
    gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-purple-dark'
    gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
    gsettings set org.gnome.desktop.interface icon-theme 'Yaru-purple-dark'
    gsettings set org.gnome.desktop.sound theme-name 'Yaru'
  echo
  echo ${bold}${yellow}Correct Rave Theme ${normal}set.
  echo ---------------------------------------------
  echo

# Gsettings changes
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Setting UI Preferences before DCONF${normal}
  echo
    gsettings set org.gnome.desktop.screensaver lock-enabled false
    gsettings set org.gnome.desktop.session idle-delay 0
    gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
    gsettings set org.gnome.mutter center-new-windows true
  echo
  echo ${bold}${yellow}UI Preferences before DCONF ${normal}set.
  echo ---------------------------------------------
  echo

# Disabling Geoclue
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Geoclue service disabling / masking${normal}
  echo
    sudo systemctl disable geoclue.service
    sudo systemctl mask geoclue.service
  echo
  echo ${bold}${yellow}Geoclue service disabling / masking ${normal}finished.
  echo ---------------------------------------------
  echo

# Enable x86
  echo
  echo ---------------------------------------------
  echo Enabling ${bold}${yellow}x86 architecture${normal}
  echo
     sudo dpkg --add-architecture i386
  echo
  echo ${bold}${yellow}x86 architecture ${normal}enabled.
  echo ---------------------------------------------
  echo

# Dependencies
echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Dependencies${normal}
  echo
sudo nala install python3-pydbus gettext lm-sensors libgtksourceview-4-dev python3-psutil libgconf-2-4 libappindicator1 libc++1 gconf2 libsystemd-dev pkg-config ninja-build git libdbus-1-dev libinih-dev build-essential python3-dev libgirepository1.0-dev appstream-util python3 python3-pip gir1.2-appindicator3-0.1 gnome-shell-extension-appindicator libdazzle-1.0-dev debhelper debugedit dh-autoreconf dh-strip-nondeterminism dwz fp-compiler fp-compiler-3.2.2 fp-docs-3.2.2 fp-ide-3.2.2 fp-units-base-3.2.2 fp-units-db-3.2.2 fp-units-fcl-3.2.2 fp-units-fv-3.2.2 fp-units-gfx-3.2.2 fp-units-gtk2-3.2.2 fp-units-math-3.2.2 fp-units-misc-3.2.2 fp-units-multimedia-3.2.2 fp-units-net-3.2.2 fp-units-rtl-3.2.2 fp-utils-3.2.2 fpc fpc-3.2.2 fpc-source-3.2.2 gdb gir1.2-gtk-2.0 intltool-debian lcl-2.2 lcl-gtk2-2.2 lcl-nogui-2.2 lcl-units-2.2 lcl-utils-2.2 liba52-0.7.4 liba52-0.7.4-dev libarchive-cpio-perl libarchive-zip-perl libasound2-dev libbabeltrace1 libc6-dbg libcaca-dev libdebhelper-perl libdebuginfod-common libdebuginfod1 libfile-stripnondeterminism-perl libflac-dev libfluidsynth3 libforms-dev libforms2 libgd-dev libgl1-mesa-dev libglu1-mesa-dev libgmp-dev libgmpxx4ldbl libgraphviz-dev libgtk2.0-dev libgvc6-plugins-gtk libinstpatch-1.0-2 libipt2 libltdl-dev libmad0 libmad0-dev libmail-sendmail-perl libmikmod-dev libmodplug-dev libmodplug1 libogg-dev libproxy-tools libpulse-dev libsdl-mixer1.2 libsdl-mixer1.2-dev libsdl1.2-dev libslang2-dev libsource-highlight-common libsource-highlight4v5 libsub-override-perl libsys-hostname-long-perl libtool libvlc-bin libvlc-dev libvlc5 libvlccore9 libvorbis-dev libvpx-dev libxdot4 libxpm-dev libxt-dev libxxf86dga-dev libxxf86vm-dev m4 po-debconf gcc-multilib g++-multilib mesa-common-dev libxnvctrl-dev python3-evdev python3-decorator python3-pyte libpython3-dev python3-setuptools python3-pydantic meson v4l2loopback-dkms v4l-utils v4l2loopback-utils libqt5sql5 libqt5svg5 libqt5xml5 libspeexdsp1 -y
  echo
  echo ${bold}${yellow}Dependencies ${normal}installed.
  echo ---------------------------------------------
  echo

# All Updates
  echo
  echo ---------------------------------------------
  echo ${bold}${yellow}Upgrading the System${normal}
  echo
    sudo nala upgrade -y
  echo
  echo ${bold}${yellow}System upgraded!${normal}
  echo ---------------------------------------------
  echo

zenity --question --title='Restart required!' --text='Restart in 5 seconds?' --width='300' --height='100'
if [ $? = 0 ]; then

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
 --title="All updates are Installed!" --width='300' \
 --text="Restart" \
 --auto-close \
 --no-cancel
 sudo reboot;
 else
 echo ${bold}${yellow}User exited the script. Ending!${normal}
 exit 0;  
fi

