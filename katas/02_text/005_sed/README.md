# Kata 005: sed

## 目的

単純な置換や抽出の基本を理解する。

## 学習対象

- `sed -n`
- `p`
- `s/old/new/`
- `s/old/new/g`

## 作業ディレクトリ

```bash
katas/02_text/005_sed/workspace/
```

## 課題

以下を順に実行する。

1. 先頭 3 行を表示する
2. `localhost` を `127.0.0.1` に置換する
3. すべての `localhost` を一括置換する
4. `DB_` を含む行を表示する
5. 置換結果をファイルへ保存する

## 実施コマンド例

```bash
sed -n '1,3p' env.list
sed 's/localhost/127.0.0.1/' env.list
sed 's/localhost/127.0.0.1/g' env.list
sed '/DB_/p' env.list
sed 's/localhost/127.0.0.1/g' env.list > env.updated.list
```

## 確認ポイント

- `sed` はストリームエディタ
- 単純置換の基本は `s/old/new/`
- 最初は `-i` を使わず、出力リダイレクトで安全に扱う

## 残すもの

- 必要に応じて `artifacts/wsl/phase02/text/005-env-updated.list`
