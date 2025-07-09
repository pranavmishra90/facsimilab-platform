# syntax=docker/dockerfile:1

############################
ARG IMAGE_VERSION="dev"
ARG PYTHON_ENV_IMAGE_VERSION="dev"
ARG IMAGE_REPO_PREFIX="pranavmishra90/"

############################

FROM pranavmishra90/facsimilab-main:dev AS spaceranger-builder

ARG MAMBA_USER=coder
ARG MAMBA_USER_ID=1000
ARG MAMBA_USER_GID=1000

ENV MAMBA_USER=$MAMBA_USER
ENV MAMBA_ROOT_PREFIX="/opt/conda"
ENV MAMBA_EXE="/bin/micromamba"
ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="America/Chicago"
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV ENV_NAME=base

ENV PATH="/opt/spaceranger:${PATH}"

RUN mkdir -p /opt/spaceranger

# COPY spaceranger-4.0.1.tar.gz /opt/tar/spaceranger.tar.gz


# RUN tar -xvf /opt/tar/spaceranger.tar.gz -C /opt/spaceranger && \
#     rm -rf /opt/tar/spaceranger.tar.gz

ADD spaceranger-4.0.1.tar.gz /opt

ENV PATH="/opt/spaceranger-4.0.1:${PATH}"