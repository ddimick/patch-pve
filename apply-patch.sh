#!/bin/bash

if [ "$1" == "" ] || [ $# -gt 1 ]; then
  echo "usage: apply-patch.sh <server>"
  exit 0
fi

SERVER_HOST=$1

echo "Transfering patch to $SERVER_HOST..."

scp -pr ./patch-pve root@$SERVER_HOST:/usr/share/patch-pve

echo "Applying patch on $SERVER_HOST..."

ssh root@$SERVER_HOST "/bin/cp -vf /usr/share/patch-pve/99patchpve /etc/apt/apt.conf.d/99patchpve && \
/bin/chmod a+x /usr/share/patch-pve/patch-pve.sh && \
/usr/share/patch-pve/patch-pve.sh"

echo "Done patching $SERVER_HOST!"