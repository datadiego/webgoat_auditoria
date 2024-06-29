Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-06-28 16:52 CEST
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00040s latency).
Not shown: 997 closed tcp ports (conn-refused)
PORT     STATE SERVICE     VERSION
22/tcp   open  ssh         OpenSSH 9.7p1 Debian 5 (protocol 2.0)
8080/tcp open  http-proxy
9090/tcp open  zeus-admin?
2 services unrecognized despite returning data. If you know the service/version, please submit the following fingerprints at https://nmap.org/cgi-bin/submit.cgi?new-service :
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port8080-TCP:V=7.94SVN%I=7%D=6/28%Time=667ECE39%P=x86_64-pc-linux-gnu%r
SF:(GetRequest,65,"HTTP/1\.1\x20404\x20Not\x20Found\r\nConnection:\x20clos
SF:e\r\nContent-Length:\x200\r\nDate:\x20Fri,\x2028\x20Jun\x202024\x2014:5
SF:2:40\x20GMT\r\n\r\n")%r(HTTPOptions,65,"HTTP/1\.1\x20404\x20Not\x20Foun
SF:d\r\nConnection:\x20close\r\nContent-Length:\x200\r\nDate:\x20Fri,\x202
SF:8\x20Jun\x202024\x2014:52:41\x20GMT\r\n\r\n")%r(RTSPRequest,42,"HTTP/1\
SF:.1\x20400\x20Bad\x20Request\r\nContent-Length:\x200\r\nConnection:\x20c
SF:lose\r\n\r\n")%r(FourOhFourRequest,65,"HTTP/1\.1\x20404\x20Not\x20Found
SF:\r\nConnection:\x20close\r\nContent-Length:\x200\r\nDate:\x20Fri,\x2028
SF:\x20Jun\x202024\x2014:52:41\x20GMT\r\n\r\n")%r(Socks5,42,"HTTP/1\.1\x20
SF:400\x20Bad\x20Request\r\nContent-Length:\x200\r\nConnection:\x20close\r
SF:\n\r\n")%r(GenericLines,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nConte
SF:nt-Length:\x200\r\nConnection:\x20close\r\n\r\n")%r(Help,42,"HTTP/1\.1\
SF:x20400\x20Bad\x20Request\r\nContent-Length:\x200\r\nConnection:\x20clos
SF:e\r\n\r\n")%r(SSLSessionReq,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nC
SF:ontent-Length:\x200\r\nConnection:\x20close\r\n\r\n")%r(TerminalServerC
SF:ookie,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-Length:\x200\r\
SF:nConnection:\x20close\r\n\r\n")%r(TLSSessionReq,42,"HTTP/1\.1\x20400\x2
SF:0Bad\x20Request\r\nContent-Length:\x200\r\nConnection:\x20close\r\n\r\n
SF:")%r(Kerberos,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-Length:
SF:\x200\r\nConnection:\x20close\r\n\r\n")%r(SMBProgNeg,42,"HTTP/1\.1\x204
SF:00\x20Bad\x20Request\r\nContent-Length:\x200\r\nConnection:\x20close\r\
SF:n\r\n")%r(LPDString,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-L
SF:ength:\x200\r\nConnection:\x20close\r\n\r\n")%r(LDAPSearchReq,42,"HTTP/
SF:1\.1\x20400\x20Bad\x20Request\r\nContent-Length:\x200\r\nConnection:\x2
SF:0close\r\n\r\n")%r(SIPOptions,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\
SF:nContent-Length:\x200\r\nConnection:\x20close\r\n\r\n")%r(WMSRequest,42
SF:,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-Length:\x200\r\nConnect
SF:ion:\x20close\r\n\r\n")%r(oracle-tns,42,"HTTP/1\.1\x20400\x20Bad\x20Req
SF:uest\r\nContent-Length:\x200\r\nConnection:\x20close\r\n\r\n");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port9090-TCP:V=7.94SVN%I=7%D=6/28%Time=667ECE39%P=x86_64-pc-linux-gnu%r
SF:(GetRequest,65,"HTTP/1\.1\x20404\x20Not\x20Found\r\nConnection:\x20clos
SF:e\r\nContent-Length:\x200\r\nDate:\x20Fri,\x2028\x20Jun\x202024\x2014:5
SF:2:40\x20GMT\r\n\r\n")%r(WMSRequest,42,"HTTP/1\.1\x20400\x20Bad\x20Reque
SF:st\r\nContent-Length:\x200\r\nConnection:\x20close\r\n\r\n")%r(ibm-db2-
SF:das,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-Length:\x200\r\nC
SF:onnection:\x20close\r\n\r\n")%r(SqueezeCenter_CLI,42,"HTTP/1\.1\x20400\
SF:x20Bad\x20Request\r\nContent-Length:\x200\r\nConnection:\x20close\r\n\r
SF:\n")%r(GenericLines,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-L
SF:ength:\x200\r\nConnection:\x20close\r\n\r\n")%r(HTTPOptions,65,"HTTP/1\
SF:.1\x20404\x20Not\x20Found\r\nConnection:\x20close\r\nContent-Length:\x2
SF:00\r\nDate:\x20Fri,\x2028\x20Jun\x202024\x2014:52:56\x20GMT\r\n\r\n")%r
SF:(RTSPRequest,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-Length:\
SF:x200\r\nConnection:\x20close\r\n\r\n")%r(Help,42,"HTTP/1\.1\x20400\x20B
SF:ad\x20Request\r\nContent-Length:\x200\r\nConnection:\x20close\r\n\r\n")
SF:%r(SSLSessionReq,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-Leng
SF:th:\x200\r\nConnection:\x20close\r\n\r\n")%r(TerminalServerCookie,42,"H
SF:TTP/1\.1\x20400\x20Bad\x20Request\r\nContent-Length:\x200\r\nConnection
SF::\x20close\r\n\r\n")%r(TLSSessionReq,42,"HTTP/1\.1\x20400\x20Bad\x20Req
SF:uest\r\nContent-Length:\x200\r\nConnection:\x20close\r\n\r\n")%r(Kerber
SF:os,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-Length:\x200\r\nCo
SF:nnection:\x20close\r\n\r\n")%r(SMBProgNeg,42,"HTTP/1\.1\x20400\x20Bad\x
SF:20Request\r\nContent-Length:\x200\r\nConnection:\x20close\r\n\r\n")%r(F
SF:ourOhFourRequest,65,"HTTP/1\.1\x20404\x20Not\x20Found\r\nConnection:\x2
SF:0close\r\nContent-Length:\x200\r\nDate:\x20Fri,\x2028\x20Jun\x202024\x2
SF:014:53:16\x20GMT\r\n\r\n")%r(LPDString,42,"HTTP/1\.1\x20400\x20Bad\x20R
SF:equest\r\nContent-Length:\x200\r\nConnection:\x20close\r\n\r\n")%r(LDAP
SF:SearchReq,42,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nContent-Length:\x20
SF:0\r\nConnection:\x20close\r\n\r\n")%r(SIPOptions,42,"HTTP/1\.1\x20400\x
SF:20Bad\x20Request\r\nContent-Length:\x200\r\nConnection:\x20close\r\n\r\
SF:n");
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 113.13 seconds
 