#!/bin/bash

cp -r ./default/. ./src

A_FILES="./lib/*.agda"
for f in $A_FILES; do agda2hs $f -o src; done

A_FILES="./lib/Help/*.agda"
for f in $A_FILES; do agda2hs $f -o src; done

H_FILES="./src/*.hs"
for f in $H_FILES; do sed -i 's/unsolved#meta\..*/undefined/' $f; done
