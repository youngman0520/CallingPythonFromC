from libcpp.vector cimport vector

cdef public int fib(int n):
    a,b = 0,1
    while b < n:
        a,b = b, a+b
    return a
    
cdef public int py_sum(vector[int] v):
    s = 0
    for i in range(0,v.size()):
        s += v[i]
    return s
    
