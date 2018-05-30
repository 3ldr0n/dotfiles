#!/bin/bash

export PROJECTS_DIR=/home/eldron/Projects/*

for entry in $PROJECTS_DIR
do
    echo "$entry"
    cd $entry && git status && git pull
done
