#!/bin/bash
name="ClipTrigger"
version="1.0"
dirpath="$(dirname "$(realpath "$0")")"
dpkg-deb --root-owner-group -b "$dirpath/${name}_v${version}"
