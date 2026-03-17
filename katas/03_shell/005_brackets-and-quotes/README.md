# Kata 005: Brackets and Quotes

## 目的

`[ ]` と `[[ ]]` の基本、およびクォート戦略を理解する。

## 学習対象

- `[ ]`
- `[[ ]]`
- クォート
- パターン比較

## 作業ディレクトリ

```bash
katas/03_shell/005_brackets-and-quotes/workspace/
```

## 課題

以下を順に実行する。

1. `[ ]` を使って `hello` 比較を行う
2. `[[ ]]` を使ってパターン比較を行う
3. クォートあり / なしでの扱いを確認する
4. ダブルクォートとシングルクォートの違いを確認する

## 実施コマンド例

```bash
chmod +x test_brackets.sh
./test_brackets.sh hello
./test_brackets.sh hi
./test_brackets.sh world
```

## 確認ポイント

- `[ ]` は基本的な test
- `[[ ]]` は Bash でより柔軟に使える
- 変数は基本ダブルクォートで囲う

## 残すもの

- `artifacts/wsl/phase03/shell/005-brackets-output.txt`
