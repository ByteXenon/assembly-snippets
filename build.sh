#!/bin/bash
# Usage: ./build.sh <filename>

filename="${1%.*}"

nasm -f elf64 "$filename.asm" -o "$filename.o"
ld -m elf_x86_64 -o "$filename" "$filename.o"
rm "$filename.o"