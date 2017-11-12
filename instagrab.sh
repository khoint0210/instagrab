#   _____ _   _  _____ _______       _____ _____            ____
#  |_   _| \ | |/ ____|__   __|/\   / ____|  __ \     /\   |  _ \
#    | | |  \| | (___    | |  /  \ | |  __| |__) |   /  \  | |_) |
#    | | | . ` |\___ \   | | / /\ \| | |_ |  _  /   / /\ \ |  _ <
#   _| |_| |\  |____) |  | |/ ____ \ |__| | | \ \  / ____ \| |_) |
#  |_____|_| \_|_____/   |_/_/    \_\_____|_|  \_\/_/    \_\____/
#
#
RED='\033[91m'
END='\e[0m'

function get_image {
echo "URL instagram to download"
read url
clear
checkPrivate=$(curl -s $url | grep "The link you followed may be broken, or the page may have been removed" | sed 's/        The/The/')
if [[ "$checkPrivate" != *"The link you followed may be broken, or the page may have been removed"* ]]
 then
  echo "Downloading the picture please wait"
  get_url=$(curl -s "$url" | grep -i "og:image" | sed 's/   h//; s/<meta property="og:image" content="//; s, />,,g; s/"//; s/ //; s/ //; s/ //; s/ //; s/ //; s/ //; s/ //')
  linkdown=$(echo "$get_url")
  wget "$linkdown"
  printf "Download finish. Saved at $RED$(pwd)$END\n"
  echo "---------------------------------------------------------------------------"
else
echo "Unable to download picture, User are setting privte mode 😢 srr\n"
echo "---------------------------------------------------------------------------"
fi
}


function get_ava {
printf "Instagram user name:\n"
read user_name
get_link=$(curl "https://www.instagram.com/$user_name/" | grep -i "og:image" | sed 's/  h//; s/<meta property="og:image" content="//; s, />,,g; s/"//; s/            h/h/; s/s150x150//')
wget "$get_link"
printf "Download finish. Saved at $RED$(pwd)$END\n"
echo "---------------------------------------------------------------------------"
}

function menu {
  echo ""
  echo "Chosse function:"
  echo "<1> 👤 Get avatar user 👤"
  echo "<2> 🎆 Get image 🎆"
  echo "<3> ⛔️ Exit ⛔️️"
  read function
case $function in
  "1")
    get_ava ;;
  "2")
    get_image ;;
  "3")
    clear
    exit ;;
esac
}

while true
do menu
done
