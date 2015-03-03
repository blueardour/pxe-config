# ! /bin/bash

cd ..

index=15

echo "" > new_added_linux_boot_pxeconfig

for i in lucid oneiric precise quantal raring saucy
do
  if [ -d $index-${i}-i386 ];then cd $index-${i}-i386; else mkdir $index-${i}-i386; cd $index-${i}-i386;  fi
  if [ ! -f linux ]
  then
    wget http://debian.ustc.edu.cn/ubuntu/dists/${i}/main/installer-i386/current/images/netboot/ubuntu-installer/i386/linux;
    if [ $? -ne 0 ]; then echo "Download Error"; exit -1; fi
    ln -s linux vmlinuz
  fi
  if [ ! -f initrd.gz ]
  then
    wget http://debian.ustc.edu.cn/ubuntu/dists/${i}/main/installer-i386/current/images/netboot/ubuntu-installer/i386/initrd.gz;
    if [ $? -ne 0 ]; then echo "Download Error"; exit -1; fi
    ln -s initrd.gz initrd.lz
  fi
  cd -

  echo "label   ubuntu-${i}-i386" >> new_added_linux_boot_pxeconfig
  echo "menu    label --- Install Ubuntu-${i}-desktop-i386" >> new_added_linux_boot_pxeconfig
  echo "kernel  $index-${i}-i386/vmlinuz" >> new_added_linux_boot_pxeconfig
  echo "append  initrd=$index-${i}-i386/initrd.lz ramdisk_size=9216 noapic acpi=off" >> new_added_linux_boot_pxeconfig
  echo "" >> new_added_linux_boot_pxeconfig

  index=$(($index + 1))

  if [ -d $index-${i}-amd64 ];then cd $index-${i}-amd64; else mkdir $index-${i}-amd64; cd $index-${i}-amd64;  fi
  if [ ! -f linux ]
  then
    wget http://debian.ustc.edu.cn/ubuntu/dists/${i}/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/linux
    if [ $? -ne 0 ]; then echo "Download Error"; exit -1; fi
    ln -s linux vmlinuz
  fi

  if [ ! -f initrd.gz ]
  then
    wget http://debian.ustc.edu.cn/ubuntu/dists/${i}/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/initrd.gz;
    if [ $? -ne 0 ]; then echo "Download Error"; exit -1; fi
    ln -s initrd.gz initrd.lz
  fi
  cd -

  echo "label   ubuntu-${i}-amd64" >> new_added_linux_boot_pxeconfig
  echo "menu    label --- Install Ubuntu-${i}-desktop-amd64" >> new_added_linux_boot_pxeconfig
  echo "kernel  $index-${i}-amd64/vmlinuz" >> new_added_linux_boot_pxeconfig
  echo "append  initrd=$index-${i}-amd64/initrd.lz ramdisk_size=9216 noapic acpi=off" >> new_added_linux_boot_pxeconfig
  echo "" >> new_added_linux_boot_pxeconfig

  index=$(($index + 1))
done

