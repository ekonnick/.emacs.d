CWD=$(shell pwd)

all:

submodules: ess magit

magit: FORCE
	cd magit; \
	git pull origin master; \
	make clean; \
	make; \
	cd ${CWD}; \
	git add magit; \
	git commit -m "update magit"

ess: FORCE
	cd ess; \
	git pull origin master; \
	make clean; \
	make ; \
	cd ${CWD}; \
	git add ess; \
	git commit -m "update ess"

xmodmap:
	cp .Xmodmap ${HOME}

publish:
	cd ../.emacs.d.ghpages; \
	git commit -a -m "update ghpages"; \
	git push origin gh-pages;
	cd ${CWD}


FORCE:
