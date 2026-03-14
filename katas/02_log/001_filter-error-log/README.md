# Kata 001: Filter Error Log

## 目的

ログからエラー行だけを抽出できるようにする。

## 学習対象

- `grep`
- `grep -n`
- `wc -l`
- `sed -n '/PATTERN/p'`

## 作業ディレクトリ

```bash
katas/02_log/001_filter-error-log/workspace/
```

## 課題

以下を順に実行する。

1. `ERROR` 行だけ抽出する
2. 行番号付きで `ERROR` 行を抽出する
3. `ERROR` 件数を数える
4. `ERROR` 行だけ別ファイルへ保存する
5. `sed` でも同様の抽出を試す

## 実施コマンド例

```bash
grep ERROR application.log
grep -n ERROR application.log
grep ERROR application.log | wc -l
grep ERROR application.log > error-only.log
sed -n '/ERROR/p' application.log
```

## 確認ポイント

- ログ抽出の基本は `grep`
- 件数確認は `wc -l`
- 同種の抽出を `sed` でも行える

## 残すもの

- `artifacts/wsl/phase02/log/001-error-only.log`
- `artifacts/wsl/phase02/log/001-error-lines-numbered.txt`
