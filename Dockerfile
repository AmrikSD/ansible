FROM ubuntu:focal AS base

WORKDIR /usr/local/bin

# Needed or apt-get might ask for input...
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential sudo && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS amrik

RUN addgroup --gid 1000 amrik
RUN adduser --gecos amrik --uid 1000 --gid 1000 --disabled-password amrik
RUN adduser amrik sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER amrik
WORKDIR /home/amrik

FROM amrik
COPY . .
RUN ansible-playbook ./local.yml
