# Kata 006: Exit and Return

## 目的

終了ステータスと `return` の基本を理解する。

## 学習対象

- `return`
- 成功 / 失敗
- `if function_name; then ... fi`

## 作業ディレクトリ

```bash
katas/03_shell/006_exit-and-return/workspace/
```

## 課題

以下を順に実行する。

1. 指定ファイルの存在確認関数を作る
2. 存在するときは `return 0`
3. 存在しないときは `return 1`
4. `if` と組み合わせて結果を確認する

## 実施コマンド例

```bash
chmod +x return_code.sh
./return_code.sh
```

## 確認ポイント

- `return` は終了ステータスを返す
- 値そのものを返すのとは用途が違う
- 関数の真偽判定として使える

## 残すもの

- `artifacts/wsl/phase03/shell/006-return-code-output.txt`
