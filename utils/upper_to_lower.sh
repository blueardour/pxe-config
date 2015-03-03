# ! /bin/bash

path=$1

echo "Work path:=$path"


for file in `find $path -type d | grep -P '[A-Z]'`
do
  str=`echo $file|tr 'A-Z' 'a-z'`
  mv -i -v $file $str
done

for file in `find $path -type f | grep -P '[A-Z]'`
do
  str=`echo $file|tr 'A-Z' 'a-z'`
  mv -i -v $file $str
done

exit 0

#find $path -type d -regex "*" -exec echo {} \; #&& mv -v {} `echo {}|tr 'A-Z' 'a-z'` \;
#find $path -type d  -exec echo a=`echo {}|tr 'A-Z' 'a-z'` \;
#find $path -type d -ex| grep -P '[A-Z]' #  -exec echo a=`echo {}|tr 'A-Z' 'a-z'` \;
