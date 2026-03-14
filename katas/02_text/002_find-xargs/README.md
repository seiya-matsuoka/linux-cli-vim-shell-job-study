# Kata 002: find and xargs

## 目的

ファイル検索と、その結果を別コマンドへ渡す処理を理解する。

## 学習対象

- `find`
- `-type`
- `-name`
- `xargs`
- `-print0`
- `xargs -0`

## 作業ディレクトリ

```bash
katas/02_text/002_find-xargs/workspace/
```

## 課題

以下を順に実行する。

1. ファイルを一覧表示する
2. `*.log` だけを探す
3. ディレクトリだけを探す
4. 見つけた `*.log` を対象に `ERROR` を検索する
5. `-print0` と `xargs -0` を使った形も確認する

## 実施コマンド例

```bash
find .
find . -type f
find . -type f -name "*.log"
find . -type d
find . -type f -name "*.log" | xargs grep ERROR
find . -type f -name "*.log" -print0 | xargs -0 grep ERROR
```

## 確認ポイント

- `find` は条件付き検索
- `xargs` は標準入力を引数に変換する
- 実務では `-print0` / `-0` を知っておくと安全

## 残すもの

- 必要に応じて `artifacts/wsl/phase02/text/002-find-log-files.txt`
- 必要に応じて `artifacts/wsl/phase02/text/002-xargs-error-search.txt`
