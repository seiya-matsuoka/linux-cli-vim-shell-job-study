# Kata 007: set and trap

## 目的

事故りにくい Shell Script の基本として `set -euo pipefail` と `trap` の入口を理解する。

## 学習対象

- `set -euo pipefail`
- `trap`
- cleanup

## 作業ディレクトリ

```bash
katas/03_shell/007_set-and-trap/workspace/
```

## 課題

以下を順に実行する。

1. `safe_script.sh` を作成する
2. `set -euo pipefail` を入れる
3. cleanup 関数を作る
4. `trap cleanup EXIT` を設定する
5. 実行して終了時の動きを確認する

## 実施コマンド例

```bash
chmod +x safe_script.sh
./safe_script.sh
```

## 確認ポイント

- `set -euo pipefail` の各要素の意味を説明できる
- `trap` が終了時処理に使えると理解する

## 残すもの

- `artifacts/wsl/phase03/shell/007-safe-script-output.txt`
- `artifacts/wsl/phase03/shell/007-safe-script.sh`
