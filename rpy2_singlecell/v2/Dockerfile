FROM dsouzd04/himc_rpy2_singlecell:1.0

MAINTAINER Darwin D'Souza <ddsouz5@gmail.com>

USER root 

RUN cp /usr/local/lib/R/site-library/hdf5r/libs/hdf5r.so /usr/lib/R/lib/

RUN apt update
RUN apt-get install -y libhdf5-dev

WORKDIR /home/"${NB_USER}"

USER $NB_USER

#RUN python3 -m pip install --no-cache-dir --force-reinstall -vvv \
RUN python3 -m pip install --no-cache-dir --force-reinstall 'numpy<1.21,>=1.17'

USER root
RUN python3 -m pip uninstall --no-cache-dir -y anndata
RUN python3 -m pip --no-cache-dir install anndata==0.8.0 decoupler

USER $NB_USER
#RUN python3 -m pip install --no-cache-dir --upgrade --upgrade-strategy only-if-needed anndata
