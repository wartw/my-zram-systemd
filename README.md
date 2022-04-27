 ZRAM
```
git clone https://github.com/wartw/webcheck-and-zram.git
cd webcheck-and-zram
cp zram zram.service /etc/systemd/system/
chmod +x /etc/systemd/system/zram
systemctl enable zram.service
systemctl daemon-reload
systemctl start zram.service
```
CHECK
```
git clone https://github.com/wartw/webcheck-and-zram.git
cd webcheck-and-zram
mkdir /home/check
cp httpd_check.sh /home/check
cp mysql_check.sh /home/check
cp ngnix_check.sh /home/check
cd /home/check
chmod +x *_check.sh
./httpd_check.sh
./mysql_check.sh
./ngnix_check.sh
```
