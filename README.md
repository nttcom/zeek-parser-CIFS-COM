# Zeek-Parser-CIFS-COM

English is [here](https://github.com/nttcom/zeek-parser-CIFS-COM/blob/main/README_en.md)

## 概要

Zeek-Parser-CIFS-COMとはCIFS Browser Protocolを解析できるZeekプラグインです。

## 使い方

### マニュアルインストール

本プラグインを利用する前に、Zeek, Spicyがインストールされていることを確認します。
```
# Zeekのチェック
~$ zeek -version
zeek version 5.0.0

# Spicyのチェック
~$ spicyz -version
1.3.16
~$ spicyc -version
spicyc v1.5.0 (d0bc6053)

# 本マニュアルではZeekのパスが以下であることを前提としています。
~$ which zeek
/usr/local/zeek/bin/zeek
```

本リポジトリをローカル環境に `git clone` します。
```
~$ git clone https://github.com/nttcom/zeek-parser-CIFS-COM.git
```

ソースコードをコンパイルして、オブジェクトファイルを以下のパスにコピーします。
```
~$ cd ~/zeek-parser-CIFS-COM/analyzer
~$ spicyz -o CIFS_B.hlto CIFS_B.spicy CIFS_B.evt
# CIFS_B.hltoが生成されます
~$ cp CIFS_B.hlto /usr/local/zeek/lib/zeek-spicy/modules/
```

同様にZeekファイルを以下のパスにコピーします。
```
~$ cd ~/zeek-parser-CIFS-COM/scripts/
~$ cp main.zeek /usr/local/zeek/share/zeek/site/
```

最後にZeekプラグインをインポートします。
```
~$ tail /usr/local/zeek/share/zeek/site/local.zeek
...省略...
@load CIFS_B
```

本プラグインを使うことで `cifs.log` が生成されます。
```
~$ cd ~/zeek-parser-CIFS-COM/testing/Traces
~$ zeek -Cr test.pcap /usr/local/zeek/share/zeek/site/main.zeek
```

## ログのタイプと説明
本プラグインはcifsの全ての関数を監視して`cifs.log`として出力します。

| フィールド | タイプ | 説明 |
| --- | --- | --- |
| ts | time | 通信した時のタイムスタンプ |
| SrcIP | addr | 送信元IPアドレス  |
| SrcMAC | string | 送信元MACアドレス |
| ServerName | string | サーバーの名前 |
| OSVersion | string | OSのバージョン |
| ServerType | string | サーバーのタイプ |
| BrowserVersion | string | ブラウザのバージョン |
| Signature | string | シグネチャー |
| HostComment | string | ホストに関連するコメント情報 |

`cifs.log` の例は以下のとおりです。
```
#separator \x09
#set_separator	,
#empty_field	(empty)
#unset_field	-
#path	cifs
#open	2023-09-13-02-32-42
#fields	ts	SrcIP	SrcMAC	ServerName	OSVersion	ServerType	BrowserVersion	Signature	HostComment
#types	time	addr	string	string	string	string	string	string	string
1523724456.329519	192.168.1.35	08:00:27:b9:d0:0a	SNG-WIN2K	5.0	0x1003	15.1	0xaa55	(empty)
1523724487.160319	192.168.1.35	08:00:27:b9:d0:0a	SNG-WIN2K	5.0	0x51003	15.1	0xaa55	(empty)
1523724541.105258	192.168.1.37	08:00:27:fb:de:c8	SNG-WINNT4	4.0	0x9002	15.1	0xaa55	(empty)
#close	2023-09-13-02-32-43
```

## 関連ソフトウェア

本プラグインは[OsecT](https://github.com/nttcom/OsecT)で利用されています。
