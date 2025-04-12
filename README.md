# NFS Auto Mount for Raspberry Pi

本專案提供一套完整的 NFS 自動掛載與自動卸載機制，支援 Timer 延遲啟動與非阻塞模式，適用於 Raspberry Pi 或其他 Linux 系統。

## 功能特色
- ⏱ Timer 架構等待 NFS Server 就緒再掛載
- 🚫 非阻塞掛載可立即執行不影響開機流程
- 🧼 自動卸載並於關機前保護性處理
- ⚙️ 所有變數集中於 `config.sh`

## 安裝步驟
```bash
git clone <your-repo>
cd nfs-auto-mount
chmod +x install.sh
sudo ./install.sh
```

## 啟用非阻塞掛載（可選）
```bash
sudo systemctl disable --now nfs-auto-mount.timer
sudo systemctl enable --now nfs-auto-mount-nonblocking.service
```

## 預設掛載點
- `/mnt/ext/share1`
- `/mnt/ext/share2`
