# cron Runbook

## 目的

Phase 5 の学習で使用する cron の基本操作、実行ユーザ、PATH 問題、ログ出力設計を整理する。

## 対象

- user crontab
- `/etc/cron.d/`
- 実行ユーザの違い
- PATH
- stdout / stderr
- 終了コード
- 失敗検知

## 基本確認

cron サービスが動いていることを確認する。

```bash
sudo systemctl status cron --no-pager
sudo systemctl is-enabled cron
```

## user crontab

現在のユーザーで実行する cron は `crontab` コマンドで登録する。

### 登録

```bash
crontab phase05-user.crontab.example
```

### 一覧確認

```bash
crontab -l
```

### 削除

```bash
crontab -r
```

## `/etc/cron.d/`

システム側の cron ファイルでは、**ユーザー列** を書ける。

例:

```bash
* * * * * root /usr/local/bin/phase05-status-job.sh "root-cron" >> /srv/phase05/logs/root-cron-status.stdout.log 2>> /srv/phase05/logs/root-cron-status.stderr.log
```

## PATH 問題

cron はログインシェルと環境が違うため、PATH 依存で失敗しやすい。  
対策は以下。

- `PATH=` を crontab 冒頭で明示する
- コマンドは基本 **絶対パス** で書く
- 必要なら `env > file` で環境を採取して確認する

例:

```bash
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

## ログ出力設計

cron では stdout / stderr を分けると扱いやすい。

例:

```bash
* * * * * /usr/local/bin/phase05-status-job.sh "user-cron" >> /srv/phase05/logs/cron-user-status.stdout.log 2>> /srv/phase05/logs/cron-user-status.stderr.log
```

設計方針:

- 正常系は stdout
- 異常系は stderr
- スクリプト自身の内部ログは別ファイルへ残してもよい

## 実行ユーザ

- user crontab  
  → `crontab` を登録したユーザーで動く
- `/etc/cron.d/`  
  → cron エントリごとにユーザーを指定できる

## 終了コード

cron 自体は systemd のように `status` で失敗を追いにくいため、次の設計が重要。

- スクリプトの終了コードを適切に返す
- stderr をログへ残す
- 必要なら失敗専用ログを分ける

今回の学習では、`phase05-failing-job.sh` を使って失敗を再現した。

## lock による二重起動防止

cron はスケジュールベースで動くため、前回ジョブが終わる前に次回が来ることがある。  
その対策として lock を使う。

今回の学習では `flock` を使った。

## この Runbook の位置づけ

本ファイルは、Phase 5 における cron の再現可能な手順書とする。
