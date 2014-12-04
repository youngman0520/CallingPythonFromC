#include <iostream>
#include <Python.h>
#include "TestCython.h"

int main()
{
    Py_Initialize();
    initTestCython();
    std::cout << "Hello World!" << std::endl;
    std::cout << fib(3) << std::endl;
    std::vector<int> v = std::vector<int>({1,2,3,4});
    std::cout << py_sum(v) << std::endl;
    Py_Finalize();
    return 0;
}