# Kata 003: CSV Compare

## 目的

CSV ファイル同士の差分を確認できるようにする。

## 学習対象

- `diff`
- `diff -u`
- `cut`

## 作業ディレクトリ

```bash
katas/02_csv/003_compare/workspace/
```

## 課題

以下を順に実行する。

1. `users_old.csv` と `users_new.csv` を比較する
2. `diff -u` で unified diff を確認する
3. `id` と `status` 列だけを抜き出して比較する
4. 差分結果を artifacts に保存する

## 実施コマンド例

```bash
diff -u users_old.csv users_new.csv
cut -d',' -f1,3 users_old.csv > old_status.csv
cut -d',' -f1,3 users_new.csv > new_status.csv
diff -u old_status.csv new_status.csv
```

## 確認ポイント

- CSV 全体比較と、必要列だけの比較は使い分けられる
- 差分を絞ると見やすくなる

## 残すもの

- `artifacts/wsl/phase02/csv/003-users.diff`
- `artifacts/wsl/phase02/csv/003-status-only.diff`
