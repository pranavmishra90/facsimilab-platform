# Base env
############################
ARG IMAGE_VERSION="dev"
ARG IMAGE_REPO_PREFIX=""
############################
FROM ${IMAGE_REPO_PREFIX}facsimilab-base:${IMAGE_VERSION} AS main-python-builder


ARG IMAGE_VERSION="dev"
ARG ISO_DATETIME

LABEL org.opencontainers.image.title="FacsimiLab-Main-Environment"
LABEL version=${IMAGE_VERSION}
LABEL org.opencontainers.image.version=${IMAGE_VERSION}
LABEL org.opencontainers.image.authors='Pranav Kumar Mishra'
LABEL org.opencontainers.image.description="Main image python environment builder || FacsimiLab - A docker image for reproducible science, leveraging Python, Nvidia CUDA, Datalad, Quarto, and more."
LABEL org.opencontainers.image.source="https://github.com/FacsimiLab/FacsimiLab-platform"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.created=${ISO_DATETIME}
LABEL org.opencontainers.image.base.name="docker.io/pranavmishra90/facsimilab-base:${IMAGE_VERSION}"


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

# Use the root user to deal with permissions
USER root

# Install python base environment for the image
COPY --chown=$MAMBA_USER:$MAMBA_USER base.conda-lock.yml /tmp/env.lock
COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/base-environment.yml
COPY --chown=$MAMBA_USER:$MAMBA_USER /home ${MAMBA_ROOT_PREFIX}/


RUN	--mount=type=cache,target=${MAMBA_ROOT_PREFIX}/pkgs \
	micromamba install -y -n base -f /tmp/base-environment.yml \
	&& micromamba clean --all --yes

# RUN micromamba create --name test --yes --file /tmp/env.lock \
#     && micromamba clean --all --yes


