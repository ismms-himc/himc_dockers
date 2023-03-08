FROM dsouzd04/seurat:4.2.1

RUN apt-get update
RUN apt-get install -y \
  libmagick++-dev

RUN R -e 'BiocManager::install("SPOTlight")'
RUN R -e 'BiocManager::install(c("TENxVisiumData", "TabulaMurisSenisData"))'
RUN R -e 'BiocManager::install(c("SpatialExperiment", "scater", "scran"))'
RUN R -e 'install.packages("ggcorrplot")'
