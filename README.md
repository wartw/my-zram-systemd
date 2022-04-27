ZRAM(全通用版)
```
git clone https://github.com/wartw/webcheck-and-zram.git
cd webcheck-and-zram
cp zram zram.service /etc/systemd/system/
cp freemem.sh /
chmod +x /etc/systemd/system/zram
systemctl enable zram.service
systemctl daemon-reload
systemctl start zram.service
```
----
ZRAM的crontab設定
```
*/1 * * * * sh /freemem.sh
```
----
CHECK安裝(LNMPA)
```
git clone https://github.com/wartw/webcheck-and-zram.git
cd webcheck-and-zram
mkdir /home/check
cp httpd_check.sh /home/check
cp mysql_check.sh /home/check
cp ngnix_check.sh /home/check
cp clean.sh /home/check
cd /home/check
chmod +x *.sh
./httpd_check.sh
./mysql_check.sh
./ngnix_check.sh
```
----
CHECK的crontab設定
```
*/1 * * * * sh /home/httpd_check.sh
*/1 * * * * sh /home/mysql_check.sh
*/1 * * * * sh /home/ngnix_check.sh
*/5 * * * * sh /home/clean.sh
```
