#!/bin/bash

function patch_pve() {
  ENTERPRISE_REPO_LIST="/etc/apt/sources.list.d/pve-enterprise.list"
  FREE_REPO_LIST="/etc/apt/sources.list.d/pve-no-subscription.list"
  FREE_REPO_LINE="deb http://download.proxmox.com/debian/pve stretch pve-no-subscription"

  echo "$0: Patching PVE..."

  echo $FREE_REPO_LINE > $FREE_REPO_LIST
  rm -f $ENTERPRISE_REPO_LIST

  echo " * Patched repositories"

  sed -i.bak "s/data.status !== 'Active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js

  echo " * Patched subscription dialog"

  cp -f /usr/share/patch-pve/images/* /usr/share/pve-manager/images/

  echo " * Patched VE visuals"
}

patch_pve