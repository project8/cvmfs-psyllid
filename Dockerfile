FROM project8/cvmfs-dependencies-psyllid:build-2018-07-99

RUN mkdir -p /tmp_install

COPY ./setup.sh /tmp_install/setup.sh
COPY ./dependency_urls.txt /tmp_install/dependency_urls.txt
COPY ./download_pkg.sh /tmp_install/download_pkg.sh
COPY ./install.sh /tmp_install/install.sh
COPY ./run-cvmfs-install.sh /tmp_install/run-cvmfs-install.sh
COPY ./cleanup.sh /tmp_install/cleanup.sh

RUN cd /tmp_install && \
    ls && \
    source /opt/rh/devtoolset-3/enable && \
#    . /tmp_install/run-cvmfs-install.sh && \
#    /tmp_install/cleanup.sh && \
#    rm -rf /tmp_install && \
    /bin/true
