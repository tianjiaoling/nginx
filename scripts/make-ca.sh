#!/bin/sh

TOPDIR=`pwd`

source scripts/profile

mkdir -p /etc/pki/CA/private
cd /etc/pki/CA/

openssl genrsa -out private/cakey.pem 2048
openssl req -new -x509 -key private/cakey.pem -out cacert.pem <<EOF
CN
Zhejiang
Hangzhou
Huawei
Huawei
Huawei
liupeifeng3@huawei.com
EOF

cd $NGINX_PATH/conf

openssl genrsa -out nginx.key 2048
openssl req -new -key nginx.key -out nginx.csr <<EOF
CN
Zhejiang
Hangzhou
Huawei
Huawei
Huawei
liupeifeng3@huawei.com


EOF

openssl x509 -req -in nginx.csr -CA /etc/pki/CA/cacert.pem -CAkey /etc/pki/CA/private/cakey.pem -CAcreateserial -out nginx.crt