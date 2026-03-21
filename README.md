# Linux / CLI / Vim / Shell / Job - Study

<p>
  <img alt="Linux" src="https://img.shields.io/badge/Linux-Study-FCC624?logo=linux&logoColor=000000">
  <img alt="Ubuntu Server" src="https://img.shields.io/badge/Ubuntu%20Server-24.04-E95420?logo=ubuntu&logoColor=ffffff">
  <img alt="Bash" src="https://img.shields.io/badge/Bash-Shell%20Script-4EAA25?logo=gnubash&logoColor=ffffff">
</p>

<p>
  <img alt="WSL2" src="https://img.shields.io/badge/WSL2-Local%20Env-4D4D4D?logo=windows-terminal&logoColor=ffffff">
  <img alt="VirtualBox" src="https://img.shields.io/badge/VirtualBox-VM-183A61?logo=virtualbox&logoColor=ffffff">
  <img alt="TeraTerm" src="https://img.shields.io/badge/TeraTerm-SSH-5C2D91">
  <img alt="WinSCP" src="https://img.shields.io/badge/WinSCP-SFTP%20%2F%20SCP-178600">
</p>

Linux の基礎を、手を動かして学習した記録と成果物をまとめたリポジトリ。

CLI操作、Vim、テキスト処理、Shell Script、SSH、権限、systemd、cron / systemd timer、性能観測までを段階的に学習し、各フェーズごとに成果物を残した。

## 学習の目的

- Linux CLI 操作の基礎を固める
- Vim で最低限困らず編集できるようにする
- grep / sed / awk などの基本的なテキスト処理を扱えるようにする
- Shell Script を安全寄りに書くための基礎を身につける
- SSH、権限、systemd、cron / systemd timer など、サーバ運用の最低限を体験する
- CPU、メモリ、ディスク、ネットワークの基本観測コマンドを使えるようにする

## 学習範囲

### Phase 1: CLI + Vim 基礎

- CLI の基本操作
- パス、パイプ、リダイレクト、exit code
- プロセス / ジョブの入口
- Vim の基本編集、検索、置換

### Phase 2: テキスト処理・ファイル操作

- `grep`
- `ripgrep`
- `find`
- `xargs`
- `sort`
- `uniq`
- `wc`
- `cut`
- `tr`
- `diff`
- `sed`
- `awk`

### Phase 3: シェルスクリプト

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

### Phase 4: サーバ運用（最低限）

- ユーザー / グループの基本
- 権限
- SSH 接続
- 鍵認証
- `systemctl`
- `journalctl`
- `/var/log`

### Phase 5: ジョブ（cron / systemd timer）

- cron の基本
- 実行ユーザ
- PATH 問題
- ログ出力設計
- systemd timer の基本
- cron と timer の違い
- lock による二重起動防止
- 終了コード
- 失敗時の検知
- ジョブとプロセス / シグナルの関係

### Phase 6: 性能・監視

- `top`
- `htop`
- `uptime`
- `vmstat`
- `free`
- `df`
- `du`
- `ss`
- `curl`
- `iostat`
- `pidstat`
- 軽い負荷をかけた観測

## 使用環境・ツール

- Windows
- WSL2
- VirtualBox
- Ubuntu Server
- VS Code
- TeraTerm
- WinSCP

## リポジトリ構成

- `artifacts/`
  - 学習・検証で実際に使った出力結果、確認結果、比較結果
- `docs/`
  - 各フェーズの学習内容を整理した Markdown ドキュメント
- `examples/`
  - cron や systemd timer などの設定例
- `infra/`
  - 環境構築メモや VM 上で使った補助ファイル
- `katas/`
  - 各フェーズで手を動かして進める演習問題
- `runbooks/`
  - SSH、systemd、cron、timer、性能観測などの再現可能な手順書
- `scripts/`
  - 学習の中で作成したスクリプト
  - `bin/`, `lib/`, `jobs/` などを配置

## 学習環境の考え方

- Phase 1〜3 は主に WSL2 上で進めた
- Phase 4〜6 は主に VirtualBox 上の Ubuntu Server VM を使って進めた
- TeraTerm / WinSCP（SSH接続やファイル転送）を使い学習した
