.PHONY: all build key-export run

all: run

build:
	docker build . -t asc-key-to-qr-code-gif

key-export:
	@if [ "$(KEY_ID)" = "" ]; then \
		echo "KEY_ID is not set. Please set it."; exit 1; fi
	gpg --export -a "$(KEY_ID)" > public.asc
	gpg --export-secret-keys -a "$(KEY_ID)" > private.asc
	

run: key-export build
	docker run --rm -v $$(pwd):/data -e "SRC=/data/public.asc" -e "DST=/data/public.gif" asc-key-to-qr-code-gif
	docker run --rm -v $$(pwd):/data -e "SRC=/data/private.asc" -e "DST=/data/private.gif" asc-key-to-qr-code-gif
