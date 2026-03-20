# SSH Runbook

## 目的

Phase 4 の学習で使用する VirtualBox 上の Linux VM に対して、SSH 接続と鍵認証を行うための手順を整理する。

## 対象

- VirtualBox 上の Linux VM
- TeraTerm
- WinSCP
- Windows PowerShell の OpenSSH クライアント

## 接続方針

- VirtualBox のネットワークは NAT
- ホスト側ポートフォワーディングで SSH を公開する
- 接続先は以下とする
  - Host: 127.0.0.1
  - Port: 2222
  - User: <x>

## 基本確認

接続後、最低限以下を確認する。

```bash
whoami
hostname
pwd
```

## SSH サービス確認

VM 側で以下を実行する。

```bash
sudo systemctl status ssh --no-pager
sudo ss -tlnp | grep ':22'
```

確認ポイント:

- ssh サービスが active (running)
- 22 番ポート待ち受けがある

## 鍵認証

### 1. Windows 側で鍵生成

PowerShell で実行する。

```powershell
ssh-keygen -t ed25519 -f <private-key-path> -C "<x>"
```

### 2. 公開鍵を VM へアップロード

WinSCP で以下をアップロードする。

- Windows:
  - `<private-key-path>.pub`
- VM:
  - `~/<private-key-path>.pub`

### 3. VM 側で authorized_keys 設定

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cat ~/<private-key-path>.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
chown -R "$USER":"$USER" ~/.ssh
rm -f ~/<private-key-path>.pub
```

### 4. Windows 側で鍵認証確認

PowerShell で実行する。

```powershell
ssh -i <private-key-path> -p 2222 <x>@127.0.0.1
```

## この Runbook の位置づけ

本ファイルは、Phase 4 の SSH 接続と鍵認証に関する再現可能な手順書とする。
