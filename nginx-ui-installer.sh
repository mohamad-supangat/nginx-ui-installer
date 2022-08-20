
REPO=0xJacky/nginx-ui
FILES=(
    'frontend-dist.tar.gz'
    'nginx-ui-linux-arm64-v8a.tar.gz'
)

mkdir frontend

for FILE in ${FILES[@]}; do
    # hapus file lama
    rm $FILE

    # download latest releases
    curl -s https://api.github.com/repos/$REPO/releases/latest \
    | grep $FILE \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -i -
done

tar -zxf frontend-dist.tar.gz -C frontend
tar -zxf 'nginx-ui-linux-arm64-v8a.tar.gz'
sudo cp nginx-ui /usr/bin/nginx-ui
sudo dinitctl restart nginx-ui

