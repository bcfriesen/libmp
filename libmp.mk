# **********************************************************************
# Install path configuration
# **********************************************************************
# PREFIX = /path/where/install/libmp
# it can be also set as environment variable
# **********************************************************************

PREFIX ?= $(HOME)/libmp

# **********************************************************************
# LibGDSync configuration
# **********************************************************************
# GDSYNC_BUILD = 1 to build the libgdsync submodule
# GDSYNC_BUILD = 0 otherwise
# ----------------------------------------------------------------------
# GDSYNC_ENABLE = /path/to/libgdsync to enable LibGDSync inside LibMP
# GDSYNC_ENABLE = "no" otherwise
# **********************************************************************
GDSYNC_BUILD = 1
GDSYNC_ENABLE = $(PREFIX)

# **********************************************************************
# GPUDirect RDMA Copy library configuration
# **********************************************************************
# GDRCOPY_BUILD = 1 to build the gdrcopy submodule
# GDRCOPY_BUILD = 0 otherwise
# **********************************************************************
GDRCOPY_BUILD = 1

# **********************************************************************
# CUDA configuration
# **********************************************************************
# CUDA_ENABLE = /path/to/cuda to enable CUDA inside LibMP
# CUDA_ENABLE = "no" otherwise
# **********************************************************************
CUDA_ENABLE = /usr/local/cuda-8.0

# **********************************************************************
# MPI configuration
# **********************************************************************
# MPI_ENABLE = /path/to/mpi to use MPI as TL in LibMP
# N.B. Currently libmp support only MPI as TL!
# **********************************************************************
MPI_ENABLE = /opt/openmpi/v1.10.2/cuda7.5

#------------------------------------------------------------------------------
# build tunables
#------------------------------------------------------------------------------

CXX:=g++
CC:=gcc
NVCC:=nvcc
LD:=g++
COMMON_CFLAGS:=-O2
CPPFLAGS+=-DGDS_USE_EXP_INIT_ATTR -DGDS_OFED_HAS_PEER_DIRECT_ASYNC
NVCC_ARCHS:=-gencode arch=compute_35,code=sm_35
NVCC_ARCHS+=-gencode arch=compute_50,code=compute_50
NVCC_ARCHS+=-gencode arch=compute_60,code=compute_60
#-arch=compute_35 -code=sm_35 

# static or dynamic
LIBS_TYPE=static