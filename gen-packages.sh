#！/usr/bin/env bash

LFS=/mnt/lfs
package_dir=./package

function gen-package() {
    echo "genernate package $2..."
    url=$1
    tarball=$2
    package=${tarball%.*}
    package=${package%.*}
    package_up=${package^^}
    package_uppercase=${package_up//./_}
    package_uppercase=${package_uppercase//-/_}


    mkdir -pv $package_dir/$package
    rm $package_dir/$package/$package.mk
    cp pkg-example.mk  $package_dir/$package/$package.mk
    sed -i "s#PACKAGE-UP-MAGIC#${package_uppercase}#g" $package_dir/$package/$package.mk
    sed -i "s#PACKAGE-MAGIC#${tarball}#g" $package_dir/$package/$package.mk
    sed -i "s#URL-MAGIC#${url}#g" $package_dir/$package/$package.mk
}

##############################################
# download package in wget-list
##############################################
function download-package() {
    [ -d $LFS/sources ] || (mkdir -pv $LFS/sources && chmod -v a+wt $LFS/sources)
    cp md5sums $LFS/sources/md5sums; cd $LFS/sources; md5sum -c md5sums
    #wget --input-file=wget-list --continue --directory-prefix=$LFS/sources
}

##############################################
# generate .mk of packages in wget-list
##############################################

function gen-packages() {
    urls=$(cat wget-list)
    for url in $urls
    do
        file=$(basename $url)
        if [[ "$file" == *tar.gz  || "$file" == *tar.bz2  || "$file" == *tar.xz ]] ;then
            gen-package $url $file
        fi
    done
}

#download-package
gen-packages