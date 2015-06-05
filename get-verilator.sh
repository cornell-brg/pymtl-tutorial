#!/usr/bin/env bash

echo "getting tarball"
wget http://csl.cornell.edu/~berkin/misc/verilator-bin.tar.gz
echo "untar"
cd $STOW_PKGS_PREFIX/pkgs
tar xzf ~/pymtl-tutorial/verilator-bin.tar.gz
echo "stow"
stow verilator
export PYMTL_VERILATOR_INCLUDE_DIR=$STOW_PKGS_PREFIX/pkgs/verilator/share/verilator/include
echo "done!"

