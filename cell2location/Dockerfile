# base image maintained by the NVIDIA CUDA Installer Team - https://hub.docker.com/r/nvidia/cuda/
FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04

# install os packages
RUN apt-get update --allow-insecure-repositories \
    && apt-get install --no-install-recommends --yes \
        curl \
        unzip \
        g++ \
        vim \
        wget \
        ca-certificates \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# see http://bugs.python.org/issue19846
ENV LANG C.UTF-8

# install miniconda3 - https://docs.conda.io/projects/continuumio-conda/en/latest/user-guide/install/index.html
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh \
    && /bin/bash /tmp/miniconda.sh -b -p /opt/conda \
    && rm /tmp/miniconda.sh
RUN /opt/conda/condabin/conda init bash

# create conda environment yaml file
COPY environment.yml /tmp/
RUN /opt/conda/condabin/conda env create -f /tmp/environment.yml \
    && echo "source activate cell2loc_env" >> ~/.bashrc \
    && /opt/conda/condabin/conda clean --all --yes --quiet
ENV PATH /opt/conda/envs/cell2loc_env/bin:/opt/conda/bin:$PATH

# install cell2location 
#COPY . cell2location
RUN /bin/bash -c "pip install cell2location[tutorials]"

# add cell2loc_env kernel for jupyter environment 
RUN /bin/bash -c "python -m ipykernel install --prefix=/opt/conda/envs/cell2loc_env/ --name=cell2loc_env --display-name='Container (cell2loc_env)'" 

# copy notebooks to the image
#COPY docs/notebooks notebooks
#RUN /bin/bash -c "jupyter trust /notebooks/*.ipynb";

# Update path of GLIBCXX_3.4.30
# find / -name "libstdc++.so*"
# strings /usr/lib/x86_64-linux-gnu/libstdc++.so.6 | grep GLIBCXX
#RUN ln -fs /opt/conda/pkgs/libstdcxx-ng-12.2.0-h46fd767_19/lib/libstdc++.so.6.0.30 /usr/lib/x86_64-linux-gnu/libstdc++.so.6 
RUN ln -fs /opt/conda/envs/cell2loc_env/lib/libstdc++.so.6.0.30 /usr/lib/x86_64-linux-gnu/libstdc++.so.6 

# launch jupyter
CMD ["jupyter", "notebook", \
    "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

EXPOSE 8888
