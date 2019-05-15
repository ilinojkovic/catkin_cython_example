from libcpp.memory cimport shared_ptr

from example_a cimport A

cdef extern from "catkin_cython_example/example_a_factory.hpp" namespace "example_a_factory":

    shared_ptr[A] get_a(int val) except +
