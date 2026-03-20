# Phase 4 Server Basics

## 目的

- SSH、権限、systemd、ログなど、サーバ運用の最低限を体験する
- Linux サーバー上での基本操作を、実際の VM 環境で確認する
- 今後の cron / systemd timer / 運用系学習の土台を作る

## 学習項目

- ユーザー / グループの基本
- 権限
- SSH 接続
- 鍵認証
- `systemctl`
- `journalctl`
- `/var/log`

## 使用環境・ツール

- VirtualBox
- Ubuntu Server VM
- TeraTerm
- WinSCP

## 学んだこと

### ユーザー / グループ

学習用にユーザーとグループを作成し、`id` と `getent group` で確認した。

実施内容の例:

```bash
sudo groupadd phase4ops
sudo useradd -m -s /bin/bash phase4user1
sudo useradd -m -s /bin/bash phase4user2
sudo usermod -aG phase4ops phase4user1
```

理解したこと。

- Linux ではユーザーとグループで権限管理する
- `id` で所属グループが確認できる
- グループは共有ディレクトリ管理で重要

### 権限

共有ディレクトリを作り、所有者・グループ・モードを設定した。

実施内容の例:

```bash
sudo mkdir -p /srv/phase4/share
sudo chown root:phase4ops /srv/phase4/share
sudo chmod 2775 /srv/phase4/share
```

理解したこと。

- `chown` で所有者 / グループ変更
- `chmod` でアクセス権変更
- グループ所属によって作成可否が変わる
- サーバー運用では権限設計が基本になる

### SSH 接続

TeraTerm と WinSCP で VM に接続した。  
VirtualBox は NAT + ポートフォワーディングで構成した。

接続先:

```bash
Host: 127.0.0.1
Port: 2222
```

理解したこと。

- SSH はサーバーへ入る基本手段
- TeraTerm は対話接続
- WinSCP は SFTP によるファイル確認や転送に便利

### 鍵認証

Windows 側で鍵を生成し、公開鍵を `authorized_keys` へ登録した。

理解したこと。

- 秘密鍵は絶対に公開しない
- 公開鍵を VM に登録すると、パスワードなしログインが可能になる
- 鍵認証は今後の運用でも重要

### `systemctl`

学習用 service を使って基本操作を確認した。

実施内容の例:

```bash
sudo systemctl start phase04-heartbeat.service
sudo systemctl status phase04-heartbeat.service --no-pager
sudo systemctl restart phase04-heartbeat.service
sudo systemctl enable phase04-heartbeat.service
sudo systemctl is-enabled phase04-heartbeat.service
```

理解したこと。

- `start`, `status`, `restart`, `enable`, `is-enabled` が基本
- service 定義更新後は `daemon-reload` が必要
- systemd は Linux サーバー運用で重要な基盤

### `journalctl`

対象 service や ssh のログを確認した。

実施内容の例:

```bash
sudo journalctl -u ssh --no-pager
sudo journalctl -u phase04-heartbeat.service --no-pager
sudo journalctl -n 20 --no-pager
```

理解したこと。

- `journalctl` は systemd 管理サービスのログ確認に便利
- service 単位で絞れる
- 障害切り分けの基本になる

### `/var/log`

ログディレクトリ一覧と、学習用ログファイルを確認した。

実施内容の例:

```bash
sudo ls -l /var/log
sudo tail -n 20 /var/log/phase04-heartbeat.log
```

理解したこと。

- `/var/log` はログの基本格納場所
- systemd/journal だけでなく、ファイルログも重要

## 実際にやったこと

- VirtualBox 上に学習用 Ubuntu Server VM を用意した
- TeraTerm / WinSCP で接続確認した
- 学習用ユーザー / グループを作成した
- 共有ディレクトリを作り、権限挙動を確認した
- SSH 鍵認証を導入した
- 学習用 service を導入した
- `systemctl`, `journalctl`, `/var/log` を一通り確認した

## メモ

- サーバー運用の最初の入口は SSH
- 権限の理解はユーザー / グループとセット
- systemd は `systemctl` と `journalctl` をセットで覚える
- `/var/log` の確認はログ切り分けの基本
