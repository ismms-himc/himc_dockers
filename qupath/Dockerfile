FROM ubuntu:20.04

MAINTAINER Darwin D'Souza

RUN apt update && \
  apt install -y \
  wget \
  xz-utils

RUN wget https://github.com/qupath/qupath/releases/download/v0.4.2/QuPath-0.4.2-Linux.tar.xz
RUN tar -xf QuPath-0.4.2-Linux.tar.xz && \
    chmod u+x QuPath/bin/QuPath

RUN rm -f QuPath-0.4.2-Linux.tar.xz

#RUN cp QuPath/bin/QuPath /bin/
ENV PATH="${PATH}:/QuPath/bin/"

CMD ["QuPath/bin/QuPath", "script", "--help"]
