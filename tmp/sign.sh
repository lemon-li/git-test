#!/bin/bash

test -z "$TMPDIR" && TMPDIR="$(mktemp -d)"

if command -v gpg >/dev/null 2>&1; then
    echo $PRIVATE_KEY > "${TMPDIR}/secret.txt"
    gpg --import "${TMPDIR}/secret.txt"
    # gpg --fingerprint "admin <admin@wengcx.top>" |sed -n '/^\s/s/\s*//p'
    # gpg --batch --local-user "admin <admin@wengcx.top>" --output file.sig --detach-sign file
    rm -f "${TMPDIR}/secret.txt"
else
    echo "gpg is not installed."
fi
