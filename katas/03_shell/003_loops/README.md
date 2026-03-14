# Kata 003: Loops

## 目的

`for` と `while read` の基本を理解する。

## 学習対象

- `for`
- `while IFS= read -r`
- ファイル読み込み

## 作業ディレクトリ

```bash
katas/03_shell/003_loops/workspace/
```

## 課題

以下を順に実行する。

1. 固定値一覧を `for` で回す
2. `users.txt` を `while read` で 1 行ずつ読む
3. 実行結果を確認する

## 実施コマンド例

```bash
chmod +x for_loop.sh while_read.sh
./for_loop.sh
./while_read.sh
```

## 確認ポイント

- 固定値一覧なら `for`
- ファイル読み込みなら `while IFS= read -r`

## 残すもの

- `artifacts/wsl/phase03/shell/003-loops-output.txt`
