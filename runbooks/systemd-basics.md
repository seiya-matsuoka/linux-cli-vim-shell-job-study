# systemd Basics Runbook

## 目的

Phase 4 の学習で使用する systemd の基本操作と、学習用 service のセットアップ手順を整理する。

## 対象

- `systemctl`
- `journalctl`
- 学習用 service: `phase04-heartbeat.service`

## 学習用ファイル

### script

```bash
/usr/local/bin/phase04-heartbeat.sh
```

### service

```bash
/etc/systemd/system/phase04-heartbeat.service
```

## ローカルリポジトリ上の元ファイル

- `infra/virtualbox/phase04/phase04-heartbeat.sh`
- `infra/virtualbox/phase04/phase04-heartbeat.service`

## インストール手順

VM 側にアップロード後、以下を実行する。

```bash
sudo install -m 0755 ~/phase04-heartbeat.sh /usr/local/bin/phase04-heartbeat.sh
sudo install -m 0644 ~/phase04-heartbeat.service /etc/systemd/system/phase04-heartbeat.service
sudo systemctl daemon-reload
```

## 基本操作

### 起動

```bash
sudo systemctl start phase04-heartbeat.service
```

### 状態確認

```bash
sudo systemctl status phase04-heartbeat.service --no-pager
```

### 再起動

```bash
sudo systemctl restart phase04-heartbeat.service
```

### 自動起動設定

```bash
sudo systemctl enable phase04-heartbeat.service
```

### 自動起動確認

```bash
sudo systemctl is-enabled phase04-heartbeat.service
```

## journalctl

### 対象 service のログを見る

```bash
sudo journalctl -u phase04-heartbeat.service --no-pager
```

### SSH サービスのログを見る

```bash
sudo journalctl -u ssh --no-pager
```

### 新しいログを末尾から見る

```bash
sudo journalctl -n 20 --no-pager
```

## /var/log

学習用 service では `/var/log/phase04-heartbeat.log` にもログを書き出す。

確認:

```bash
sudo tail -n 20 /var/log/phase04-heartbeat.log
```

## トラブル時の確認

### service が起動しない

```bash
sudo systemctl status phase04-heartbeat.service --no-pager
sudo journalctl -u phase04-heartbeat.service --no-pager
```

### service 定義更新後

```bash
sudo systemctl daemon-reload
```

## この Runbook の位置づけ

本ファイルは、Phase 4 における systemd / journalctl / /var/log の基本操作を再現するための手順書とする。
