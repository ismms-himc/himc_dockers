FROM dsouzd04/seurat:4.2.1

RUN apt-get update 
RUN apt-get install -y \
  libbz2-dev \
  liblzma-dev

#RUN R -e 'if(!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")'
# install package to local directory so singularity can see it

#RUN useradd -u 8877 docker
RUN adduser --system --group --shell /bin/sh docker
RUN mkdir /home/docker/R-packages
RUN chown -R docker:docker /home/docker/R-packages
USER docker

RUN export R_LIBS=~/R-packages
RUN touch ~/.Renviron && \
  echo "R_LIBS_USER=~/R-packages" >> ~/.Renviron
#
RUN R -e 'BiocManager::install("scRNAseq", lib="~/R-packages")'
RUN R -e 'BiocManager::install("zellkonverter", lib="~/R-packages")'
#RUN R -e 'BiocManager::install("scRNAseq")'
#RUN R -e 'BiocManager::install("zellkonverter")'

# install conda packages
RUN R -e 'library(zellkonverter); example_h5ad <- system.file("extdata", "krumsiek11.h5ad", package = "zellkonverter"); readH5AD(example_h5ad)'

USER root

RUN rm -rf /tmp/downloaded_packages/

RUN chown -R docker:docker /home/docker/.cache
USER docker
ENTRYPOINT ["R"]

#RUN echo "export R_LIBS_USER='/home/docker/R-packages'"

#RUN mkdir -vp /home/.cache/
#RUN cp -R /root/.cache /home/
#RUN rm -rf /root/.cache

#RUN useradd -u 8877 docker
#RUN chown -R docker:docker /home/.cache
