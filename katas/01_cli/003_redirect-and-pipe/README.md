# Kata 003: Redirect and Pipe

## 目的

標準出力、標準エラー、リダイレクト、パイプの基本を理解する。

## 学習対象

- `>`
- `>>`
- `2>`
- `2>&1`
- `|`
- `grep`
- `wc`

## 作業ディレクトリ

```bash
katas/01_cli/003_redirect-and-pipe/workspace/
```

## 課題

以下を順に実行する。

1. 文字列をファイルへ上書き出力する
2. 追加の文字列を追記する
3. `app.log` から `ERROR` 行を抽出する
4. `INFO` 行の件数を数える
5. 存在しないファイルを指定してエラー出力をファイルへ保存する
6. 標準出力と標準エラーを 1 つのファイルへまとめる

## 実施コマンド例

```bash
echo "phase1 start" > output.txt
echo "second line" >> output.txt
cat output.txt
grep ERROR app.log
grep INFO app.log | wc -l
ls not-exist-file 2> error.txt
(ls app.log && ls not-exist-file) > mixed.txt 2>&1
cat mixed.txt
```

## 確認ポイント

- `>` は上書き
- `>>` は追記
- `|` はコマンド同士をつなぐ
- `2>` は標準エラーのリダイレクト
- `2>&1` は標準エラーを標準出力へ合流させる

## 残すもの

- `output.txt`
- `error.txt`
- `mixed.txt`
- 抽出結果などを `artifacts/wsl/phase01/cli/` に保存
