from cython.operator cimport dereference as d


cdef class PyA:

    def get():
        cdef int v = d(self.c_a).get()
        return v
