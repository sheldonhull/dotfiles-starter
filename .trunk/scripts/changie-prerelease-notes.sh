#!/usr/bin/env bash
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
changie batch auto --keep --prerelease 'PRERELEASE' --force && changie merge && trunk fmt --filter=prettier
