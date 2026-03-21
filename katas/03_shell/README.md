# Phase 3 Shell Katas

## 目的

Phase 3 のシェルスクリプト学習で扱う練習問題をまとめたディレクトリ。

このディレクトリでは、以下の基礎を実際に手を動かして確認する。

- 変数
- 引数
- `"$@"`
- 条件分岐
- ループ
- 関数
- `[ ]` と `[[ ]]`
- クォート戦略
- 戻り値
- `set -euo pipefail`
- `trap`
- ログ出力
- stdout / stderr の分離
- ShellCheck
- shfmt

## 進め方

各サブディレクトリの `README.md` を読み、課題に沿ってスクリプトを作成・実行する。

各課題では、必要に応じて以下も残す。

- `workspace/` 内の入力ファイルや演習用スクリプト
- `artifacts/` 側に保存した実行結果
- `docs/` 側にまとめた学習メモ

## 課題一覧

- `001_variables-and-args/`
  - 変数、引数、`"$@"`
- `002_conditionals/`
  - 条件分岐
- `003_loops/`
  - `for`、`while read`
- `004_functions/`
  - 関数
- `005_brackets-and-quotes/`
  - `[ ]`、`[[ ]]`、クォート
- `006_exit-and-return/`
  - 戻り値、`return`
- `007_set-and-trap/`
  - `set -euo pipefail`、`trap`
- `008_stdout-stderr-logging/`
  - ログ出力、stdout / stderr 分離
