FILES = .bashrc \
		.vimrc \
		.vim \
		.tmux.conf

dot.tar.xz: $(FILES)
	tar cJf $@ $(FILES)

tarball: dot.tar.xz

deploy: $(FILES)
	cp -r $(FILES) ~

clean:
	rm -f dot.tar.xz
