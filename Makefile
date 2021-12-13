FILES_HOME =\
	.bashrc \
	.vimrc \
	.vim \
	.tmux.conf

FILES_BIN =\
	bin/install-jar

dot.tar.xz: $(FILES_HOME) $(FILES_BIN)
	tar cJf $@ $^

tarball: dot.tar.xz

deploy: $(FILES)
	cp -r -t $(HOME) $(FILES_HOME)
	cp -r -t $(HOME)/bin $(FILES_BIN)

clean:
	rm -f dot.tar.xz
