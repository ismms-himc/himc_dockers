FROM dsouzd04/himc_rpy2_singlecell:2.0

USER root
WORKDIR /root

RUN \
  python3 -m pip install \
  FlowCal \
  fcswrite \
  pygsheets \
  clustergrammer2 \
  boto3 \
  kneed \
  fcsy[s3] \
  fsspec \
  s3fs

RUN \
  jupyter labextension install @jupyter-widgets/jupyterlab-manager

RUN apt-get update && \
  apt-get install -y \
  python3-tk

RUN \
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  sudo ./aws/install && \
  rm -f awscliv2.zip

WORKDIR /home/"${NB_USER}"
USER $NB_USER


