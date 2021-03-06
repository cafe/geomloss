#!/bin/bash

#this script creates the wheel package for GeomLoss. Use at your own risk.

CURRENT_DIR=$(pwd)
echo $CURRENT_DIR

# ensure we are in the right dir
SCRIPT_DIR=`dirname $0`
echo $SCRIPT_DIR

cd $SCRIPT_DIR
cd ..

# clean pycache stuff
find -name *__pycache__* -exec rm {} \-rf \;
find -name *.pyc* -exec rm {} \-rf \;

# generate wheel
python3 setup.py sdist --dist-dir build/dist
python3 setup.py bdist_wheel --python-tag py3 --dist-dir build/wheel #--plat-name manylinux1_x86_64

# comes back to directory of 
cd $CURRENT_DIR
