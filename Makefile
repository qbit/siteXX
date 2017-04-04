VERSION=61
ARCH=amd64
DEST_HOST=root@block
DEST=/var/www/htdocs/pub/OpenBSD/snapshots/$(ARCH)/

PHONY: perms tar

clean:
	rm -rf build/

perms:
	chmod +x src/*.site

tar:
	mkdir -p build
	cd src && \
	tar -pcvzf ../build/site$(VERSION).tgz *

install-remote: perms tar
	scp build/site$(VERSION).tgz $(DEST_HOST):$(DEST)
	ssh $(DEST_HOST) "ls -l $(DEST) > $(DEST)/index.txt"

install: perms tar
	mv build/site$(VERSION).tgz $(DEST)
	ls -l $(DEST) > $(DEST)/index.txt
