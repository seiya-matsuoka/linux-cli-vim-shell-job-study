# Kata 006: Help, Man, Info

## 目的

コマンドの調べ方を身につけ、自力で確認できるようにする。

## 学習対象

- `--help`
- `man`
- `info`
- `less`

## 課題

以下を順に実行する。

1. `ls --help` を確認する
2. `man ls` を確認する
3. `info ls` を確認する
4. `less` の基本操作で閲覧する
5. 必要に応じてファイルへ出力して残す

## 実施コマンド例

```bash
ls --help | less
man ls
info ls
```

必要に応じて保存する。

```bash
ls --help > artifacts-sample.txt
man ls | col -b > man-ls-sample.txt
```

## 確認ポイント

- `--help` は素早い確認向き
- `man` は詳細な確認向き
- `info` は体系的な説明向き
- `less` で大きな出力を読む基本に慣れる

## 残すもの

- `artifacts/wsl/phase01/cli/006-ls-help.txt`
- `artifacts/wsl/phase01/cli/006-man-ls.txt`
