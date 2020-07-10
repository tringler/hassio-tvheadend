#!/bin/bash
mkdir -p /share/tvheadend/recordings
mkdir -p ~/.wg++
ln -sf /share/tvheadend/wg++/guide.xml ~/.wg++/guide.xml

#Install WebGrabPlus
if  [ "$(ls -A /share/tvheadend/wg++)" ]; then
    echo "[INFO] Webgrab+ already installed"
else
    echo "[INFO] No webgrab+ installation found - Installing webgrab+"
    cd /tmp  && \
    wget http://www.webgrabplus.com/sites/default/files/download/SW/V2.1.0/WebGrabPlus_V2.1_install.tar.gz  && \
    tar -xvf WebGrabPlus_V2.1_install.tar.gz && rm WebGrabPlus_V2.1_install.tar.gz  && \
    mv .wg++/ /share/tvheadend/wg++  && \
    cd /share/tvheadend/wg++  && \
    ./install.sh

    rm -rf siteini.pack/  && \
    git clone https://github.com/DeBaschdi/webgrabplus-siteinipack.git  && \
    cp -R webgrabplus-siteinipack/siteini.pack/ siteini.pack  && \
    cp siteini.pack/International/horizon.tv.* siteini.user/
fi

wget -O /usr/bin/tv_grab_wg++ http://www.webgrabplus.com/sites/default/files/tv_grab_wg.txt  && \
chmod a+x /usr/bin/tv_grab_wg++

echo "0 0 * * * /share/tvheadend/wg++/run.sh" >> /var/spool/cron/root
crond

echo "[INFO] Installing Sundtek Drivers"
wget http://www.sundtek.de/media/sundtek_netinst.sh  && \
chmod a+x sundtek_netinst.sh  && \
./sundtek_netinst.sh -easyvdr

echo "[INFO] Starting TVHeadend"
/opt/bin/mediaclient --start
/usr/bin/tvheadend --firstrun -u root -g root -c /share/tvheadend