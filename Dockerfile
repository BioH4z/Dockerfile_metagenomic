FROM biohaz/basic_ubuntu:latest

# Locale for click
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8


# Install conda
RUN wget -q https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh -O /tmp/Anaconda3-2020.02-Linux-x86_64.sh
RUN /bin/bash /tmp/Anaconda3-2020.02-Linux-x86_64.sh -bp /opt/Anaconda3
RUN rm /tmp/Anaconda3-2020.02-Linux-x86_64.sh

# Set conda environment
RUN echo "export PATH=/opt/Anaconda3/bin:$PATH" > /etc/profile
ENV PATH /opt/Anaconda3/bin:$PATH

RUN source activate
RUN conda update -n base -c defaults conda
RUN conda install -c bioconda -c conda-forge fastqc multiqc trimmomatic cutadapt kraken2 bracken spades kaiju krona
