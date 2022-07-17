#!/bin/bash

set -e

# Require env:
# - GITHUB_TOKEN
# - GPG_FINGERPRINT


NAME="git-test"
VERSION="0.0.1"

git add -A
git commit -m "update"

git tag v${VERSION}

cd dist
shasum -a 256 *.zip > terraform-provider-${NAME}_${VERSION}_SHA256SUMS
gpg --detach-sign terraform-provider-${NAME}_${VERSION}_SHA256SUMS

cd ..
goreleaser release --rm-dist
