from libcpp.memory cimport shared_ptr


cdef extern from "catkin_cython_example/example_a.hpp" namespace "example_a":

    cdef cppclass A:
        int get() const

cdef class PyA:
    cdef shared_ptr[A] c_a  # Hold a C++ instance which we're wrapping

    @staticmethod
    cdef inline create(shared_ptr[A] c_a):
        cdef PyA py_a = PyA()
        py_a.c_a = c_a

        return py_a
