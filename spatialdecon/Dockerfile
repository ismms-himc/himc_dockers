FROM dsouzd04/seurat:4.2.1

RUN apt-get update 
RUN apt-get install -y \
  libfontconfig1-dev \
  cmake

RUN R -e 'if(!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")'
RUN R -e 'BiocManager::install("SpatialDecon")'
RUN R -e 'BiocManager::install("GeomxTools")'
RUN rm -rf /tmp/downloaded_packages/
