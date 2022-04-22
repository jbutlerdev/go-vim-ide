#!/bin/bash

# Validate HOME is set
if [ -z ${HOME} ]; then
  echo "Failed to detect home failed, exiting"
  exit 1
fi

# Validate bashrc.d folder exists
# Currently only supporting bash shells
if [ ! -d ${HOME}/.bashrc.d ]; then
  echo "Failed to detect bashrc.d location, exiting"
  exit 1
fi

ALIAS_FILE=${HOME}/.bashrc.d/nvim_alias
CONTAINER_RUNTIME=

if [ -f /usr/bin/podman ]; then
  CONTAINER_RUNTIME=podman
elif [ -f /usr/bin/docker ]; then
  CONTAINER_RUNTIME=docker
else
  echo "Failed to detect container runtime, exiting"
  exit 1
fi

echo "alias nvim='$CONTAINER_RUNTIME run -it --rm -v \${HOME}/.ssh:/root/.ssh:z -v \${HOME}/.gitconfig:/root/.gitconfig:z -v \${PWD}:\${PWD}:z -w \${PWD} go-vim-ide:latest'" > ${ALIAS_FILE}

source ${ALIAS_FILE}
