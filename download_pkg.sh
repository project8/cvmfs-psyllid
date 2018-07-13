#!/bin/bash

# It's assumed that you've already sourced the relevant setup.sh

########################################################################
#
# collect source distributions for all dependencies
#
########################################################################

export RAPIDJSON_BRANCH=5de06bfa37495b529dc00139f1b138a526fff27a
export YAMLCPP_BRANCH=3757b2023b71d183a341677feee693c71c2e0766
export GOOGLETEST_BRANCH=ec44c6c1675c25b9827aacd08c02433cccde7780
export SIMPLEAMQPCLIENT_BRANCH=05529292b5380add1245da3c1f10a38e8b5ed358
export SCARAB_BRANCH=216a11c7831817550201709514ba9fae126f1586 # v1.6.2
export MIDGE_BRANCH=master
export MONARCH_BRANCH=master
export DRIPLINE_CPP_BRANCH=master
export PSYLLID_BRANCH=master

export RAPIDJSON_URL=https://github.com/Tencent/rapidjson/archive/${RAPIDJSON_BRANCH}.zip
export YAMLCPP_URL=https://github.com/jbeder/yaml-cpp/archive/${YAMLCPP_BRANCH}.zip
export GOOGLETEST_URL=https://github.com/google/googletest/archive/${GOOGLETEST_BRANCH}.zip
export SIMPLEAMQPCLIENT_URL=https://github.com/project8/SimpleAmqpClient/archive/${SIMPLEAMQPCLIENT_BRANCH}.zip
export SCARAB_URL=https://github.com/project8/scarab/archive/${SCARAB_BRANCH}.zip
export MIDGE_URL=https://github.com/project8/midge/archive/${MIDGE_BRANCH}.zip
export MONARCH_URL=https://github.com/project8/monarch/archive/${MONARCH_BRANCH}.zip
export DRIPLINE_CPP_URL=https://github.com/project8/dripline-cpp/archive/${DRIPLINE_CPP_BRANCH}.zip
export PSYLLID_URL=https://github.com/project8/psyllid/archive/${PSYLLID_BRANCH}.zip


# get into the parent directory for all the source code and build proucts
mkdir -p ${P8PSYLLIDDIR}/src
cd ${P8PSYLLIDDIR}/src
pwd

# because git does not exist, we have to download manually all items and put them in the right place.
# how annoying...
echo "Prepare Psyllid"
wget -O psyllid-${PSYLLID_BRANCH}.zip ${PSYLLID_URL} --output-file=wget_log.txt --tries=3
unzip -q psyllid-${PSYLLID_BRANCH}.zip
mv psyllid-${PSYLLID_BRANCH} ${P8PSYLLIDDIR}/src/Psyllid

echo "Prepare Scarab"
wget -O scarab-${SCARAB_BRANCH}.zip ${SCARAB_URL} --output-file=wget_log.txt --tries=3
unzip -q scarab-${SCARAB_BRANCH}.zip
mv scarab-${SCARAB_BRANCH} ${P8PSYLLIDDIR}/src/scarab
echo "... Rapidjson for Scarab"
wget -O rapidjson-${RAPIDJSON_BRANCH}.zip ${RAPIDJSON_URL} --output-file=wget_log.txt --tries=3
unzip -q rapidjson-${RAPIDJSON_BRANCH}.zip
mv rapidjson-${RAPIDJSON_BRANCH} ${P8PSYLLIDDIR}/src/rapidjson
mkdir -p ${P8PSYLLIDDIR}/src/scarab/library/param/codec/json
mv rapidjson ${P8PSYLLIDDIR}/src/scarab/library/param/codec/json
echo "... yaml-cpp for Scarab"
wget -O yaml-cpp-${YAMLCPP_BRANCH}.zip ${YAMLCPP_URL} --output-file=wget_log.txt --tries=3
unzip -q yaml-cpp-${YAMLCPP_BRANCH}.zip
mv yaml-cpp-${YAMLCPP_BRANCH} ${P8PSYLLIDDIR}/src/yaml-cpp
mkdir -p ${P8PSYLLIDDIR}/src/scarab/library/param/codec/yaml
mv yaml-cpp ${P8PSYLLIDDIR}/src/scarab/library/param/codec/yaml
echo "Scarab ready for linking"

echo "Prepare Midge"
wget -O midge-${MIDGE_BRANCH}.zip ${MIDGE_URL} --output-file=wget_log.txt --tries=3
unzip -q midge-${MIDGE_BRANCH}.zip
mv midge-${MIDGE_BRANCH} ${P8PSYLLIDDIR}/src/Psyllid/midge
ln -s ${P8PSYLLIDDIR}/src/scarab ${P8PSYLLIDDIR}/src/Psyllid/midge/scarab
echo "Midge is done!"

echo "Prepare Monarch"
wget -O monarch-${MONARCH_BRANCH}.zip ${MONARCH_URL} --output-file=wget_log.txt --tries=3
unzip -q monarch-${MONARCH_BRANCH}.zip
mv monarch-${MONARCH_BRANCH} ${P8PSYLLIDDIR}/src/Psyllid/monarch
ln -s ${P8PSYLLIDDIR}/src/scarab ${P8PSYLLIDDIR}/src/Psyllid/monarch/Scarab
echo "Monarch is done!"

echo "Prepare Dripline-cpp"
wget -O dripline-cpp-${DRIPLINE_CPP_BRANCH}.zip ${DRIPLINE_CPP_URL} --output-file=wget_log.txt --tries=3
unzip -q dripline-cpp-${DRIPLINE_CPP_BRANCH}.zip
mv dripline-cpp-${DRIPLINE_CPP_BRANCH} ${P8PSYLLIDDIR}/src/Psyllid/dripline-cpp
ln -s ${P8PSYLLIDDIR}/src/scarab ${P8PSYLLIDDIR}/src/Psyllid/dripline-cpp/scarab
echo "... SimpleAmqpClient for Dripline-cpp"
wget -O simpleamqpclient-${SIMPLEAMQPCLIENT_BRANCH}.zip ${SIMPLEAMQPCLIENT_URL} --output-file=wget_log.txt --tries=3
unzip -q simpleamqpclient-${SIMPLEAMQPCLIENT_BRANCH}.zip
mkdir -p ${P8PSYLLIDDIR}/src/Psyllid/dripline-cpp/SimpleAmqpClient
mv SimpleAmqpClient-${SIMPLEAMQPCLIENT_BRANCH} ${P8PSYLLIDDIR}/src/Psyllid/dripline-cpp/SimpleAmqpClient
echo "... ... googletest for SimpleAmqpClient for Dripline-cpp"
wget -O googletest-${GOOGLETEST_BRANCH}.zip ${GOOGLETEST_URL} --output-file=wget_log.txt --tries=3
unzip -q googletest-${GOOGLETEST_BRANCH}.zip
mkdir -p ${P8PSYLLIDDIR}/src/Psyllid/dripline-cpp/SimpleAmqpClient/third-party/googletest
mv googletest-${GOOGLETEST_BRANCH} ${P8PSYLLIDDIR}/src/Psyllid/dripline-cpp/SimpleAmqpClient/third-party/googletest
echo "Dripline-cpp is done!"

echo "All source downloads are done"
