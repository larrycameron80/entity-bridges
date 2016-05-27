#!/bin/sh -x
# build-entbr.sh: entity-bridge build script
# $arch and $ver has to match the build box with flashrd
# creates image for testing, for production version see production-remove

now="${now:-`date "+%Y%m%d"`}"		# useful for tracking versions
ver="${ver:-`uname -r`}"
sysver="${sysver:-`uname -r | tr -d "."`}"
arch="${arch:-`uname -m`}"
#mach="${mach:-ALIX}"			# if move to custom by hardware
flashrd="${flashrd:-$HOME/flashrd}"	# where the build scripts reside
source="${source:-$HOME/openbsd}"	# where the source resides
mirror="${mirror:-ftp://mirrors.nycbug.org/pub/OpenBSD/$ver/$arch}"
anoncvs="${anoncvs:-anoncvs@openbsd.nycbug.org:/cvs}"	# http://www.openbsd.org/anoncvs.html
sets="${sets:-{bsd,bsd.rd,SHA256.sig,base$sysver.tgz}}"
wwwscripts="${wwwscripts:-$HOME/wwwscripts}"		# temporarily
tz="${tz:-UTC}"
# be br cf de dk es fr hu is it jp la lt lv nl no pl pt ru sf sg si sv tr ua uk us
locale="${locale:-us}"
dns="${dns:-198.6.1.6}"
hostname="${hostname:-entbridge-$now}"
sysname="${sysname:-torbridge-$arch-$now}"

# stop me if it's gets ugly

yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }

# cleanup the previous mess from today

/sbin/vnconfig -u /dev/vnd{0-4}

rm $flashrd/flashimg.i386-$now;

rm -rf $source && mkdir $source;

# grab and extract the source

cd $source;

ftp -ai $mirror/$sets;

/usr/bin/signify -C -p /etc/signify/openbsd-$sysver-base.pub -x $sets;

tar zxpf base$sysver.tgz -C $source;

tar zxpf var/sysmerge/etc.tgz -C $source;

#best location for /etc files?
# /etc/dhclient.conf with x.x.x.215 as host octet
# /etc/tor/torrc
# /etc/fstab

# /etc/rc.conf.local
echo 'sndiod_flags=NO\nntpd_flags="-s"\nsmtpd_flags=NO\nhttpd_flags=""' >$source/etc/rc.conf.local;

# httpd configuration

echo 'ext_addr="*"\nserver "default" {\nlisten on $ext_addr port 80\n}' >$source/etc/httpd.conf;

echo "<html>test</html>" >$source/var/www/htdocs/index.html;

# a new root cron, with www regeneration

echo "SHELL=/bin/sh\nPATH=/bin:/sbin:/usr/bin:/usr/sbin\nHOME=/var/log" >$source/var/cron/tabs/root;

echo "0 * * * * /usr/bin/newsyslog\n*/1 * * * * /bin/sh /usr/local/scripts/build_all.sh">>$source/var/cron/tabs/root;

# populate /usr/local/scripts with www generator

mkdir $source/usr/local/scripts;

cp $wwwscripts $source/usr/local/scripts;

#cp -R $conf/* $buildpath;

# add a swap file

#echo '/sbin/swapctl -a /flash/swap0'>>$buildpath/etc/rc.flashrd.local;

#echo "/flash/swap0 /flash/swap0 swap sw 0 0" >>$buildpath/etc/fstab;

#chmod 0755 $flashrd/etc/rc.flashrd.local;

# Get packages for /etc/rc.flashrd.onetime install

#mkdir -p $flashrd/PACKAGES;

#cd $buildpath/PACKAGES;

#ftp -iva $mirror/$ver/packages/$arch/$pkgs;

# cvs, assuming CVSROOT Root already defined in /usr/src

cd /usr/src && cvs up -Pd;

#SOEKRIS deal with DMA errors with 0x0ff0 flags at wd*

#cp $flashrd/FLASHRD /usr/src/sys/arch/i386/conf/

#cd $flashrd && torsocks git pull;

#/etc/rc.d tor stop;

cd $flashrd && /bin/sh flashrd $source;

# build image with some customizations

./cfgflashrd -k $locale -ntp "pool.ntp.org" -t $tz -dns $dns -hostname $hostname -image $flashrd/flashimg.$arch-$now -com0 9600;

# root passwd prompt

echo "Now write with 'cd $flashrd && ./growimg -t sdN $flashrd/$sysname'"

true
