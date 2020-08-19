#!/usr/bin/env bash
set -e

mkdir -p /xray

echo "Fetching Latest Xray Version"
curl -s https://github.com/chaitin/xray/releases > /xray-latest-page.html

XRAY_SHA256=`cat /xray-latest-page.html | grep -Eo /chaitin/xray/releases/download/1\.[0-9]+\.[0-9]+/sha256\.txt -m 1`
XRAY_LINUX_AMD64=`cat /xray-latest-page.html | grep -Eo /chaitin/xray/releases/download/1\.[0-9]+\.[0-9]+/xray_linux_amd64\.zip -m 1`
echo "TARGET_BIN: ${XRAY_LINUX_AMD64}"

# echo "http://github.com$XRAY_SHA256"
URL=`echo "https://github.com$XRAY_LINUX_AMD64"`

echo "The Latest Xray Version is $URL"

echo "Start to download"
# wget --content-disposition --no-check-certificate $URL

curl -LJO $URL

echo "Start to Unzip xray_linux_amd64.zip"
unzip xray_linux_amd64.zip

mv xray_linux_amd64 ./xray


echo "Fetching Latest Rad Version"
curl -s https://github.com/chaitin/rad/releases > /rad-latest-page.html

# RAD_SHA256=`cat /rad-latest-page.html | grep -Eo /chaitin/rad/releases/download/[0-9]+\.[0-9]+/sha256\.txt -m 1`
RAD_LINUX_AMD64=`cat /rad-latest-page.html | grep -Eo /chaitin/rad/releases/download/[0-9]+\.[0-9]+/rad_linux_amd64\.zip -m 1`
echo "TARGET_BIN: ${RAD_LINUX_AMD64}"

# echo "http://github.com$XRAY_SHA256"
RADURL=`echo "https://github.com$RAD_LINUX_AMD64"`

echo "The Latest Rad Version is $RADURL"

echo "Start to download"
# wget --content-disposition --no-check-certificate $URL

curl -LJO $RADURL

echo "Start to Unzip rad_linux_amd64.zip"
unzip rad_linux_amd64.zip

mv rad_linux_amd64 ./xray