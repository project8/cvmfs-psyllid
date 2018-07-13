#!/bin/bash

# It's assumed that you've already sourced the relevant setup.sh

cd ${P8PSYLLIDDIR}/src
echo "where are we?"
pwd

#######################################################################
#
# build all dependencies from source
#
########################################################################


echo "Environment variables:"
env
echo `gcc --version`
echo `which cc`
echo `which g++`
echo `which ld`
echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
echo "LIBRARY_PATH: $LIBRARY_PATH"
echo "LIBDIR: $LIBDIR"
echo "PYTHONPATH: $PYTHONPATH"
echo "Library search path:"
echo `ldconfig -v 2>/dev/null | grep -v ^$'\t'`


# psyllid
echo "buildrabbitmq-c"
mkdir ${P8PSYLLIDDIR}/build
cd ${P8PSYLLIDDIR}/build
cmake -D CMAKE_INSTALL_PREFIX:PATH=${P8PSYLLIDDIR} ../src/Psyllid | tee config_log.txt
make -j3 install | tee make_install_log.txt
echo "'make install' of psyllid done"

echo "Adding new 'current' soft link"
ln -sf ${P8PSYLLIDDIR} ${P8BASEDIR}/psyllid/current
