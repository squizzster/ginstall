#!/bin/bash

firewall-cmd --add-rich-rule='rule family=ipv4  port port=80 protocol=tcp  accept'
certbot
systemctl restart firewalld


