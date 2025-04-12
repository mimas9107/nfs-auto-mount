#!/bin/bash
# NFS 伺服器設定
NFS_SERVER="YOUR NFS SERVER IP"
NFS_PORT=2049

# 遠端與本地掛載點（陣列）
NFS_REMOTE_PATHS=("/mnt/share1" "/mnt/share2")
LOCAL_MOUNT_POINTS=("/mnt/ext/share1" "/mnt/ext/share2")
