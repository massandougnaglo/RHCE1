#!/bin/bash

ansible all -m yum_repository -a 'name=exam_rhel description="ex294 software" baseurl=https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm file=exam_rhel gpgcheck=yes enabled=yes gpgkey=https://dl.fedoraproject.org/pub/epel/RPM-GPG state=absent' -b
