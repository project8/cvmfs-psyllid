# Project 8 CVMFS Psyllid

This repository can be used in two ways:

1. To install on the actual CVMFS system, use the `run-cvmfs-install.sh` script
1. To use the docker mockup CVMFS system, use the Dockerfile

When updating the dependencies build on GitHub, please make sure that both the build date in `setup.sh` is updated.  When a new official build is ready, tag it with the build name (the same as the build directory)

## Information

This repository provides the Psyllid installation on the CVMFS system used on the PNNL HEP cluster.

It's based on the cvmfs-dependencies-psyllid image (https://hub.docker.com/project8/cvmfs-dependencies-psyllid).

Project 8 software is installed in the `/cvmfs/hep.pnnl.gov/project8` directory.  From there, installed dependencies go in the `psyllid` subdirectory.  For any images based on this image, their software should go in their own directories to avoid issues with directory names that change as builds are updated.  For example:

```
/cvmfs/hep.pnnl.gov/project8
   |
   +- dependencies-common
   |
   +- dependencies-psyllid
   |
   +- psyllid
   |     |
   |     +- v0.0.0
   |           |
   |           +- bin, lib, include, . . .
   |
   +- katydid
   . . .
```

This repo can either be used to build a Docker image using the included Dockerfile, or installed directly in the actual CVMFS system by running the `run-cvmfs-install.sh` script.  Instructions for both builds are below.

Cleanup of the source directory is performed by the cleanup.sh script, which is run from the Dockerfile so that it is not automatically run when doing an install on the actual CVMFS system.  It can, of course, be run manually on that system if so desired.

## Scripts

* download_pkg.sh: Downloads dependency source packages and unpacks.
* install.sh: Builds dependencies from source.
* run-cvmfs-install.sh: Builds and installs everything given a proper environment (either the real CVMFS environment or the one provided by the Docker base image)
* setup.sh: Sets up the necessary environment variables both for installing software and using the software.

## Installing on the actual CVMFS system

1. Clone the `cmvfs-psyllid` repo
1. Make sure the dependency-psyllid build version in `setup.sh` (variable `P8DEPPSYLLIDBUILD`) is set correctly
1. Execute `run-cvmfs-install.sh`

## Using the Docker mockup of the CVMFS system

1. Clone the `cmvfs-dependencies-psyllid`` repo
1. Make sure the dependency-psyllid build version in `setup.sh` (variable `P8DEPPSYLLIDBUILD`) is set correctly
1. Execute `docker build -t project8/cvmfs-dependencies-psyllid .`

### Updating a dependency

Note: all dependencies are now updated in the cvmfs-dependencies-psyllid package (this repo is only for the build of psyllid itself).
