# Kata 003: sort, uniq, wc, cut, tr

## 目的

並べ替え、重複整理、件数確認、列抽出、文字変換の基本をまとめて確認する。

## 学習対象

- `sort`
- `uniq`
- `uniq -c`
- `wc`
- `wc -l`
- `wc -w`
- `wc -c`
- `cut`
- `tr`

## 作業ディレクトリ

```bash
katas/02_text/003_sort-uniq-wc-cut-tr/workspace/
```

## 課題

以下を順に実行する。

1. `names.txt` を並べ替える
2. 重複を除いて一覧化する
3. 重複件数を数える
4. `users.csv` から名前列、部署列を取り出す
5. `message.txt` を大文字化する
6. カンマ区切り文字列を改行区切りに変換する

## 実施コマンド例

```bash
sort names.txt
sort names.txt | uniq
sort names.txt | uniq -c

wc names.txt
wc -l names.txt
wc -w message.txt
wc -c message.txt

cut -d',' -f2 users.csv
cut -d',' -f2,3 users.csv

cat message.txt | tr '[:lower:]' '[:upper:]'
echo 'a,b,c,d' | tr ',' '\n'
```

## 確認ポイント

- `uniq` は通常 `sort` とセットで使う
- `wc` は件数確認に便利
- `cut` は列抽出の基本
- `tr` は文字変換の基本

## 残すもの

- 必要に応じて `artifacts/wsl/phase02/text/003-name-counts.txt`
- 必要に応じて `artifacts/wsl/phase02/text/003-user-columns.txt`
- 必要に応じて `artifacts/wsl/phase02/text/003-message-upper.txt`
