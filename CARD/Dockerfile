FROM dsouzd04/seurat:4.2.1

RUN apt-get update
RUN apt-get install -y \
  build-essential \
  libcurl4-gnutls-dev \
  libxml2-dev \
  libssl-dev \
  libfontconfig1-dev \
  libharfbuzz-dev \
  libfribidi-dev \
  libfreetype6-dev \
  libpng-dev \
  libtiff5-dev \
  libjpeg-dev \
  libudunits2-dev \
  libgdal-dev

RUN R -e 'install.packages("devtools")'
RUN R -e 'devtools::install_github("YingMa0107/CARD")'
