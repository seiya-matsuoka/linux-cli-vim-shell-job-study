# Performance Observation Runbook

## 目的

Phase 6 の学習で使用する基本観測コマンドと、軽い負荷観測の進め方を整理する。

## 対象

- `top`
- `htop`
- `uptime`
- `vmstat`
- `free`
- `df`
- `du`
- `ss`
- `curl`
- `iostat`
- `pidstat`
- `stress-ng`

## 基本方針

性能観測は、まず **通常時の baseline** を見て、その後に **軽い負荷をかけて差分を見る** 形で進める。

## baseline 観測

### `top`

対話的に現在のシステム状態を見る。

```bash
top
```

終了:

```bash
q
```

### `htop`

対話的にプロセスや CPU / メモリの状況を見る。

```bash
htop
```

終了:

```bash
q
```

### `uptime`

ロードアベレージ確認。

```bash
uptime
```

### `vmstat`

プロセス、メモリ、ページング、I/O、CPU を見る。

```bash
vmstat 1 5
```

### `free`

メモリ確認。

```bash
free -h
```

## ディスク使用量

### `df`

ファイルシステム単位の空き容量確認。

```bash
df -h
```

### `du`

ディレクトリ単位の使用量確認。

```bash
du -sh ~ /var/log /srv 2>/dev/null
```

## ネットワーク / ソケット

### ローカル HTTP サーバー起動

```bash
python3 -m http.server 8080 --bind 127.0.0.1 --directory ~/phase06-http
```

### `ss`

待ち受けポート確認。

```bash
ss -tlnp
ss -tlnp | grep 8080
```

### `curl`

HTTP 応答確認。

```bash
curl -I http://127.0.0.1:8080
curl http://127.0.0.1:8080
```

## I/O / プロセス

### `iostat`

I/O デバイス負荷確認。

```bash
iostat -xz 1 3
```

### `pidstat`

プロセス単位の統計確認。

```bash
pidstat 1 5
pidstat -p <PID> 1 5
```

## 軽い負荷観測

### CPU

```bash
stress-ng --cpu 1 --timeout 20s
```

### メモリ

```bash
stress-ng --vm 1 --vm-bytes 256M --timeout 20s
```

### I/O

```bash
dd if=/dev/zero of=~/phase06-io-test.bin bs=1M count=128 conv=fdatasync status=progress
```

## 観測時の見方

### CPU

- `uptime` の load average
- `vmstat` の `r`, `us`, `sy`, `id`
- `pidstat` の対象プロセス CPU 使用率

### メモリ

- `free -h`
- `vmstat` のメモリ欄

### ディスク

- `df -h`
- `du -sh`
- `iostat -xz`

### ネットワーク / ポート

- `ss -tlnp`
- `curl`

## この Runbook の位置づけ

本ファイルは、Phase 6 における性能・監視の模擬を再現するための手順書とする。
