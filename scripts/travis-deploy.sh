#!/usr/bin/env bash
set -o pipefail
set -o errexit
set -o nounset
# set -o xtrace

# http://stackoverflow.com/questions/39829473/cryptography-assertionerror-sorry-but-this-version-only-supports-100-named-gro
# There is a bug with PyCParser - See https://github.com/pyca/cryptography/issues/3187
yes w |sudo -HE \
    env PATH=${PATH} LD_LIBRARY_PATH=${LD_LIBRARY_PATH:-} PYTHONPATH=${PYTHONPATH:-} \
    pip install \
      --ignore-installed \
      --force-reinstall \
      --disable-pip-version-check \
      requests==2.5.3 \
      pycparser==2.16

# because a Travis deploy script has to be a real file
npm run deploy:travis
