# Kata 002: Conditionals

## 目的

条件分岐の基本を書けるようにする。

## 学習対象

- `if`
- `elif`
- `else`
- `fi`
- `[ ]`

## 作業ディレクトリ

```bash
katas/03_shell/002_conditionals/workspace/
```

## 課題

以下を順に実行する。

1. `check_status.sh` を作成する
2. `active`, `inactive`, それ以外で分岐する
3. 引数で status を受け取る
4. 実行結果を確認する

## 実施コマンド例

```bash
chmod +x check_status.sh
./check_status.sh active
./check_status.sh inactive
./check_status.sh pending
```

## 確認ポイント

- `if / elif / else / fi` の基本形を理解する
- 比較時に変数をクォートする

## 残すもの

- `artifacts/wsl/phase03/shell/002-check-status-output.txt`
