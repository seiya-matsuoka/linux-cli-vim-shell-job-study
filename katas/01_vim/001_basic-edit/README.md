# Kata 001: Basic Edit

## 目的

Vim の基本編集と保存操作に慣れる。

## 学習対象

- `i`
- `a`
- `x`
- `w`
- `b`
- `:wq`

## 対象ファイル

```bash
katas/01_vim/001_basic-edit/sample.txt
```

## 課題

対象ファイルを Vim で開き、誤字を修正する。

修正前:

```bash
Linxu is fun.
Vim is stragne at first.
I want to lrean command line.
```

修正後:

```bash
Linux is fun.
Vim is strange at first.
I want to learn command line.
```

## 実施手順

1. Vim でファイルを開く
2. `w`, `b` で単語単位に移動する
3. `i`, `a`, `x` を使って誤字を修正する
4. `:wq` で保存して終了する

## 実施コマンド例

```bash
vim /xxx/linux-cli-vim-shell-job-study/katas/01_vim/001_basic-edit/sample.txt
```

## 確認ポイント

- Vim を開いて保存終了できる
- 基本編集ができる
- ノーマルモードとインサートモードを意識できる

## 残すもの

- 編集後ファイルを `artifacts/wsl/phase01/vim/001-basic-edit-result.txt` に保存
