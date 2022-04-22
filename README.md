
```
git clone https://github.com/wartw/my-zram-systemd.git
cd my-zram-systemd
cp zram zram.service /etc/systemd/system/
chmod +x /etc/systemd/system/zram
systemctl enable zram.service
systemctl daemon-reload
systemctl start zram.service
```
