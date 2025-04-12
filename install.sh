#!/bin/bash
set -e

INSTALL_DIR="/usr/local/nfs-auto-mount"

echo "[*] 建立資料夾 $INSTALL_DIR"
sudo mkdir -p "$INSTALL_DIR/scripts"
sudo cp -r scripts/* "$INSTALL_DIR/scripts/"
sudo cp config.sh "$INSTALL_DIR/"
sudo cp systemd/* /etc/systemd/system/

echo "[*] 設定檔權限"
sudo chmod +x "$INSTALL_DIR/scripts/"*.sh

echo "[*] 啟用 nfs-auto-mount.timer"
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable --now nfs-auto-mount.timer
sudo systemctl enable nfs-auto-umount.service

echo "✅ 安裝完成，系統將在開機後自動延遲掛載 NFS"
echo "👉 若要啟用非阻塞掛載版本："
echo "    sudo systemctl enable --now nfs-auto-mount-nonblocking.service"
