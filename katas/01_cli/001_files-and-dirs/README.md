# Kata 001: Files and Directories

## 目的

ファイル / ディレクトリ操作の基本を手で確認する。

## 学習対象

- `pwd`
- `ls`
- `mkdir`
- `cp`
- `mv`
- `touch`
- `rm`

## 作業ディレクトリ

```bash
katas/01_cli/001_files-and-dirs/workspace/
```

## 事前状態

`workspace/` に `todo.txt` がある状態から始める。

## 課題

以下を順に実行する。

1. 現在地を確認する
2. ディレクトリを 3 つ作成する
3. `todo.txt` をコピーする
4. コピーしたファイルを別ディレクトリへ移動する
5. 空ファイルを 1 つ作成する
6. 作成した空ファイルを削除する
7. 最後にディレクトリ構成を確認する

## 実施コマンド例

```bash
pwd
ls
mkdir archive temp notes
cp todo.txt notes/todo-copy.txt
mv notes/todo-copy.txt archive/todo-moved.txt
touch temp/draft.txt
rm temp/draft.txt
find . -maxdepth 3 | sort
```

## 確認ポイント

- `mkdir` でディレクトリが作れる
- `cp` でコピーできる
- `mv` で移動 / リネームできる
- `touch` で空ファイルを作れる
- `rm` で削除できる
- `ls` や `find` で状態確認できる

## 残すもの

- 最終構成を `artifacts/wsl/phase01/cli/001-files-and-dirs-tree.txt` に保存
