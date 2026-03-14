# Kata 006: awk

## 目的

列単位の抽出と簡単な集計を行えるようにする。

## 学習対象

- `awk -F`
- `$1`, `$2`, `$3`
- `NR`
- `END`
- 合計
- 件数集計

## 作業ディレクトリ

```bash
katas/02_text/006_awk/workspace/
```

## 課題

以下を順に実行する。

1. ヘッダ行を含めて内容を確認する
2. `order_id`, `category`, `amount` を表示する
3. `amount` の合計を求める
4. `category` ごとの件数と合計を求める

## 実施コマンド例

```bash
awk -F',' 'NR==1 {print $0} NR>1 {print $1, $3, $4}' orders.csv
awk -F',' 'NR>1 {sum += $4} END {print sum}' orders.csv
awk -F',' 'NR>1 {count[$3]++; sum[$3]+=$4} END {for (k in count) print k, count[k], sum[k]}' orders.csv
```

## 確認ポイント

- `-F','` は区切り文字指定
- `$1` などは列番号
- `NR` は行番号
- `END` で最後に集計結果を出せる

## 残すもの

- 必要に応じて `artifacts/wsl/phase02/text/006-orders-sum.txt`
- 必要に応じて `artifacts/wsl/phase02/text/006-orders-category-summary.txt`
