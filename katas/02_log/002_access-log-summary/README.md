# Kata 002: Access Log Summary

## 目的

アクセスログから簡単な集計を行えるようにする。

## 学習対象

- `awk`
- `sort`
- `uniq -c`
- `grep`

## 作業ディレクトリ

```bash
katas/02_log/002_access-log-summary/workspace/
```

## 課題

以下を順に実行する。

1. ステータスコードごとの件数を数える
2. `500` の行だけ抽出する
3. パスごとの件数を数える
4. IP ごとの件数を数える

## 実施コマンド例

```bash
awk '{print $4}' access.log | sort | uniq -c
grep ' 500$' access.log
awk '{print $3}' access.log | sort | uniq -c
awk '{print $1}' access.log | sort | uniq -c
```

## 確認ポイント

- `awk` で列を取り出してから `sort | uniq -c` がよく使う流れ
- ログの基本的な件数確認ができる

## 残すもの

- `artifacts/wsl/phase02/log/002-status-counts.txt`
- `artifacts/wsl/phase02/log/002-path-counts.txt`
- `artifacts/wsl/phase02/log/002-ip-counts.txt`
