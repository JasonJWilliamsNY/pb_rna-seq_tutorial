
# SRA-Tools Dockerfile

# Based on Ubuntu
FROM ubuntu:bionic-20200903

# Maintainer and labels
MAINTAINER Jason Williams "williams@cshl.edu"
LABEL Description="This image is used for importing accessions from NCBI SRA"

# Install additional linux basics/common dependancies
RUN apt update -y && apt upgrade -y && apt-get install -y --fix-missing\
 software-properties-common\
 build-essential gcc\
 build-essential\
 dialog\
 libssl1.0-dev\
 zip\
 unzip\
 sudo\
 openssh-server\
 apparmor-profiles\
 libxml2-dev\
 pkg-config\
 libxt-dev\
 libfreetype6-dev\
 libzmq3-dev\
 htop\
 libhdf5-dev\
 libglib2.0-0\
 libxext6\
 libsm6\
 libxrender1\
 openssl\
 npm nodejs\
 nodejs\
 libncurses5-dev\
 libncursesw5-dev\
 ncurses-term\
 wget\
 libxml-libxml-perl

# Install and configure miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py37_4.8.3-Linux-x86_64.sh
RUN bash Miniconda3-py37_4.8.3-Linux-x86_64.sh -b -p /opt/conda
RUN ln -s /opt/conda/pkgs/*/bin/* /bin; exit 0
RUN ln -s /opt/conda/pkgs/*/lib/* /usr/lib; exit 0
RUN /opt/conda/bin/conda config --add channels defaults
RUN /opt/conda/bin/conda config --add channels bioconda
RUN /opt/conda/bin/conda config --add channels conda-forge

# Install SRA-Tools
RUN opt/conda/bin/conda install -c conda-forge -c bioconda sra-tools==2.10.8
RUN ln -s /opt/conda/pkgs/*/bin/* /bin; exit 0
RUN ln -s /opt/conda/pkgs/*/lib/* /usr/lib; exit 0

COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

#make a location for SRA files to output
RUN mkdir /sra_files
WORKDIR /sra_files
ENTRYPOINT ["/usr/local/bin/run.sh"]
