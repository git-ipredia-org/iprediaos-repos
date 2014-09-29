VERSION=$(shell awk '/Version:/ { print $$2 }' iprediaos-repos.spec)
RELEASE=$(shell awk '/Release:/ { print $$2 }' iprediaos-repos.spec)
GITTAG=iprediaos-repos-$(VERSION)

all:

tag-archive:
	@git tag -a -m "Tag as $(GITTAG)" -f $(GITTAG)
	@echo "Tagged as $(GITTAG)"

create-archive:
	@git archive --prefix $(GITTAG)/ --format tar $(GITTAG) |bzip2 > $(GITTAG).tar.bz2
	@echo ""
	@echo "The final archive is in $(GITTAG).tar.bz2"

archive: tag-archive create-archive
