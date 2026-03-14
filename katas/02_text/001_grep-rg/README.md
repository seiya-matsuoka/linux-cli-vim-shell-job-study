# Kata 001: grep and ripgrep

## 目的

`grep` と `ripgrep` を使って、ログやテキストから必要な行を検索できるようにする。

## 学習対象

- `grep`
- `grep -n`
- `grep -i`
- `grep -v`
- `rg`
- `rg -n`

## 作業ディレクトリ

```bash
katas/02_text/001_grep-rg/workspace/
```

## 課題

以下を順に実行する。

1. `ERROR` を含む行を抽出する
2. 行番号付きで `ERROR` を抽出する
3. 大文字小文字を無視して `warn` を抽出する
4. `INFO` を除外して表示する
5. `ripgrep` で `WARN` を検索する
6. `ripgrep` で `timeout` を検索する

## 実施コマンド例

```bash
grep ERROR app.log
grep -n ERROR app.log
grep -i warn app.log
grep -v INFO app.log

rg ERROR .
rg -n WARN .
rg -i timeout .
```

## 確認ポイント

- `grep` は基本の検索
- `rg` はディレクトリ横断検索に強い
- `-n`, `-i`, `-v` はよく使う基本オプション

## 残すもの

- 必要に応じて `artifacts/wsl/phase02/text/001-grep-error-lines.txt`
- 必要に応じて `artifacts/wsl/phase02/text/001-rg-warn-lines.txt`
