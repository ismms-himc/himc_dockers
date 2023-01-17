UBUNTU_RELEASE=$(lsb_release --release --short)

#apt-get update -qq
apt-get update -qq && apt-get install --reinstall -y lsb-release && apt-get clean all

BUILDDEPS="${BUILDDEPS} \
    libarrow-dev \
    libarrow-glib-dev \
    libarrow-flight-dev \
    libplasma-dev \
    libplasma-glib-dev \
    libgandiva-dev \
    libgandiva-glib-dev \
    libparquet-dev \
    libparquet-glib-dev
    libhdf5-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libpng-dev \
    libboost-all-dev \
    libxml2-dev \
    openjdk-8-jdk \
    python3-dev \
    python3-pip \
    wget \
    git \
    libfftw3-dev \
    libgsl-dev \
    libgeos-dev \
    llvm-10 \
    cmake"

#APACHEARROW_URL="https://dl.bintray.com/apache/arrow/$(lsb_release --codename --short | tr 'A-Z' 'a-z')"
#APACHEARROW_URL="https://apache.jfrog.io/artifactory/arrow/$(lsb_release --codename --short | tr 'A-Z' 'a-z')"
#wget -O /usr/share/keyrings/apache-arrow-keyring.gpg \
#     ${APACHEARROW_URL}/apache-arrow-keyring.gpg
#tee /etc/apt/sources.list.d/apache-arrow.list <<APT_LINE
#deb [arch=amd64 signed-by=/usr/share/keyrings/apache-arrow-keyring.gpg] ${APACHEARROW_URL}/ $(lsb_release --codename --short) main
#deb-src [signed-by=/usr/share/keyrings/apache-arrow-keyring.gpg] ${APACHEARROW_URL}/ $(lsb_release --codename --short) main
#APT_LINE
#  apt-get update -qq
apt update -qq && \
apt install -y -V ca-certificates lsb-release && \
wget https://apache.jfrog.io/artifactory/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb && \
apt install -y -V ./apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb

curl https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
  echo "deb http://apt.llvm.org/$(lsb_release --codename --short)/ llvm-toolchain-$(lsb_release --codename --short) main" > \
  /etc/apt/sources.list.d/llvm.list && \
  apt-get update --quiet

apt-get install -y ${BUILDDEPS}

# jupyterlab-lsp: better UI for R code cells
python3 -m pip install --pre jupyter-lsp
jupyter labextension install @krassowski/jupyterlab-lsp
python3 -m pip install \
         bash-language-server \
	 python-language-server[all]

# Install UMAP
LLVM_CONFIG=/usr/lib/llvm-10/bin/llvm-config pip3 install llvmlite

python3 -m pip install \
  python-igraph networkx python-louvain leidenalg scikit-learn smfishHmrf \
  umap-learn \
  scanpy \
  numpy \
  pandas \
  matplotlib \
  seaborn \
  gprofiler \
  MulticoreTSNE \
  gseapy 

R -e 'install.packages("languageserver")'

R -e 'install.packages(c("assertthat", "cpp11", "tidyselect", "vectrs", "R6", "purr", bit64"))'
R -e 'install.packages("arrow")'
R -e 'install.packages("scran","RColorBrewer","ggplot2","SingleR","clusterProfiler","enrichplot","MAST","org.Hs.eg.db", "AnnotationDbi")'
python3 -m pip install rpy2-arrow
python3 -m pip install -e git://github.com/rpy2/rpy2-R6.git@master#egg=rpy2_R6

# Install FIt-SNE
git clone --branch v1.2.1 https://github.com/KlugerLab/FIt-SNE.git
g++ -std=c++11 -O3 FIt-SNE/src/sptree.cpp FIt-SNE/src/tsne.cpp FIt-SNE/src/nbodyfft.cpp  -o bin/fast_tsne -pthread -lfftw3 -lm 

# Install bioconductor dependencies & suggests
R --no-echo --no-restore --no-save -e "install.packages('BiocManager')"
R --no-echo --no-restore --no-save -e "BiocManager::install(c('multtest', 'S4Vectors', 'SummarizedExperiment', 'SingleCellExperiment', 'MAST', 'DESeq2', 'BiocGenerics', 'GenomicRanges', 'IRanges', 'rtracklayer', 'monocle', 'Biobase', 'limma', 'glmGamPoi'))"

# Install CRAN suggests
R --no-echo --no-restore --no-save -e "install.packages(c('VGAM', 'R.utils', 'metap', 'Rfast2', 'ape', 'enrichR', 'mixtools'))"

# Install hdf5r
R --no-echo --no-restore --no-save -e "install.packages('hdf5r')"

# Install Seurat
R --no-echo --no-restore --no-save -e "install.packages('remotes')"
R --no-echo --no-restore --no-save -e "install.packages('Seurat')"

# Install SeuratDisk
R --no-echo --no-restore --no-save -e "remotes::install_github('mojaveazure/seurat-disk')"

# Install decoupleR
R --no-echo --no-restore --no-save -e "BiocManager::install('saezlab/decoupleR')"

rm -rf /tmp/* 
apt-get remove --purge -y ${BUILDDEPS}
apt-get autoremove -y 
apt-get autoclean -y
rm -rf /var/lib/apt/lists/*

R -e 'install.packages("ggpubr")'

rm -rf /tmp/* 
apt-get remove --purge -y ${BUILDDEPS}
apt-get autoremove -y 
apt-get autoclean -y
rm -rf /var/lib/apt/lists/*
