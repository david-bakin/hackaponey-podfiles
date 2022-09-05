#!/usr/bin/env bash

set -eu;

echo GITPOD_REPO_ROOT: ${GITPOD_REPO_ROOT}

_source_dir="$(readlink -f "$0")" && _source_dir="${_source_dir%/*}";

echo _source_dir: ${_source_dir}

for _file in '.default.gitpod.yml' '.default.gitpod.Dockerfile'; do {
    _file_final="${_file#.default}";
    echo _file: ${_file}, _file_final: ${_file_final};
    if test -e "$_source_dir/$_file_final" && test ! -e "$GITPOD_REPO_ROOT/$_file_final"; then {
        echo cp: copying $_source_dir/$_file to $GITPOD_REPO_ROOT/$_file_final;
        cp "$_source_dir/$_file" "$GITPOD_REPO_ROOT/$_file_final";
    } fi
} done

