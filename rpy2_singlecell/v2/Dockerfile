FROM dsouzd04/himc_rpy2_singlecell:1.0

MAINTAINER Darwin D'Souza <ddsouz5@gmail.com>

RUN \
  python3 -m pip install \
  decoupler

WORKDIR /home/"${NB_USER}"

USER $NB_USER
