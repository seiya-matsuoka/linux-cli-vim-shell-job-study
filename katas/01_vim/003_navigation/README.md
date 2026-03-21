# Kata 003: Navigation, Undo, Redo

## 目的

Vim の移動、削除、undo / redo の基本を固める。

## 学習対象

- `gg`
- `G`
- `10G`
- `0`
- `$`
- `w`
- `b`
- `dd`
- `u`
- `Ctrl-r`

## 対象ファイル

```bash
katas/01_vim/003_navigation/notes.txt
```

## 課題

対象ファイルを Vim で開き、以下を実施する。

1. `gg` で先頭へ移動する
2. `G` で末尾へ移動する
3. `10G` で 10 行目へ移動する
4. `0`, `$` で行頭 / 行末へ移動する
5. `dd` で 10 行目を削除する
6. `u` で undo する
7. `Ctrl r` で redo する
8. 最後は `u` で元に戻して保存する

## 実施コマンド例

```bash
vim /xxx/linux-cli-vim-shell-job-study/katas/01_vim/003_navigation/notes.txt
```

## 確認ポイント

- 行単位 / ファイル単位で移動できる
- 削除しても undo / redo できる
- 編集を怖がらずに試せるようになる

## 残すもの

- 行番号付きファイルを `artifacts/wsl/phase01/vim/003-navigation-numbered.txt` に保存
