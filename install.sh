mkdir github
sudo apt install curl
versionWithHTML=$(curl -s https://github.com/gophish/gophish/releases/ | grep -m 1 linux-64bit.zip)
versionWithHTML=${versionWithHTML//$'<td>'/}
version=${versionWithHTML//$'</td>'/}

#getGophishFile
IFS="-"
read -a versionArray <<< "$version"
IFS=" "
gophishfile=${versionArray[0]}-${versionArray[1]}-${versionArray[2]}
if [ ! -d "$gophishfile" ]; then
  mkdir $gophishfile
  cd $gophishfile
  wget https://github.com/gophish/gophish/releases/download/${versionArray[1]}/$version
  unzip $version

  #changePermissionsGophish
  chmod +x gophish

  #cleanUpFiles
  rm -r $version
else
  echo file exits "$gophishfile"
fi
