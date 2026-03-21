# Phase 5 Job Operations

## 目的

- ジョブを安全に実行・管理するための基本を学ぶ
- cron と systemd timer の違いを理解する
- ログ、終了コード、二重起動防止などの運用作法を身につける

## 学習項目

- cron の基本
- 実行ユーザ
- PATH 問題
- ログ出力設計
- systemd timer の基本
- cron と timer の違い
- lock による二重起動防止
- 終了コード
- 失敗時の検知
- ジョブとプロセス / シグナルの関係

## 使用環境・ツール

- VirtualBox
- Ubuntu Server VM
- TeraTerm
- WinSCP

## 学んだこと

### cron の基本

cron は、時刻ベースでジョブを定期実行する基本機能である。

- user crontab は現在ユーザーで動く
- `/etc/cron.d/` では実行ユーザーを明示できる
- PATH を明示しないと想定どおり動かないことがある
- stdout / stderr を分けると運用しやすい

### 実行ユーザ

今回の学習では、次の2つを比較した。

- user crontab  
  → 現在ユーザーで実行
- `/etc/cron.d/phase05-root`  
  → `root` で実行

### PATH 問題

cron はログインシェルと環境が異なるため、PATH 問題が起きやすい。  
対策として次を使った。

- crontab の先頭に `PATH=` を明示
- コマンドは絶対パスで書く
- `env > file` で実際の環境を確認する

### ログ出力設計

- 正常系ログは stdout
- 異常系ログは stderr
- スクリプト内部ログは別ファイルへ残してもよい
- 失敗を後で追えるようにする

### systemd timer の基本

systemd timer は、service と timer の組み合わせで定期実行を管理する。  
今回の学習では次を確認した。

- `.service` と `.timer` を用意する
- `daemon-reload` が必要
- `enable --now` で timer を起動できる
- `list-timers` でスケジュールを確認できる

### cron と timer の違い

cron は簡単で分かりやすい。  
timer は構成が少し増えるが、systemd の管理下で状態やログを追いやすい。

- 手早い定期実行 → cron
- 管理性 / 状態確認 / journal を活かしたい → systemd timer

### lock による二重起動防止

長時間ジョブでは、前回実行が終わる前に次回実行が始まる可能性がある。  
今回の学習では `flock` を使った lock を実装し、2重起動時に `lock_busy` として終了する挙動を確認した。

### 終了コード

今回の学習では、正常ジョブと失敗ジョブを分けて作った。

- `phase05-status-job.sh`  
  → 正常終了
- `phase05-failing-job.sh`  
  → `exit 1`

理解したこと。

- 終了コードは成功 / 失敗を表す
- stderr と終了コードはセットで考えると分かりやすい

### 失敗時の検知

cron では、失敗を追うにはログ設計が重要。  
systemd timer では、`systemctl status` や `journalctl` で失敗を追いやすい。

### ジョブとプロセス / シグナルの関係

lock ジョブを長めに実行し、`ps` と `kill -TERM` を使って確認した。

理解したこと。

- ジョブの実体はプロセス
- 長時間ジョブはプロセスとして観察できる
- `kill -TERM` で停止要求を送れる
- スクリプト側で `trap` を入れると終了時の処理を制御できる

## 実際にやったこと

- 3本のジョブスクリプトを作成した
  - 正常ジョブ
  - 失敗ジョブ
  - lock ジョブ
- cron による user 実行と root 実行を確認した
- cron の PATH と環境差を確認した
- timer による定期実行を確認した
- failing service で失敗時の見え方を確認した
- lock ジョブで二重起動防止とシグナル処理を確認した

## メモ

- cron では絶対パスと PATH 明示が重要
- stdout / stderr を分けると後で追いやすい
- 終了コードは運用上の重要情報
- 長時間ジョブでは lock を考える
- systemd timer は状態追跡がしやすい
- cron と timer は競合ではなく使い分け対象
