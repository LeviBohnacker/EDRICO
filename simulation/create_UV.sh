echo "building $1 ..."
mkdir $1 
cp UV_tb_template.vhd $1/$1_tb.vhd
cp UV_pkg_template.vhd $1/$1_pkg.vhd

echo "finished!"
