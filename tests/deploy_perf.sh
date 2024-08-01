wget https://ftp.sjtu.edu.cn/sites/ftp.kernel.org/pub/linux/kernel/v6.x/linux-6.9.9.tar.gz
tar -zxvf linux-6.9.9.tar.gz
cd linux-6.9.9
make defconfig
make -j$(nproc)
make modules_install
make install
