# Kata 002: Paths

## 目的

絶対パス、相対パス、`~`、`.`、`..` の意味を理解する。

## 学習対象

- 絶対パス
- 相対パス
- `~`
- `.`
- `..`
- `pwd`
- `cd`

## 作業ディレクトリ

```bash
katas/01_cli/002_paths/workspace/
```

## 課題

以下を順に実行する。

1. 現在地を確認する
2. 1 つ上のディレクトリへ移動する
3. 再び `workspace/` に戻る
4. リポジトリのルートへ絶対パスで移動する
5. ホームディレクトリへ移動する
6. 再度 `workspace/` に絶対パスで戻る
7. `realpath`, `dirname`, `basename` を使ってパスを確認する

## 実施コマンド例

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
cd /xxx/linux-cli-vim-shell-job-study/katas/01_cli/002_paths/workspace
pwd
realpath path-note.txt
dirname /xxx/linux-cli-vim-shell-job-study/katas/01_cli/002_paths/workspace/path-note.txt
basename /xxx/linux-cli-vim-shell-job-study/katas/01_cli/002_paths/workspace/path-note.txt
```

## 確認ポイント

- 絶対パスは `/` から始まる
- 相対パスは現在地基準
- `~` はホームディレクトリ
- `.` は現在地
- `..` は親ディレクトリ

## 残すもの

- パス確認結果を `artifacts/wsl/phase01/cli/002-paths-result.txt` に保存
