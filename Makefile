all:
	ruby build.rb

clean:
	cd libarchive-3.6.2/libarchive && make -f ../../libarchive-static-makefile clean
	cd libarchive-0.1.1/ext && make -f ../../libarchive-static-wrapper-makefile clean
	cd zlib-1.2.13 && make clean
