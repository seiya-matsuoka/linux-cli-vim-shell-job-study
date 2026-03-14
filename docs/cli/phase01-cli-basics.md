# Phase 1 CLI Basics

## 目的

- CLI 操作への抵抗をなくす
- 基本コマンドを手で扱えるようにする
- パイプ、リダイレクト、終了ステータスを理解する
- 今後の Linux 学習の土台になる操作を固める

## 学習項目

- ファイル / ディレクトリ操作
- パスの理解
- リダイレクト / パイプ
- exit code
- 引用符とエスケープ
- `man` / `--help` / `info`

## 学んだコマンド

### ファイル / ディレクトリ操作

- `pwd`
  - 現在いるディレクトリの絶対パスを表示する
- `ls`
  - ディレクトリ内のファイルやサブディレクトリを一覧表示する
- `cd`
  - ディレクトリを移動する
- `mkdir`
  - ディレクトリを作成する
- `touch`
  - 空ファイルを作成する、またはタイムスタンプを更新する
- `cp`
  - ファイルやディレクトリをコピーする
- `mv`
  - ファイルやディレクトリを移動する、またはリネームする
- `rm`
  - ファイルを削除する

### パス

- 絶対パス
  - `/` から始まるフルパス
- 相対パス
  - 現在地を基準にしたパス
- `~`
  - ホームディレクトリ
- `.`
  - 現在のディレクトリ
- `..`
  - 親ディレクトリ

### リダイレクト / パイプ

- `>`
  - 標準出力をファイルに上書き出力する
- `>>`
  - 標準出力をファイルに追記する
- `2>`
  - 標準エラー出力をファイルに出力する
- `2>&1`
  - 標準エラー出力を標準出力と同じ出力先にまとめる
- `|`
  - 左側コマンドの出力を右側コマンドの入力として渡す

### exit code

- `$?`
  - 直前に実行したコマンドの終了ステータスを表示する
- `&&`
  - 左側コマンドが成功したときだけ右側コマンドを実行する
- `||`
  - 左側コマンドが失敗したときだけ右側コマンドを実行する

### 引用符 / エスケープ

- シングルクォート `'...'`
  - 中身を文字列そのままとして扱う
- ダブルクォート `"..."`
  - 変数展開や一部の特殊文字解釈が行われる

- バックスラッシュ `\`
  - 直後の文字をエスケープする

### 調べ方

- `man`
  - コマンドの詳細なマニュアルを読む
- `--help`
  - コマンドの概要やオプションを素早く確認する
- `info`
  - より体系的なドキュメントを読む

## 実際にやったこと

### Kata 001: ファイル / ディレクトリ操作

以下のような操作を実施した。

```bash
cd ./katas/01_cli/001_files-and-dirs/workspace
mkdir archive temp notes
cp todo.txt notes/todo-copy.txt
mv notes/todo-copy.txt archive/todo-moved.txt
touch temp/draft.txt
rm temp/draft.txt
```

この演習で確認したこと。

- ディレクトリ作成は `mkdir`
- ファイルコピーは `cp`
- ファイル移動・リネームは `mv`
- 空ファイル作成は `touch`
- 削除は `rm`
- 実行後は `ls` や `find` で状態確認するのが重要

### Kata 002: パスの理解

以下のような操作を実施した。

```bash
pwd
cd ..
pwd
cd workspace
pwd
cd /xxx/linux-cli-vim-shell-job-study
pwd
cd ~
pwd
```

この演習で確認したこと。

- 絶対パスは今どこにいても同じ場所を指せる
- 相対パスは現在地によって意味が変わる
- `~` はホームディレクトリを表す
- `.` と `..` は CLI 操作で頻繁に使う

### Kata 003: リダイレクト / パイプ

以下のような操作を実施した。

```bash
echo "phase1 start" > output.txt
echo "second line" >> output.txt
grep ERROR app.log
grep INFO app.log | wc -l
ls not-exist-file 2> error.txt
(ls app.log && ls not-exist-file) > mixed.txt 2>&1
```

この演習で確認したこと。

- `>` は上書き、`>>` は追記
- `|` を使うと複数コマンドをつないで処理できる
- エラー出力は標準出力とは別で、`2>` で分けて保存できる
- `2>&1` で標準エラーを標準出力と同じ場所へ流せる

### Kata 004: exit code

以下のような操作を実施した。

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
```

この演習で確認したこと。

- 正常終了は通常 `0`
- 異常終了は通常 `0` 以外
- `&&` と `||` は終了ステータスに応じた分岐として使える
- Shell Script の条件分岐を理解するための前提になる

### Kata 005: 引用符とエスケープ

以下のような操作を実施した。

```bash
name="Seiya"
mkdir -p "dir with space"
touch "dir with space/file one.txt"

echo "$name"
echo '$name'
echo \"quoted\"
ls "dir with space"
```

この演習で確認したこと。

- ダブルクォートは変数展開される
- シングルクォートはそのまま出力される
- スペースを含むパスでは引用符が重要
- 今後 Shell Script でバグを防ぐためにもクォートは非常に重要

### Kata 006: man / --help / info

以下のような操作を実施した。

```bash
man ls
ls --help | less
info ls
```

この演習で確認したこと。

- `--help` はざっと確認したいときに便利
- `man` は詳細な使い方の確認に向いている
- `info` はより体系的なドキュメント
- まず `--help`、必要なら `man`、さらに必要なら `info` の流れで使うとよい

## 重要ポイント整理

### `>` と `>>` の違い

- `>` は出力先ファイルを上書きする
- `>>` は出力先ファイルに追記する

例:

```bash
echo "line1" > sample.txt
echo "line2" >> sample.txt
```

### `|` の意味

左のコマンドの標準出力を、右のコマンドの標準入力へ渡す。

例:

```bash
grep ERROR app.log | wc -l
```

### `$?` の意味

直前のコマンドの終了ステータスを表す。

例:

```bash
ls existing-file
echo $?

ls not-found-file
echo $?
```

### `"..."` と `'...'` の違い

- `"..."` は変数展開される
- `'...'` はそのまま文字列扱い

例:

```bash
name="Seiya"
echo "$name"
echo '$name'
```

### `man`, `--help`, `info` の使い分け

- 手早く見る: `--help`
- しっかり調べる: `man`
- より詳しく体系的に読む: `info`

## メモ

- CLI は「実行後に状態を確認する」までがセット
- まず `pwd` と `ls` で現在地と状態を確認する癖をつける
- パスが曖昧なときは絶対パスを使うと混乱しにくい
- Shell Script を安全に書くには、クォートと exit code の理解が重要
- コマンドの使い方は、まず `--help` と `man` を引く習慣をつける
