# himc_dockers
Docker builds for all tools used by HIMC

# To use on Minerva
`ml singularity`
`singularity pull dsouzd04/himc_seurat`
`singularity shell himc_seurat.sif # go inside container`
`singularity exec R -e 'library(Seurat)' # run command`

# Tools

## Seurat v4.2.1

[Docker](https://hub.docker.com/repository/docker/dsouzd04/himc_seurat)
[Homepage](https://satijalab.org/seurat/)

## SPOTlight Bioconductor v1.0.0

[Docker](https://hub.docker.com/repository/docker/dsouzd04/himc_spotlight)
[Homepage](https://marcelosua.github.io/SPOTlight/)

## RCTD from spacexr v2.0.3
[Docker](https://hub.docker.com/repository/docker/dsouzd04/himc_rctd)
[Homepage](https://github.com/dmcable/spacexr)







