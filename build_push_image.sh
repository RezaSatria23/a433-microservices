#!/bin/sh

# mendefinisikan variabel yang dipakai untuk nama image, versi image, dan nama akun GitHub
image_name="item-app"
image_version="v1"
github_account="rezasatria23"

# membuat image di Docker
echo -e "Membuat sebuah image docker baru"
docker build . -t $image_name:$image_version

# melihat daftar image di lokal
echo -e "\nMelihat List Docker images:"
docker images

# mengubah nama image agar sesuai dengan format GitHub Container Registry
echo -e "\nMemberikan Nama Tag baru pada image Docker agar sesuai dengan format  GitHub Container Registry:"
docker tag $image_name:$image_version ghcr.io/$github_account/$image_name:$image_version
docker images

# log masuk ke GitHub Container Registry
echo -e "\nLogin into GitHub Container Registry:"
docker login ghcr.io -u $github_account

# mengunggah image ke GitHub Container Registry
echo -e "\nPublishing image to GitHub Container Registry:"
docker push ghcr.io/$github_account/$image_name:$image_version

# selesai proses push ke GitHub Container Registry
echo -e "\nDone."

# create BY Reza Satria Tama