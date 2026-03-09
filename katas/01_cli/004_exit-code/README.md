# Kata 004: Exit Code

## 目的

終了ステータスの基本と、`&&`, `||` の使い方を理解する。

## 学習対象

- `$?`
- `true`
- `false`
- `&&`
- `||`
- `test`

## 作業ディレクトリ

```bash
katas/01_cli/004_exit-code/workspace/
```

## 課題

以下を順に実行する。

1. `true` 実行後の終了ステータスを確認する
2. `false` 実行後の終了ステータスを確認する
3. 存在するファイルに対して `ls` を実行し終了ステータスを確認する
4. 存在しないファイルに対して `ls` を実行し終了ステータスを確認する
5. `&&` を使って成功時だけ次のコマンドを実行する
6. `||` を使って失敗時だけ次のコマンドを実行する
7. `test -f` の結果と終了ステータスを確認する

## 実施コマンド例

```bash
true
echo $?

false
echo $?

ls check-target.txt
echo $?

ls no-such-file
echo $?

ls check-target.txt && echo "success"
ls no-such-file || echo "failed"

test -f check-target.txt
echo $?

test -f not-found.txt
echo $?
```

## 確認ポイント

- 成功時の終了ステータスは通常 `0`
- 失敗時は通常 `0` 以外
- `&&` は成功時実行
- `||` は失敗時実行

## 残すもの

- 結果を `artifacts/wsl/phase01/cli/004-exit-code-results.txt` に保存
