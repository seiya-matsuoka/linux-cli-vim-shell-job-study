# systemd timer Runbook

## 目的

Phase 5 の学習で使用する systemd timer の基本操作と、cron との違いを整理する。

## 対象

- `systemctl`
- `systemd service`
- `systemd timer`
- `journalctl`
- 失敗検知
- cron との比較

## 基本構成

systemd timer は、通常 次の 2 つで構成する。

- `.service`
- `.timer`

### 例

- `phase05-status-job.service`
- `phase05-status-job.timer`

## 配置先

```bash
/etc/systemd/system/
```

## 導入手順

### service / timer を配置

```bash
sudo install -m 0644 phase05-status-job.service /etc/systemd/system/phase05-status-job.service
sudo install -m 0644 phase05-status-job.timer /etc/systemd/system/phase05-status-job.timer
```

### 反映

```bash
sudo systemctl daemon-reload
```

### timer 有効化

```bash
sudo systemctl enable --now phase05-status-job.timer
```

## 基本確認

### timer 状態確認

```bash
sudo systemctl status phase05-status-job.timer --no-pager
```

### list-timers

```bash
sudo systemctl list-timers --all | grep phase05
```

### service 状態確認

```bash
sudo systemctl status phase05-status-job.service --no-pager
```

### journal 確認

```bash
sudo journalctl -u phase05-status-job.service --no-pager
```

## cron との違い

### cron

- 時刻ベースで簡単
- 仕組みがシンプル
- 失敗確認や状態追跡はやや弱い
- PATH 問題に注意

### systemd timer

- service と timer が分かれる
- `systemctl status` で状態を追いやすい
- `journalctl` でログ確認しやすい
- `Persistent=true` など systemd 的な機能が使える

## 失敗検知

systemd timer では、失敗した service を次のように追いやすい。

```bash
sudo systemctl status phase05-failing-job.service --no-pager
sudo journalctl -u phase05-failing-job.service --no-pager
```

## 片付け

不要になった timer は停止・無効化する。

```bash
sudo systemctl disable --now phase05-status-job.timer
sudo rm -f /etc/systemd/system/phase05-status-job.service
sudo rm -f /etc/systemd/system/phase05-status-job.timer
sudo systemctl daemon-reload
```

## この Runbook の位置づけ

本ファイルは、Phase 5 における systemd timer の再現可能な手順書とする。
