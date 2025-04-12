#!/bin/bash
set -e
source "$(dirname "$0")/../config.sh"

for mount_point in "${LOCAL_MOUNT_POINTS[@]}"; do
  if mountpoint -q "$mount_point"; then
    echo "[INFO] 卸載：$mount_point"
    umount -f "$mount_point"
  fi
done
