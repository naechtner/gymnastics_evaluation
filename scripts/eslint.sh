#! /bin/bash

echo "$@" | xargs -d " " -I {} echo "--file {}" | yarn lint --fix
