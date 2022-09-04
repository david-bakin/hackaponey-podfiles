#!/usr/bin/env bash

set -eu;

_source_dir="$(readlink -f "$0")" && _source_dir="${_source_dir%/*}";
for _file in '.default.gitpod.yml' '.default.gitpod.Dockerfile'; do {
    _file_final="${_file#.default}";
    if test -e "$_source_dir/$_file_final" && test ! -e "$GITPOD_REPO_ROOT/$_file_final"; then {
        cp "$_source_dir/$_file" "$GITPOD_REPO_ROOT/$_file_final";
    } fi
} done

