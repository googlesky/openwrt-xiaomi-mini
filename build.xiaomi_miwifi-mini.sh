#!/bin/bash
CONTAINER_NAME="xiaomi_miwifi-mini-builder"
PROGRAM_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )
EXTPACKAGE="/ext-package/luci-theme-argon_2.2.5-20200914_all.ipk"
docker rm -f $CONTAINER_NAME
docker pull openwrtorg/imagebuilder:ramips-mt7620-21.02-SNAPSHOT

docker run -v $PROGRAM_DIR/ext-package/:/ext-package/ -v $PROGRAM_DIR/bin/:/home/build/openwrt/bin -v $PROGRAM_DIR/files:/home/build/openwrt/files openwrtorg/imagebuilder:ramips-mt7620-21.02-SNAPSHOT make -j12 image PROFILE="xiaomi_miwifi-mini" PACKAGES="comgt kmod-usb-serial kmod-usb-serial-option kmod-usb-serial-wwan usb-modeswitch luci-app-mwan3 block-mount kmod-fs-ext4 kmod-fs-exfat kmod-fs-autofs4 kmod-usb-storage kmod-usb-storage-uas usbutils f2fs-tools kmod-fs-f2fs kmod-usb-ohci kmod-usb-uhci e2fsprogs fdisk kmod-usb-net-rndis kmod-nls-base kmod-usb-core kmod-usb-net kmod-usb-net-cdc-ether kmod-usb2 luci kmod-dummy relayd luci-compat ${EXTPACKAGE} " FILES=files/
#docker run --rm -v $PROGRAM_DIR/bin/:/home/build/openwrt/bin -v $PROGRAM_DIR/files:/home/build/openwrt/files -it openwrtorg/imagebuilder:ramips-mt7620-21.02-SNAPSHOT make -j12 image PROFILE="xiaomi_miwifi-mini" PACKAGES="comgt kmod-usb-serial kmod-usb-serial-option kmod-usb-serial-wwan usb-modeswitch luci-app-mwan3 kmod-zram zram-swap block-mount kmod-fs-ext4 kmod-fs-exfat kmod-fs-autofs4 kmod-usb-storage kmod-usb-storage-uas usbutils f2fs-tools kmod-fs-f2fs kmod-usb-ohci kmod-usb-uhci e2fsprogs fdisk kmod-usb-net-rndis kmod-nls-base kmod-usb-core kmod-usb-net kmod-usb-net-cdc-ether kmod-usb2 luci kmod-dummy relayd" FILES=files/


