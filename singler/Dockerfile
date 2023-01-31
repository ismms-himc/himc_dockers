FROM dsouzd04/seurat:4.2.1

#RUN apt-get update 
#RUN apt-get install -y \
#  libfontconfig1-dev \
#  cmake

#RUN R -e 'if(!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")'
RUN R -e 'BiocManager::install("SingleR")'
RUN R -e 'BiocManager::install("scuttle")'
RUN R -e 'BiocManager::install("scater")'
RUN R -e 'BiocManager::install("DropletUtils")'
RUN R -e 'BiocManager::install("celldex")'
RUN R -e 'BiocManager::install("scran")'

RUN rm -rf /tmp/downloaded_packages/
