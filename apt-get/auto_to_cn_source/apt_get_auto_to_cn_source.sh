#!/bin/bash
echo "Backup '/etc/apt/sources.list' to '/etc/apt/sources.list_backup'"
cp /etc/apt/sources.list /etc/apt/sources.list_backup
rm /etc/apt/sources.list
echo "\n\n\n"
echo "Choose your Ubuntu version"
echo "1:17.04"
echo "2:16.10"
echo "3:16.04"
echo "4:14.04"
read ver
echo $ver
if [ $ver ]; then
    if [ $ver -eq 1 ];then
        echo "You choose 17.04"
        downUrl="https://github.com/zhihaofans/some-ubuntu/raw/master/apt-get/auto_to_cn_source/17.04/sources.list"
    elif [ $ver -eq 2 ];then
        echo "You choose 16.10"
        downUrl="https://github.com/zhihaofans/some-ubuntu/raw/master/apt-get/auto_to_cn_source/16.10/sources.list"
    elif [ $ver -eq 3 ];then
        echo "You choose 16.04"
        downUrl="https://github.com/zhihaofans/some-ubuntu/raw/master/apt-get/auto_to_cn_source/16.04/sources.list"
    elif [ $ver -eq 4 ];then
        echo "You choose 14.04"
        downUrl="https://github.com/zhihaofans/some-ubuntu/raw/master/apt-get/auto_to_cn_source/14.04/sources.list"
    else
        echo "Error OS version,end"
        exit 1
    fi
else
    echo "Error OS version,end."
    exit 1
fi
wget -P /etc/apt/ $downUrl
apt-get update
echo "Finish"
exit 0