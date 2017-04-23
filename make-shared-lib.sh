#!/usr/bin/env bash
# Obviously this won't run.

file="$1"

revamb -L -f -- "${file}" "${file}".ll
opt -S -O3 "${file}".ll -o "${file}".ll.opt.ll
llc -O3 "${file}".ll.opt.ll -filetype=obj -relocation-model=pic
clang -O3 -shared -fPIC "${file}".ll.opt.o
