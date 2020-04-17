include config.mk

HOMEDIR = $(shell pwd)

pushall: sync
	git push origin master

prettier:
	prettier --single-quote --write "**/*.html"

sync:
	scp index.html $(USER)@$(SERVER):$(APPDIR)
	scp app.css $(USER)@$(SERVER):$(APPDIR)

set-up-server-dir:
	ssh $(USER)@$(SERVER) "mkdir -p $(APPDIR)"
