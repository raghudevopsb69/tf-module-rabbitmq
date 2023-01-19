#!/bin/bash
touch /opt/user-data.log
id >>/opt/user-data.log
labauto ansible
ansible-pull -i localhost, -U https://github.com/raghudevopsb69/roboshop-ansible roboshop.yml -e ROLE_NAME=rabbitmq -e ENV=${env} | tee -a /opt/user-data.log
