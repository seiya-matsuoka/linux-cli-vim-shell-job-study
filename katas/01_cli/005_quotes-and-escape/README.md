# Kata 005: Quotes and Escape

## 目的

クォートとエスケープの基礎を理解し、Shell で安全に文字列やパスを扱えるようにする。

## 学習対象

- シングルクォート
- ダブルクォート
- バックスラッシュ
- スペースを含むパス
- 変数展開

## 作業ディレクトリ

```bash
katas/01_cli/005_quotes-and-escape/workspace/
```

## 課題

以下を順に実行する。

1. 変数を定義する
2. スペースを含むディレクトリとファイルを作成する
3. ダブルクォートで変数展開されることを確認する
4. シングルクォートで変数展開されないことを確認する
5. エスケープで引用符を表示する
6. スペースを含むパスを安全に扱う

## 実施コマンド例

```bash
name="Seiya"
mkdir -p "dir with space"
touch "dir with space/file one.txt"

echo "$name"
echo '$name'
echo \"quoted\"
ls "dir with space"
cat "dir with space/file one.txt"
```

## 確認ポイント

- `"..."` では変数展開される
- `'...'` では変数展開されない
- スペースを含むパスではクォートが必要
- クォート不足は Shell Script の不具合原因になりやすい

## 残すもの

- 実行結果を `artifacts/wsl/phase01/cli/005-quotes-results.txt` に保存
