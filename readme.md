# About
Its high-level API python bindings of c++ framework [non-parametric-dsp](https://github.com/Dimandragon/non-parametric-dsp) for preprocessing of different time-series as EEG for example
# How to run
## Dependencies
To build bindings you need the following list of packages
- gcc/clang 
- python
- make
- xmake
- swig
- git
## Build
### Linux x86_64
```
git clone https://github.com/Dimandragon/hedgehog-tokenizer; make fetch-and-build-linux-x86_64
```
### Windows x86_64
```
git clone https://github.com/Dimandragon/hedgehog-tokenizer; make fetch-and-build-windows-x86_64
```
### Google colab
```
git clone https://github.com/Dimandragon/hedgehog-tokenizer; make fetch-and-build-colab-x86_64
```
to install dependencies in colab you canrun following commands
```
!apt-get install swig

!swig --version

!sudo apt install gcc-12

!sudo apt install g++-12

!sudo apt install libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev tk-dev libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev libffi-dev uuid-dev

!sudo apt install libstdc++6
!curl -fsSL https://xmake.io/shget.text | bash
```
## Run example
To run example you can just run out/runme.py after building
## Using
After project building to use bindings you can import out/extractor.py file from your script without extracting it from the out directory
Also you can copy out directory to your project