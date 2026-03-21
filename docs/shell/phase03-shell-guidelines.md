# Phase 3 Shell Guidelines

## 目的

- 現場の Shell を読める / 直せるようにする
- 事故りにくい Shell の基本を書けるようにする
- 今後の cron / systemd timer / 運用スクリプト学習の土台を作る

## 学習項目

- 変数
- 引数
- `"$@"`
- 条件分岐
- ループ
- 関数
- `[ ]` と `[[ ]]`
- クォート戦略
- 戻り値
- `set -euo pipefail`
- `trap`
- ログ出力
- stdout / stderr の分離
- ShellCheck
- shfmt

## 学んだこと

### 変数 / 引数

変数は次のように定義する。

```bash
name="Seiya"
```

引数は `$1`, `$2` などで受け取れる。  
引数が省略されたときのデフォルト値は次のように書ける。

```bash
name="${1:-guest}"
```

引数個数は `$#`、全引数は `$*` や `$@` で扱える。

特に重要なのは `"$@"` で、複数引数を安全に個別処理するときに使う。

例:

```bash
for arg in "$@"; do
  echo "[$arg]"
done
```

### 条件分岐 / ループ

条件分岐の基本形は以下。

```bash
if [ "$status" = "active" ]; then
  echo "active"
elif [ "$status" = "inactive" ]; then
  echo "inactive"
else
  echo "unknown"
fi
```

ループは以下を確認した。

- 固定値一覧を回す `for`
- ファイルを 1 行ずつ読む `while IFS= read -r`

例:

```bash
for user in Seiya Aya Taro; do
  echo "$user"
done

while IFS= read -r user; do
  echo "$user"
done < users.txt
```

### 関数

関数は処理をまとめるために使う。

例:

```bash
say_hello() {
  local name="$1"
  echo "Hello, ${name}"
}
```

重要ポイント。

- 関数内変数は `local` を使う
- 文字列や数値を返したいときは `echo`
- 終了ステータスで成功 / 失敗を返したいときは `return`

### `[ ]` と `[[ ]]`

`[ ]` は基本的な test、`[[ ]]` は Bash でより安全かつ柔軟に使える。

例:

```bash
if [ "$value" = "hello" ]; then
  echo "matched"
fi

if [[ "$value" == h* ]]; then
  echo "pattern matched"
fi
```

今回の理解としては以下。

- 単純な条件判定は `[ ]`
- パターン比較や Bash 的に安全に書きたいときは `[[ ]]`

### クォート戦略

大事なルールの 1 つは、**変数は基本クォートする** こと。

例:

```bash
echo "$name"
```

シングルクォートとダブルクォートの違いも再確認した。

- `"..."` は変数展開される
- `'...'` はそのまま文字列になる

Shell Script で事故りにくくするため、**パスや引数や変数は基本ダブルクォートで囲う** 方針を持つことが重要だと分かった。

### 戻り値

関数では `return` で終了ステータスを返せる。

例:

```bash
check_file_exists() {
  local target="$1"

  if [ -f "$target" ]; then
    return 0
  fi

  return 1
}
```

今回の理解としては以下。

- `return` は主に成功 / 失敗を返す
- 値そのものを返したいときは `echo` + コマンド置換
- `if function_name; then ... fi` の形はよく使う

### `set -euo pipefail`

安全寄りの Shell Script の基本として `set -euo pipefail` を確認した。

```bash
set -euo pipefail
```

意味は以下。

- `-e`
  - エラー時に処理を止めやすくする
- `-u`
  - 未定義変数の利用を検知しやすくする
- `pipefail`
  - パイプ途中の失敗を見逃しにくくする

**何となく書くのではなく、事故りにくくする意図を持って書く** ことが重要だと理解した。

### `trap`

終了時の cleanup などに使う。

例:

```bash
cleanup() {
  echo "cleanup called"
}

trap cleanup EXIT
```

入口だけ触れたが、将来的には一時ファイル削除や後片付けで重要になると理解した。

### ログ出力 / stdout / stderr

通常ログとエラーログは出し分けるのが重要。

例:

```bash
log_info() {
  echo "[INFO] $*"
}

log_error() {
  echo "[ERROR] $*" >&2
}
```

今回の学習で確認したこと。

- 通常メッセージは stdout
- エラーメッセージは stderr
- `>&2` を使うと stderr に流せる
- 運用やジョブ実行時にログ分離しやすくなる

### ShellCheck / shfmt

ShellCheck は静的解析、shfmt はフォーマッタ。

今回の学習では以下を確認した。

- 書いたスクリプトを ShellCheck で検査する
- shfmt で整形する
- 「動く」だけでなく「読みやすく壊れにくい」状態を目指す

## 実際にやったこと

### `katas/03_shell`

以下を学習した。

- 001 変数・引数・`"$@"`
- 002 条件分岐
- 003 ループ
- 004 関数
- 005 `[ ]` と `[[ ]]`、クォート
- 006 戻り値
- 007 `set -euo pipefail` と `trap`
- 008 ログ出力、stdout / stderr の分離

### `scripts/bin`

今回作成した小さな実用スクリプト。

- `env_check.sh`
  - 必要コマンドが存在するか確認する
- `log_summary.sh`
  - ログ中の `ERROR`, `WARN`, `INFO` 件数を集計する
- `csv_status_report.sh`
  - CSV の status 列を集計する

### `scripts/lib`

- `common.sh`
  - `log_info`, `log_error` などの共通関数を置いた

## メモ

- Shell Script は「動けばよい」ではなく、「壊れにくく読めること」が重要
- クォート戦略は非常に重要
- 引数処理、条件分岐、ループ、関数の基本を確実に押さえる
- `set -euo pipefail`、`trap`、stderr 分離は運用系スクリプトで特に効く
