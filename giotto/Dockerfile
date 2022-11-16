FROM dsouzd04/seurat:4.2.1

RUN apt-get update && apt-get install -y --no-install-recommends build-essential python3.6 python3-pip python3-setuptools python3-dev \
    && cp /etc/apt/sources.list /etc/apt/sources.list~ \
    && sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list \
    && apt-get update \
    && pip3 install pandas python-igraph networkx python-louvain leidenalg scikit-learn smfishHmrf

RUN apt-get update && \
  apt-get install --fix-missing -y \
  libmagick++-dev libgmp3-dev
    
RUN Rscript -e "install.packages('remotes')" \
    && installGithub.r RubD/Giotto \
    && rm -rf /tmp/downloaded_packages/
    
RUN R -e 'BiocManager::install(c("TENxVisiumData", "TabulaMurisSenisData"))' \
    && rm -rf /tmp/downloaded_packages/

