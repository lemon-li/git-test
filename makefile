VERSION=0.0.1

default: release

release:
	goreleaser release --rm-dist

release_:
	goreleaser release --rm-dist --snapshot --skip-publish  --skip-sign
