# ! /bin/bash


basedir=..
version=xp86e
path=13.winxp-x86-en

version=$1
path=$2

cd $basedir/$path
if [ -d i386 -o -L i386 ]
then
  echo "In $basedir/$path exist i386"
else
  echo "Not find i386 in $basedir/$path"
  exit -1;
fi

rm -rf startrom.n12
cabextract i386/startrom.n1_
if [ -f startrom.n12 ]
then
  sed  -i -e "s/NTLDR/$version/gi" startrom.n12
else
  echo "Not find cabextract failed"
  exit -2
fi

rm -rf $version.0
mv startrom.n12 $version.0

rm -rf setupldr.exe
cabextract i386/setupldr.ex_
sed -i -e "s/winnt\.sif/$version\.sif/gi" setupldr.exe
sed -i -e "s/ntdetect\.com/ntd$version\.wxp/gi" setupldr.exe

echo "Version:=$version" | grep '64'
if [ $? -eq 0 ]
then
  echo "Fatal Notice: X64 Mode detected. replace all i386 to i686 in the setupldr"
  sed -i -e "s/i386/i686/gi" setupldr.exe
fi

rm -rf $version
mv setupldr.exe $version

rm -rf ntd$version.wxp
cp i386/ntdetect.com ntd$version.wxp

echo "re ^$version.0$      $path/$version.0"  
echo "re ^$version$        $path/$version"  
echo "re ^ntd$version.wxp$ $path/ntd$version.wxp"  
echo "re ^$version.sif$    $path/$version.sif"  

