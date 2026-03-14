# Kata 001: Variables and Arguments

## 目的

変数、引数、`"$@"` の基本を理解する。

## 学習対象

- 変数
- `$1`
- `$#`
- `$*`
- `"$@"`
- デフォルト値

## 作業ディレクトリ

```bash
katas/03_shell/001_variables-and-args/workspace/
```

## 課題

以下を順に実行する。

1. `hello_args.sh` を作成する
2. 第1引数を名前として受け取る
3. 引数がないときは `guest` を使う
4. 引数個数を表示する
5. `"$@"` を使って全引数を 1 つずつ表示する
6. 複数引数で実行して違いを確認する

## 実施コマンド例

```bash
chmod +x hello_args.sh
./hello_args.sh
./hello_args.sh Seiya
./hello_args.sh "Seiya Matsuoka" "backend engineer"
```

## 確認ポイント

- `${1:-guest}` でデフォルト値を置ける
- `$#` は引数個数
- `"$@"` は複数引数を安全に扱える

## 残すもの

- `artifacts/wsl/phase03/shell/001-hello-args-output.txt`
