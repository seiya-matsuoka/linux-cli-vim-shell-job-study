# Phase 4 Environment Summary

## 目的

Phase 4 を開始する前提として、VirtualBox 上の Linux VM、TeraTerm、WinSCP を使った接続環境を構築し、その前提条件を固定する。

## このファイルの位置づけ

このファイルは、Phase 4 本体の学習を始める前に必要な環境構築の概要をまとめたものとする。

本ファイルでは以下を記録する。

- VM の基本構成
- ネットワーク構成
- SSH 接続方式
- TeraTerm / WinSCP 接続確認結果
- 今後の Phase 4 学習で使う前提条件

## 構築対象

- VirtualBox 上の Linux VM
- TeraTerm
- WinSCP

## 構築方針

### VM の役割

- Phase 4 以降のサーバ運用系学習の実行環境
- SSH、権限、systemd、ログ確認などを体験する環境

### 接続方針

- VirtualBox のネットワークは NAT を使用する
- SSH はホスト側ポートフォワーディングを使って接続する
- Windows 側からの接続確認は TeraTerm / WinSCP を使用する

## VM 基本情報

- VM 名: `ubuntu-server-phase04`
- ゲスト OS: `Ubuntu Server 24.04 LTS`
- メモリ: `4096 MB`
- CPU: `2`
- ディスク: `20 GB / 可変`
- VirtualBox バージョン: `7.1.8`

## ネットワーク情報

- Adapter 1: NAT
- ポートフォワーディング:
  - ホスト側: `127.0.0.1:2222`
  - ゲスト側: `22`
- SSH 接続先:
  - Host: `127.0.0.1`
  - Port: `2222`

## ユーザー情報

- Linux ユーザー名: `xxx`
- 接続方式:
  - TeraTerm: パスワード認証
  - WinSCP: SFTP + パスワード認証

## 接続確認結果

### WSL からの SSH

- `127.0.0.1:2222` への SSH は今回の構成では使用しない
- Windows 側からの接続確認を優先する

### TeraTerm

- 接続確認: OK
- ログイン確認: OK
- `whoami`, `hostname`, `pwd` 実行確認: OK

### WinSCP

- 接続確認: OK
- ホームディレクトリ参照: OK
- テストファイル確認: OK

## この時点で環境構築完了とみなす条件

- VirtualBox 上に Linux VM が作成済み
- Linux 側で SSH サービスが動作している
- TeraTerm から SSH 接続できる
- WinSCP から SFTP 接続できる

## 今後の Phase 4 学習で使う前提

- GUI クライアントは TeraTerm と WinSCP を使う
- サーバ運用系の操作は VM 上で行う

## 補足

実際の接続ログ、疎通確認結果、ポートフォワーディング設定などは以下に保存する。

- `artifacts/virtualbox/setup/`
