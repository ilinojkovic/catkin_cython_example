#!/usr/bin/env python
from catkin_cython_example.example_a_factory import get_a

if __name__ == '__main__':
    a = get_a(10)
    print a.get()
