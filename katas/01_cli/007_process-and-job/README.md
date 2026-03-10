# Kata 007: Process and Job

## 目的

プロセス / ジョブ制御の入口を理解する。

## 学習対象

- `ps`
- `top`
- `&`
- `jobs`
- `fg`
- `bg`
- `kill`

## 作業ディレクトリ

```bash
katas/01_cli/007_process-and-job/workspace/
```

## 課題

以下を順に実行する。

1. `ps` でプロセスを確認する
2. `top` でプロセス状況を確認する
3. `sleep 300 &` でバックグラウンドジョブを起動する
4. `jobs` でジョブ一覧を確認する
5. `ps -ef | grep sleep` でプロセス確認する
6. `fg %1` で foreground に戻す
7. `Ctrl + Z` で停止する
8. `bg %1` で再開する
9. `kill %1` または PID 指定で終了する

## 実施コマンド例

```bash
ps
ps -ef | head
top

sleep 300 &
jobs
ps -ef | grep sleep

fg %1

jobs
bg %1
jobs -l

kill %1
```

## 確認ポイント

- `ps` はプロセス確認
- `jobs` は現在のシェル起点のジョブ確認
- `&` はバックグラウンド実行
- `fg` は前面復帰
- `bg` は停止ジョブ再開
- `kill` はシグナル送信

## 残すもの

- 実行結果を `artifacts/wsl/phase01/process-job/001-process-job-results.txt` に保存
