#!/usr/bin/env bash
set -x
spike --isa=rv32im "$(command -v pk)" "$1" "${@:2}"
