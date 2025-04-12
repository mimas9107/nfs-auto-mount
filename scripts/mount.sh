#!/bin/bash
set -e
source "$(dirname "$0")/../config.sh"

MAX_RETRIES=60
SLEEP_SEC=5

for i in $(seq 1 $MAX_RETRIES); do
  if nc -z -w2 "$NFS_SERVER" "$NFS_PORT"; then
    echo "[INFO] NFS Server $NFS_SERVER:$NFS_PORT 已就緒"
    break
  else
    echo "[WARN] NFS Server 尚未就緒，等待 $SLEEP_SEC 秒 ($i/$MAX_RETRIES)"
    sleep $SLEEP_SEC
  fi
done

for i in "${!NFS_REMOTE_PATHS[@]}"; do
  remote="${NFS_SERVER}:${NFS_REMOTE_PATHS[$i]}"
  local="${LOCAL_MOUNT_POINTS[$i]}"
  mkdir -p "$local"
  if ! mountpoint -q "$local"; then
    mount -t nfs -o rw,nolock "$remote" "$local" && echo "[OK] 掛載成功：$local"
  else
    echo "[INFO] 已掛載：$local，略過"
  fi
done
