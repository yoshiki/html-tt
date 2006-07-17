# Makefile for html-tt.el
# $Id: Makefile 36 2002-05-01 10:31:08Z yoshiki $
#
# html-helper homepage:
# http://www.santafe.edu/~nelson/tools/
# ftp://ftp.reed.edu/pub/src/html-helper-mode.tar.gz

EMACS = emacs
PREFIX = /usr/local
INSTALLLIBDIR = $(PREFIX)/share/emacs/site-lisp
FLAGS = -batch -L $(INSTALLLIBDIR) -q -f batch-byte-compile
SRC = html-tt.el
INSTALL = /usr/bin/install -c -m 444

all: bytecompile

bytecompile:
	$(EMACS) $(FLAGS) $(SRC)

install: bytecompile
	$(INSTALL) html-tt.elc $(INSTALLLIBDIR)
	$(INSTALL) html-tt.el $(INSTALLLIBDIR)

uninstall:
	rm $(INSTALLLIBDIR)/html-tt.elc
	rm $(INSTALLLIBDIR)/html-tt.el

tardist:
	mkdir html-tt
	cp html-tt.el Makefile README html-tt
	tar zcvf html-tt.tar.gz html-tt
	rm -fr html-tt

clean:
	rm -fr \#*\# *.elc *~ *.tar.gz html-helper-mode.el* tempo.el*

install-html-helper-mode:
	fetch http://www.santafe.edu/~nelson/hhm-beta/html-helper-mode.el
	fetch http://www.santafe.edu/~nelson/hhm-beta/tempo.el
	$(EMACS) $(FLAGS) html-helper-mode.el
	$(EMACS) $(FLAGS) tempo.el
	$(INSTALL) html-helper-mode.el $(INSTALLLIBDIR)
	$(INSTALL) html-helper-mode.elc $(INSTALLLIBDIR)
	$(INSTALL) tempo.el $(INSTALLLIBDIR)
	$(INSTALL) tempo.elc $(INSTALLLIBDIR)
