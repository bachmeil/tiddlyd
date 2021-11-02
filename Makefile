install:
	ldmd2 *.d -oftiddly -version=embedded_httpd
	mv tiddly ~/bin
	rm *.o
