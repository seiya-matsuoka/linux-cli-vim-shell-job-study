# Kata 004: diff

## 目的

2つのファイルの差分を確認できるようにする。

## 学習対象

- `diff`
- `diff -u`

## 作業ディレクトリ

```bash
katas/02_text/004_diff/workspace/
```

## 課題

以下を順に実行する。

1. `app_v1.conf` と `app_v2.conf` を比較する
2. 通常の `diff` を確認する
3. `diff -u` を確認する
4. 差分出力を artifacts に保存する

## 実施コマンド例

```bash
diff app_v1.conf app_v2.conf
diff -u app_v1.conf app_v2.conf
```

## 確認ポイント

- `diff` は差分確認の基本
- `-u` は読みやすい unified diff
- 設定変更の確認やレビューの基礎になる

## 残すもの

- `artifacts/wsl/phase02/text/004-app-conf.diff`
