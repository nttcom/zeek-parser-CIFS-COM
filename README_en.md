# Zeek-Parser-CIFS-COM

## Overview

Zeek-Parser-CIFS-COM is a Zeek plug-in that can analyze communication using CIFS Browser Protocol.

## Usage

### Manual Installation

Before using this plug-in, please make sure Zeek, Spicy has been installed.

````
# Check Zeek
~$ zeek -version
zeek version 5.0.0

# Check Spicy
~$ spicyz -version
1.3.16
~$ spicyc -version
spicyc v1.5.0 (d0bc6053)

# As a premise, the path of zeek in this manual is as below
~$ which zeek
/usr/local/zeek/bin/zeek
````

Use `git clone` to get a copy of this repository to your local environment.
```
~$ git clone https://github.com/nttcom/zeek-parser-CIFS-COM.git
```

Compile source code and copy the object files to the following path.
```
~$ cd ~/zeek-parser-CIFS-COM/analyzer
~$ spicyz -o CIFS_B.hlto CIFS_B.spicy CIFS_B.evt
# CIFS_B.hlto will be generated
~$ cp CIFS_B.hlto /usr/local/zeek/lib/zeek-spicy/modules/
```

Then, copy the zeek file to the following paths.
```
~$ cd ~/zeek-parser-CIFS-COM/scripts/
~$ cp main.zeek /usr/local/zeek/share/zeek/site/
```

Finally, import the Zeek plugin.
```
~$ tail /usr/local/zeek/share/zeek/site/local.zeek
... Omit ...
@load CIFS_B
```

This plug-in generates a `cifs.log` by the command below:
```
~$ cd ~/zeek-parser-CIFS-COM/testing/Traces
~$ zeek -Cr test.pcap /usr/local/zeek/share/zeek/site/main.zeek
```

## Log type and description
This plug-in monitors all functions of cifs and outputs them as `cifs.log`.

| Field | Type | Description |
| --- | --- | --- |
| ts | time | timestamp of the communication |
| SrcIP | addr | source IP address  |
| SrcMAC | string | source MAC address |
| ServerName | string | name of the server |
| OSVersion | string | OS version |
| ServerType | string | type of the server |
| BrowserVersion | string | browser version |
| Signature | string | signature |
| HostComment | string | comment information related to the host |

An example of `cifs.log` is as follows:
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

## Related Software

This plug-in is used by [OsecT](https://github.com/nttcom/OsecT).

