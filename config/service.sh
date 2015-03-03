# ! /bin/bash

binlsrv_log=/var/log/binlsrv.log
bilsrv_pid=/var/run/binlsrv.pid
binlsrv_cache=/tftp_root/0.winxp-drivers-via-binlsrv/devlist.cache

if [ $# -eq 0 ]; then return 1; fi

if [ "$1" == "start" ]
then
  if [ -f $binlsrv_log ]
  then
    echo "" >> $binlsrv_log
    echo "In rc.local start binlsrv..." >> $binlsrv_log
  fi
  ./tftp_root/0.winxp-drivers-via-binlsrv.py --daemon --logfile="$binlsrv_log" $binlsrv_cache
elif [ "$1" == "stop" ]
then
  kill "$(cat "$binlsrv_pid")"
fi
