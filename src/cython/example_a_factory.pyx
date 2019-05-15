from libcpp.memory cimport shared_ptr

cimport c_example_a_factory
from example_a cimport A, PyA
from example_a import PyA


def get_a(val):
    cdef shared_ptr[A] c_a = c_example_a_factory.get_a(val)
    return PyA.create(c_a)
