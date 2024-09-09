fetch-deps:
	git submodule update --remote --recursive --init

clean: fetch-deps
	rm -R -f build;
	rm -R -f .xmake;

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

build-colab-x86_64:
	source ~/.xmake/profile && xmake clean --root; source ~/.xmake/profile && xmake --root
	rm -f out/extractor.cpp;
	rm -f out/extractor.py;
	rm -f out/_extractor.so;
	cp build/.gens/extractor/linux/x86_64/release/rules/swig/extractor.cpp out/extractor.cpp;
	cp build/.gens/extractor/linux/x86_64/release/rules/swig/extractor.py out/extractor.py;
	cp build/linux/x86_64/release/_extractor.so out/_extractor.so;

fetch-and-build-linux-x86_64: fetch-deps clean build-linux-x86_64

fetch-and-build-windows-x86_64: fetch-deps clean build-windows-x86_64

fetch-and-build-colab-x86_64: fetch-deps clean build-colab-x86_64