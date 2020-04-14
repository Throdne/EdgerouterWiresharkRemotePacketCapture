# EdgeRouter Wireshark Remote Packet Capture
Capture packets of an EdgeRouter interface and forward them to Wireshark over an SSH connection.

[Project Site](https://github.com/Throdne/EdgerouterWiresharkRemoteCapture)

### Prerequisites:
- [Wireshark](https://www.wireshark.org/) v3.2.3 or higher
- SSH-RSA Key setup on your EdgeRouter

Example
```
bash ./wiresharkedgerouter.sh -u ubnt -s 192.168.1.1 -p 22 -i eth0 -f "host not 1.1.1.1"
```

### Parameters:
`-u` 
__User__: this is the user of the EdgeRouter you will be connecting with

`-s`
__Server__: The IP or hostname of the EdgeRouter

`-p`
__SSH Port__ *(optional | default: 22)*: The listen port on the EdgeRouter. Use this if 22 is not the default listening port or if port forwarding is setup to another port. 

`-i`
__Interface__: The interface on the EdgeRouter you want to listen to. e.g eth0

`-f`
__Filter__ *(optional)*: If you want to filter traffic before forwarding to Wireshark. Using this will reduce the bandwidth over the SSH connection. Use if you have limit connection speed. Filters will need to be inclosed in quotes `" "`. Also, the filter rules are tcpdump rules (not Wireshark)
- [tcpdump man pages](https://www.tcpdump.org/manpages/tcpdump.1.html)
- [Helpful tcpdump rules](https://danielmiessler.com/study/tcpdump/)

### Disclamer:
This code has only been tested on MacOS Catalina with Wireshark v3.2.3