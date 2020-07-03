#!/bin/bash
mkdir -p /share/tvheadend/recordings

#Install WebGrabPlus
cd /share/tvheadend/wg++
wget http://www.webgrabplus.com/sites/default/files/download/SW/V2.1.0/WebGrabPlus_V2.1_install.tar.gz
tar -xvf WebGrabPlus_V2.1_install.tar.gz && rm WebGrabPlus_V2.1_install.tar.gz
mv .wg++/ wg++
cd wg++
./install.sh

cd /share/tvheadend/wg++
rm -rf siteini.pack/
git clone https://github.com/DeBaschdi/webgrabplus-siteinipack.git
cp -R webgrabplus-siteinipack/siteini.pack/ siteini.pack
cp siteini.pack/International/horizon.tv.* siteini.user/

wget -O /usr/bin/tv_grab_wg++ http://www.webgrabplus.com/sites/default/files/tv_grab_wg.txt
chmod a+x /usr/bin/tv_grab_wg++

/usr/bin/tvheadend --firstrun -u root -g root -c /share/tvheadend