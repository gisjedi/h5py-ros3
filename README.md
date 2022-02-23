# h5py-ros3
Building h5py with support for ros3

## Build

```
# Source build of libhdf5
wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.12/hdf5-1.12.1/src/hdf5-1.12.1.tar.gz
tar xvfz hdf5-1.12.1.tar.gz 
cd hdf5-1.12.1/
./configure --prefix /usr/local/hdf5 --enable-ros3-vfd
make
sudo make install

# Source build of h5py
HDF5_DIR=/usr/local/hdf5 pip install --no-binary=h5py h5py
```

## Docker Image

```
docker build -t gisjedi/h5py-ros3
docker push gisjedi/h5py-ros3
```