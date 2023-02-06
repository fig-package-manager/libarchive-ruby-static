all: zlib-1.2.13 libarchive-3.6.2
	ruby generic-gem-package/ext/extconf.rb

gem:
	ruby generic-gem-package.rb

zlib-1.2.13:
	unzip zlib-1.2.13.zip && rm zlib-1.2.13/Makefile

libarchive-3.6.2:
	unzip libarchive-3.6.2.zip

clean:
	cd libarchive-0.1.1/ext && make -f ../../libarchive-static-wrapper-makefile clean

depclean:
	rm -rf libarchive-3.6.2 zlib-1.2.13