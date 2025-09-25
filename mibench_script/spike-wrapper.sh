#!/usr/bin/env bash
set -x
spike --isa=rv32gc "$(command -v pk)" "$1" "${@:2}"
