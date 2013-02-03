sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
sudo ln -s /etc/fonts/conf.avail/70-force-bitmaps.conf /etc/fonts/conf.d/70-force-bitmaps.conf
sudo fc-cache -f -v
