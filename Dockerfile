FROM registry.access.redhat.com/ubi8/python-39

USER root
# Source build of libhdf5
RUN dnf install -y wget \
    && wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.12/hdf5-1.12.1/src/hdf5-1.12.1.tar.gz \
    && tar xvfz hdf5-1.12.1.tar.gz \
    && cd hdf5-1.12.1/ \
    && ./configure --prefix /usr/local/hdf5 --enable-ros3-vfd \
    && make \
    && make install \
    && rm -fr hdf5-1.12.1.tar.gz hdf5-1.12.1

# Source build of h5py
RUN HDF5_DIR=/usr/local/hdf5 pip install --no-binary=h5py h5py