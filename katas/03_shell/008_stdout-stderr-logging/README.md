# Kata 008: stdout, stderr, Logging

## 目的

ログ出力の基本と stdout / stderr 分離を理解する。

## 学習対象

- `echo`
- `>&2`
- stdout
- stderr
- ログ関数

## 作業ディレクトリ

```bash
katas/03_shell/008_stdout-stderr-logging/workspace/
```

## 課題

以下を順に実行する。

1. `log_info`, `log_error` 関数を作る
2. 入力ファイルが存在する場合は通常ログを出す
3. 入力ファイルが存在しない場合はエラーログを出す
4. stdout と stderr を別ファイルへリダイレクトして確認する

## 実施コマンド例

```bash
chmod +x logging.sh
./logging.sh
./logging.sh no-such-file

./logging.sh > stdout.log 2> stderr.log
./logging.sh no-such-file > stdout-errorcase.log 2> stderr-errorcase.log
```

## 確認ポイント

- 通常ログは stdout
- エラーログは stderr
- `>&2` で stderr に出せる
- 運用系スクリプトではログ分離が重要

## 残すもの

- `artifacts/wsl/phase03/shell/008-stdout.log`
- `artifacts/wsl/phase03/shell/008-stderr.log`
- `artifacts/wsl/phase03/shell/008-stdout-errorcase.log`
- `artifacts/wsl/phase03/shell/008-stderr-errorcase.log`
