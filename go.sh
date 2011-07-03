 #!/bin/bash
 ./mentohustoff -uusername -ppassword -neth0 -i192.168.0.1 -m255.255.255.0 -g0.0.0.0 -s0.0.0.0 -o0.0.0.0
 ./mentohust -k
 ./mentohust

 echo 1 > /proc/sys/net/ipv4/ip_forward
 for f in /proc/sys/net/ipv4/conf/*/rp_filter ; do echo 1 > $f ; done

ifconfig eth0:0 192.168.8.1 up 
iptables -t nat -F
iptables -t nat -A POSTROUTING -s 192.168.8.0/24 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE

