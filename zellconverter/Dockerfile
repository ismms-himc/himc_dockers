FROM dsouzd04/seurat:4.2.1

RUN apt-get update 
RUN apt-get install -y \
  libbz2-dev

#RUN R -e 'if(!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")'
RUN R -e 'BiocManager::install("zellkonverter")'

# install conda packages
RUN R -e 'library(zellkonverter); example_h5ad <- system.file("extdata", "krumsiek11.h5ad", package = "zellkonverter"); readH5AD(example_h5ad)'

RUN apt-get update 
RUN apt-get install -y \
  liblzma-dev

RUN R -e 'BiocManager::install("scRNAseq")'

RUN rm -rf /tmp/downloaded_packages/
