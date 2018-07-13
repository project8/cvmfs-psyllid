# setting dependencies and dep-psyllid build name
export P8DEPPSYLLIDBUILD=build-2018-07-99
export PSYLLIDBUILD=v1.7.1

# source the common dependencies 
source /cvmfs/hep.pnnl.gov/project8/dependencies-psyllid/${P8DEPPSYLLIDBUILD}/setup.sh

export P8PSYLLIDDIR=${P8BASEDIR}/psyllid/${PSYLLIDBUILD}

export PATH=${P8PSYLLIDDIR}/bin:${PATH}
export INCLUDE_PATH=${P8PSYLLIDDIR}/include:${INCLUDE_PATH}
export LIBRARY_PATH=${P8PSYLLIDDIR}/lib:${LIBRARY_PATH}
export LIBRARY_PATH=${P8PSYLLIDDIR}/lib64:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${P8PSYLLIDDIR}/lib:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${P8PSYLLIDDIR}/lib64:${LIBRARY_PATH}

export LIBDIR=${LD_LIBRARY_PATH}:${LIBDIR}
