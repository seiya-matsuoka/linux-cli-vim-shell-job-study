# Phase 2 Text Processing Cookbook

## 目的

- ログ、CSV、設定ファイルを扱えるようにする
- 検索、抽出、整形、差分確認の基本を固める
- 実務でよく使うテキスト処理コマンドの入口を理解する

## 学習項目

- `grep`
- `ripgrep`
- `find`
- `xargs`
- `sort`
- `uniq`
- `wc`
- `cut`
- `tr`
- `diff`
- `sed`
- `awk`

## 学んだコマンド

### `grep`

文字列やパターンに一致する行を抽出する基本コマンド。

よく使った例:

```bash
grep ERROR app.log
grep -n ERROR app.log
grep -i warn app.log
grep -v INFO app.log
```

確認したこと。

- `-n` で行番号表示
- `-i` で大文字小文字無視
- `-v` で非一致行表示

### `ripgrep`

ディレクトリ横断検索に強い検索コマンド。  
単純検索は `grep`、複数ファイルをまたぐ検索は `rg` が使いやすい。

よく使った例:

```bash
rg ERROR .
rg -n WARN .
rg -i timeout .
```

### `find`

ファイルやディレクトリを条件付きで探すコマンド。

よく使った例:

```bash
find .
find . -type f
find . -type f -name "*.log"
find . -type d
```

確認したこと。

- `-type f` はファイル
- `-type d` はディレクトリ
- `-name` で名前パターン指定

### `xargs`

標準入力で受け取った一覧を、別コマンドの引数として渡す。

よく使った例:

```bash
find . -type f -name "*.log" | xargs grep ERROR
find . -type f -name "*.log" -print0 | xargs -0 grep ERROR
```

確認したこと。

- `find` と組み合わせると強い
- 実務では `-print0` と `xargs -0` を意識した方が安全

### `sort`

行を並べ替える。

例:

```bash
sort names.txt
sort users.csv
```

### `uniq`

重複行をまとめる。  
ただし、連続した重複しかまとめないため、通常は `sort | uniq` の形で使う。

例:

```bash
sort names.txt | uniq
sort names.txt | uniq -c
```

### `wc`

行数、単語数、文字数を数える。

例:

```bash
wc names.txt
wc -l names.txt
wc -w message.txt
wc -c message.txt
```

### `cut`

区切り文字ベースで列を取り出す。

例:

```bash
cut -d',' -f2 users.csv
cut -d',' -f2,3 users.csv
```

### `tr`

文字変換や文字置換を行う。

例:

```bash
cat message.txt | tr '[:lower:]' '[:upper:]'
echo 'a,b,c,d' | tr ',' '\n'
```

### `diff`

2つのファイルの差分を比較する。

例:

```bash
diff app_v1.conf app_v2.conf
diff -u app_v1.conf app_v2.conf
```

確認したこと。

- `-u` の unified diff が見やすい
- 設定ファイル比較や変更確認に役立つ

### `sed`

ストリームエディタ。置換や抽出に使う。

例:

```bash
sed -n '1,3p' env.list
sed 's/localhost/127.0.0.1/' env.list
sed 's/localhost/127.0.0.1/g' env.list
sed '/DB_/p' env.list
```

確認したこと。

- `s/old/new/` が基本
- 最初は `-i` ではなく出力リダイレクトの方が安全

### `awk`

列単位の抽出や集計に強い。

例:

```bash
awk -F',' 'NR>1 {print $1, $3, $4}' orders.csv
awk -F',' 'NR>1 {sum += $4} END {print sum}' orders.csv
awk -F',' 'NR>1 {count[$3]++; sum[$3]+=$4} END {for (k in count) print k, count[k], sum[k]}' orders.csv
```

確認したこと。

- `-F','` で区切り文字指定
- `$1`, `$2` は列番号
- `NR` は行番号
- `END` で最終集計できる

## 実際にやったこと

### `katas/02_text`

#### 001 `grep`, `rg`

- ログファイルから `ERROR`、`WARN`、`timeout` を検索した
- `grep` と `rg` の両方を試した
- `-n`, `-i`, `-v` の基本オプションを確認した

#### 002 `find`, `xargs`

- `find` で `*.log` を探した
- `xargs` と組み合わせて `ERROR` を一括検索した
- `-print0` / `-0` の形も確認した

#### 003 `sort`, `uniq`, `wc`, `cut`, `tr`

- 名前リストを並べ替えて重複件数を数えた
- CSV の列を `cut` で抽出した
- 文字列を `tr` で大文字化した
- `wc` で行数、単語数、文字数を確認した

#### 004 `diff`

- 2つの設定ファイルの差分を比較した
- `diff -u` の結果を artifacts に保存した

#### 005 `sed`

- `localhost` を `127.0.0.1` へ置換した
- 行抽出と部分表示を確認した

#### 006 `awk`

- CSV の金額列を合計した
- category ごとの件数と合計を集計した

### `katas/02_log`

#### 001 エラーログ抽出

- `application.log` から `ERROR` 行だけ抽出した
- `grep -n` で行番号付き抽出も確認した
- `sed -n '/ERROR/p'` でも同じ系統の処理を試した

#### 002 アクセスログ集計

- ステータスコードごとの件数を集計した
- パスごとの件数を集計した
- IP ごとの件数を集計した

### `katas/02_csv`

#### 001 基本確認

- `cut` で列を取り出した
- team ごとの件数を集計した
- joined_year 列を確認した

#### 002 変換 / 集計

- 売上合計を `awk` で計算した
- category ごとの売上を集計した
- store ごとの売上を集計した

#### 003 比較

- `diff -u` で CSV 差分を比較した
- `cut` で必要列だけ抜き出して差分を見た

## 使い分けメモ

### `grep` と `rg`

- 単一ファイルの簡単な検索なら `grep`
- ディレクトリ横断や複数ファイル検索なら `rg`

### `find` と `xargs`

- `find` は探す
- `xargs` は見つけたものを別コマンドへ渡す

### `sort | uniq`

- `uniq` は連続重複しかまとめない
- 重複整理したいときは `sort | uniq` を基本形として覚える

### `sed` と `awk`

- 単純な置換や抽出は `sed`
- 列処理や集計は `awk`

## メモ

- 実務ではログ、CSV、設定ファイルをテキスト処理する機会が多い
- `grep`, `find`, `sort`, `uniq`, `wc`, `cut` は特に使用頻度が高い
- 差分確認の基本は `diff -u`
- 単純な置換は `sed`
- 列抽出と集計は `awk`
- 最初から全部覚えるのではなく、典型パターンを反復する方が定着しやすい
