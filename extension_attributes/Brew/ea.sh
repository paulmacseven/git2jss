#!/bin/bash
###########################################
set -euo pipefail
IFS=$'\n\t'

## Variables #################
brewArray=()

## Work Area ####################

if [[ -e /usr/local/bin/brew ]]; then
    while read -r brewApp; do
        name=$(basename "$brewApp")
            brewArray+=("${name}")
    done < <(ls /usr/local/Cellar/)
    echo "<result>$(printf '%s\n' "${brewArray[@]}")</result>"
else
    echo "<result>Not Installed</result>"
fi

exit 0