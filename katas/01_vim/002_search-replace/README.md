# Kata 002: Search and Replace

## 目的

Vim の検索と置換に慣れる。

## 学習対象

- `/`
- `n`
- `N`
- `:%s/old/new/g`

## 対象ファイル

```bash
katas/01_vim/002_search-replace/log.txt
```

## 課題

対象ファイルを Vim で開き、以下を実施する。

1. `error` を検索する
2. `n`, `N` で検索結果を移動する
3. `error` を `ERROR` に一括置換する
4. 保存して終了する

## 実施コマンド例

```bash
vim /xxx/linux-cli-vim-shell-job-study/katas/01_vim/002_search-replace/log.txt
```

置換コマンド:

```bash
:%s/error/ERROR/g
```

## 確認ポイント

- `/` で検索できる
- `n`, `N` で移動できる
- 一括置換の基本が分かる

## 残すもの

- 編集後ファイルを `artifacts/wsl/phase01/vim/002-search-replace-result.txt` に保存
