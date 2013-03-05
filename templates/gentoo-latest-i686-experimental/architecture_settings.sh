# settings that will be shared between all scripts

cat <<DATAEOF > "/etc/profile.d/architecture.sh"
export architecture="x86"

# stage 3 filename
export stage3file=`wget http://distfiles.gentoo.org/releases/x86/autobuilds/latest-stage3-i686.txt -O - | grep -v '^#.*'`

# for the compiler
export chost="i686-pc-linux-gnu"

# for grub
export grub_architecture="x86"

DATAEOF
