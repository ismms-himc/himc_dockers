FROM dsouzd04/himc_singler:1.10.0

RUN apt-get update 
RUN apt-get install -y \
  libbz2-dev \
  liblzma-dev

#RUN R -e 'if(!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")'
# install package to local directory so singularity can see it

RUN R -e 'BiocManager::install("zellkonverter")'

# install conda packages
#RUN R -e 'library(zellkonverter); example_h5ad <- system.file("extdata", "krumsiek11.h5ad", package = "zellkonverter"); readH5AD(example_h5ad)'

RUN rm -rf /tmp/downloaded_packages/
