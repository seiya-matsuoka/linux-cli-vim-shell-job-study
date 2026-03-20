# VirtualBox Network and Connection Policy

## 目的

Phase 4 の学習で使用する VirtualBox VM の接続方式と運用方針を明確にする。

## 基本方針

- ネットワークは NAT を使用する
- ホスト側からゲスト側への SSH 接続はポートフォワーディングで行う
- Phase 4 では Windows 側からの GUI クライアント接続を正式な接続方式として扱う

## 採用した方式

### VirtualBox

- Network Adapter 1: NAT

### SSH 接続

- Host: `127.0.0.1`
- Host Port: `2222`
- Guest Port: `22`

### 接続ツール

- TeraTerm
- WinSCP

## WSL との関係

今回の構成では、WSL から `127.0.0.1:2222` を使った SSH は正式な接続確認手段として採用しない。

理由:

- WSL 側のネットワークモードや localhost の扱いに左右される
- 今回の学習では Windows 側 GUI クライアントによる接続が主目的である
- TeraTerm / WinSCP が問題なく接続できていれば、Phase 4 の学習前提として十分である

## Phase 4 学習での位置づけ

この接続方式は、以下の学習項目の基盤とする。

- SSH 接続
- 鍵認証
- systemd
- journalctl
- /var/log
- 権限確認
- ファイル転送
