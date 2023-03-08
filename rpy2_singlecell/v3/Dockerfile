# Start from a core stack version
FROM jupyter/datascience-notebook:latest

SHELL ["/bin/bash", "-o", "pipefail", "-c"]


# Install in the default python3 environment
RUN pip install --quiet --no-cache-dir \
  umap-learn \
  scanpy \
  numpy \
  pandas \
  matplotlib \
  seaborn \
  gprofiler \
#  MulticoreTSNE \
  gseapy \
  "mudatasets[muon]" \
  muon \
  anndata2ri \
  scib \
  scirpy \
  palmotif \
  harmonypy \
  decoupler \
  liana \
#  pertpy \
  altair \
  vega_datasets \
#  sc-toolbox \
  cassiopeia \
  scvelo \
  celltypist \
  bbknn \
  pingouin && \
fix-permissions "${CONDA_DIR}" && \
fix-permissions "/home/${NB_USER}"

#WORKDIR /
USER root

RUN apt-get update
RUN apt-get install -y \
    libhdf5-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libpng-dev \
    libboost-all-dev \
    libxml2-dev \
    openjdk-8-jdk \
    wget \
    git \
    libfftw3-dev \
    libgsl-dev \
    libgeos-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev

USER ${NB_UID}

RUN R -e 'install.packages("languageserver", repos="http://cran.rstudio.com/")'
RUN R -e 'install.packages("devtools", repos="http://cran.rstudio.com/")'
RUN R -e 'install.packages(c("assertthat", "cpp11", "tidyselect", "vectrs", "R6", "purr", "bit64"), repos="http://cran.rstudio.com/")'
RUN R -e 'install.packages("arrow", repos="http://cran.rstudio.com/")'
RUN R -e 'install.packages(c("scran","RColorBrewer","ggplot2","SingleR","clusterProfiler","enrichplot","MAST","org.Hs.eg.db", "AnnotationDbi"), repos="http://cran.rstudio.com/")'

# Install bioconductor dependencies & suggests
RUN R --no-echo --no-restore --no-save -e "install.packages('BiocManager', repos='http://cran.rstudio.com/')"
RUN R --no-echo --no-restore --no-save -e \
  "BiocManager::install(c('multtest', 'S4Vectors', 'SummarizedExperiment', 'SingleCellExperiment', 'MAST', 'DESeq2','BiocGenerics', 'GenomicRanges', 'IRanges', 'rtracklayer', 'monocle', 'Biobase', 'limma', 'glmGamPoi', 'zellkonverter', 'DropletUtils', 'scry'))"

# Install CRAN suggests
RUN R --no-echo --no-restore --no-save -e "install.packages(c('VGAM', 'R.utils', 'metap', 'Rfast2', 'ape', 'enrichR', 'mixtools'), repos='http://cran.rstudio.com/')"

# Install hdf5r
RUN R --no-echo --no-restore --no-save -e "install.packages('hdf5r',repos='http://cran.rstudio.com/')"

# Install Seurat
RUN R --no-echo --no-restore --no-save -e "install.packages('remotes',repos='http://cran.rstudio.com/')"
RUN R --no-echo --no-restore --no-save -e "install.packages('Seurat', repos='http://cran.rstudio.com/')"

# Install SeuratDisk
RUN R --no-echo --no-restore --no-save -e "remotes::install_github('mojaveazure/seurat-disk', repos='http://cran.rstudio.com/')" 

# install the MuSiC package
RUN R --no-echo --no-restore --no-save -e "BiocManager::install('TOAST')"
RUN R --no-echo --no-restore --no-save -e "devtools::install_github('xuranw/MuSiC', repos='http://cran.rstudio.com/')"

# Install decoupleR
RUN R --no-echo --no-restore --no-save -e "BiocManager::install(c('OmnipathR','saezlab/decoupleR'))"

#USER ${NB_UID}
#WORKDIR "${HOME}"

RUN fix-permissions "${CONDA_DIR}" && \
  fix-permissions "/home/${NB_USER}"
