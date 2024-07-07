fetch-deps:
	git submodule update --remote --recursive --init

build-linux-x86_64: 
	xmake clean; xmake;
	rm -f out/extractor.cpp;
	rm -f out/extractor.py;
	rm -f out/_extractor.so;
	cp build/.gens/extractor/linux/x86_64/release/rules/swig/extractor.cpp out/extractor.cpp;
	cp build/.gens/extractor/linux/x86_64/release/rules/swig/extractor.py out/extractor.py;
	cp build/linux/x86_64/release/_extractor.so out/_extractor.so;

build-windows-x86_64:
	xmake clean; xmake;
	rm -f out/extractor.cpp;
	rm -f out/extractor.py;
	rm -f out/_extractor.so;
	cp build/.gens/extractor/windows/x86_64/release/rules/swig/extractor.cpp out/extractor.cpp;
	cp build/.gens/extractor/windows/x86_64/release/rules/swig/extractor.py out/extractor.py;
	cp build/windows/x86_64/release/_extractor.so out/_extractor.so;

fetch-and-build-linux-x86_64: fetch-deps build-linux-x86_64

fetch-and-build-windows-x86_64: fetch-deps build-windows-x86_64