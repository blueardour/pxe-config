# ! /bin/bash

path=/tftp_root/0.winxp-drivers-via-binlsrv/drivers
find $path -type f | awk -F/ '{print "re (.*)/i386/"$NF"$  0.winxp-drivers-via-binlsrv/drivers/"$NF}'

echo -e "\r\n\r\n"

path=/tftp_root/0.winxp-drivers-via-binlsrv/drivers64
find $path -type f | awk -F/ '{print "re (.*)/i686/"$NF"$  0.winxp-drivers-via-binlsrv/drivers64/"$NF}'


