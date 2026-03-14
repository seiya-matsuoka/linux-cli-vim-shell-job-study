# Kata 002: CSV Transform and Summary

## 目的

CSV の数値列を対象に、簡単な集計を行えるようにする。

## 学習対象

- `awk`
- 合計
- グループ別集計

## 作業ディレクトリ

```bash
katas/02_csv/002_transform/workspace/
```

## 課題

以下を順に実行する。

1. `amount` の総合計を求める
2. `category` ごとの売上合計を求める
3. `store` ごとの売上合計を求める

## 実施コマンド例

```bash
awk -F',' 'NR>1 {sum += $4} END {print sum}' sales.csv
awk -F',' 'NR>1 {sum[$3]+=$4} END {for (k in sum) print k, sum[k]}' sales.csv
awk -F',' 'NR>1 {sum[$2]+=$4} END {for (k in sum) print k, sum[k]}' sales.csv
```

## 確認ポイント

- `awk` で合計計算できる
- 連想配列でグループ別集計できる

## 残すもの

- `artifacts/wsl/phase02/csv/002-total-sales.txt`
- `artifacts/wsl/phase02/csv/002-category-sales.txt`
