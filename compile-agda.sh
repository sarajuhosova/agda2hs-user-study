#!/bin/bash

A_FILES="./lib/*.agda"
for f in $A_FILES; do agda2hs $f -o src; done

H_FILES="./src/*.hs"
for f in $H_FILES; do sed -i 's/unsolved#meta\..*/undefined/' $f; done
