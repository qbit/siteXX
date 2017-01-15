VERSION=60
ARCH=amd64
DEST_HOST=root@block
DEST=/var/www/htdocs/pub/OpenBSD/snapshots/$(ARCH)/

PHONY: perms tar

clean:
	rm site$(VERSION).tgz

perms:
	chmod +x *.site

tar:
	tar -pcvzf site$(VERSION).tgz install.site *.conf

install-remote: perms tar
	scp site$(VERSION).tgz $(DEST_HOST):$(DEST)
	ssh $(DEST_HOST) "ls -l $(DEST) > $(DEST)/index.txt"
	rm site$(VERSION).tgz

install: perms tar
	mv site$(VERSION).tgz $(DEST)
	ls -l $(DEST) > $(DEST)/index.txt
