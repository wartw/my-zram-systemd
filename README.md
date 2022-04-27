
```
git clone https://github.com/wartw/webcheck-and-zram.git
cd webcheck-and-zram
cp zram zram.service /etc/systemd/system/
chmod +x /etc/systemd/system/zram
systemctl enable zram.service
systemctl daemon-reload
systemctl start zram.service
```
