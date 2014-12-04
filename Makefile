#Compilers
CY = cython
CC = clang
CXX = clang++
CFLAGS = -O3 
CXXFLAGS = $(CFLAGS) -std=c++11

CYGEN = $(CYGENC) $(CYGENH)
CYGENC = TestCython.cpp
CYGENH = TestCython.h
CYO = TestCython.o
CYTO = TestCythonC.o

main: $(CYO) $(CYTO)
	$(CXX) $(CXXFLAGS) -o main $(CYO) $(CYTO) -lpython2.7

$(CYGENC):
	cython --cplus --capi-reexport-cincludes TestCython.pyx

$(CYO): $(CYGENC)
	$(CXX) $(CFLAGS) -c $(CYGENC) -I/usr/include/python2.7

$(CYTO):
	$(CXX) $(CXXFLAGS) -c TestCythonC.cpp -I/usr/include/python2.7

clean:
	rm -f $(CYGEN) $(CYO) $(CYTO) main
