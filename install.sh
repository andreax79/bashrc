#!/bin/bash
set -e
cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"
# Execute install commands
export NONINTERACTIVE=1
for install in install.d/* ; do
  $install
done
