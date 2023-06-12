FROM ubuntu:18.04

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt update \
    && apt install -y htop python3-dev wget
    

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py39_23.3.1-0-Linux-x86_64.sh \
    && mkdir root/.conda \
    && sh Miniconda3-py39_23.3.1-0-Linux-x86_64.sh -b \ 
    && rm -f Miniconda3-py39_23.3.1-0-Linux-x86_64.sh


COPY . scr/


RUN conda update -n base -c defaults conda \ 
    && conda install conda=23.5.0

#RUN  conda create -y -n ml \
   # && pip install -r requirements.txt

RUN cd scr \
    && conda create -y -n ml \
    && conda run -n ml pip install -r requirements.txt


