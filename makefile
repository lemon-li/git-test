VERSION=0.0.1

default: release

release:
	goreleaser release --rm-dist

build:
	goreleaser release --rm-dist --snapshot --skip-publish  --skip-sign
