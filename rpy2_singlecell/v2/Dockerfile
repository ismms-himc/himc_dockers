FROM dsouzd04/himc_rpy2_singlecell:1.0

MAINTAINER Darwin D'Souza <ddsouz5@gmail.com>

RUN \
  python3 -m pip install \
  decoupler

USER root 

RUN cp /usr/local/lib/R/site-library/hdf5r/libs/hdf5r.so /usr/lib/R/lib/

RUN apt update
RUN apt-get install -y libhdf5-dev

WORKDIR /home/"${NB_USER}"

USER $NB_USER
