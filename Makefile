FILES = .bashrc \
		.vimrc \
		.tmux.conf

dot.tar.xz: $(FILES)
	tar cJf $@ $(FILES)

tarball: dot.tar.xz

deploy: $(FILES)
	cp $(FILES) ~

clean:
	rm -f dot.tar.xz
