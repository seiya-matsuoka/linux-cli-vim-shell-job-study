# Kata 001: Basic CSV Inspect

## 目的

CSV の列構造を確認し、必要な列を取り出せるようにする。

## 学習対象

- `head`
- `cut`
- `sort`
- `uniq -c`

## 作業ディレクトリ

```bash
katas/02_csv/001_basic-inspect/workspace/
```

## 課題

以下を順に実行する。

1. 先頭数行を確認する
2. `name` 列を抽出する
3. `team` 列を抽出する
4. team ごとの件数を集計する
5. joined_year の一覧を確認する

## 実施コマンド例

```bash
head -n 3 members.csv
cut -d',' -f2 members.csv
cut -d',' -f3 members.csv
tail -n +2 members.csv | cut -d',' -f3 | sort | uniq -c
tail -n +2 members.csv | cut -d',' -f4 | sort
```

## 確認ポイント

- CSV をまず眺める
- `cut` で必要列を取り出す
- `sort | uniq -c` で簡易集計できる

## 残すもの

- `artifacts/wsl/phase02/csv/001-team-counts.txt`
