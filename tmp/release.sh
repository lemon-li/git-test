#!/bin/bash

set -e

test -z "$TMPDIR" && TMPDIR="$(mktemp -d)"
if command -v gpg >/dev/null 2>&1; then
    echo $GPG_PRIVATE_KEY > "${TMPDIR}/secret.txt"
    gpg --import "${TMPDIR}/secret.txt"
    # gpg --batch --local-user "admin <admin@wengcx.top>" --output file.sig --detach-sign file
    epxort GPG_FINGERPRINT="admin <admin@wengcx.top>"
    goreleaser release --rm-dist
    rm -f "${TMPDIR}/secret.txt"
else
    echo "gpg is not installed."
fi




# Require env:
# - GITHUB_TOKEN
# - GPG_FINGERPRINT


# NAME="git-test"
# VERSION="0.0.1"

# git add -A
# git commit -m "update"

# git tag v${VERSION}

# cd dist
# shasum -a 256 *.zip > terraform-provider-${NAME}_${VERSION}_SHA256SUMS
# gpg --detach-sign terraform-provider-${NAME}_${VERSION}_SHA256SUMS

# cd ..
# goreleaser release --rm-dist
