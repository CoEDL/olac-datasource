#!/usr/bin/env bash

BASE="../docker"

build() {
    docker build --rm=true --tag "pdsc-olac-datasource/${1}" ${BASE}/${1}
}

if [ "$#" == 1 ] && [ -d "${BASE}/${1}" ] ; then
    build ${1}
else
    build api-base
    for folder in $(ls ${BASE}) ; do
        if [ "${folder}" != "api-base" ] ; then
            build ${folder}
        fi
    done
fi
