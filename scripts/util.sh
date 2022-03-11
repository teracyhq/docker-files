#!/bin/bash

DEFAULT_REGISTRIES=${DEFAULT_REGISTRIES:-ghcr.io}

# build docker meta images from registries (list of registries, separated by comma) and image name
# if registries is empty -> use github package registry
# the meta images are the list of <registry>/<image_name>
# build_meta_images <image_name>
# build_meta_images <registries> <image_name>
build_meta_images() {
  local registries=$1 # can be empty
  local image_name=$2 # required, most not empty
  if [ -z "$image_name" ]; then
    if [ -z "$registries" ]; then
      echo "args required: build_meta_images <image_name> or build_meta_images <registries> <image_name>"
      return
    else
      registries=$DEFAULT_REGISTRIES
      image_name=$1
    fi
  fi

  local meta_images=();

  IFS=', ' read -r -a array <<< "$registries"
  for reg in "${array[@]}"
  do
    meta_images+=("$reg/$image_name")
  done
  printf -v joined '%s,' "${meta_images[@]}"
  echo "${joined%,}"
}

# echo $(build_meta_images "hello")

# echo $(build_meta_images "ghcr.io/repo-name,docker.io/user" "hello")
