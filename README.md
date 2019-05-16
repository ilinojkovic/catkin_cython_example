# Catkin Cython Example

### Run
```
$ mkdir -p workspace/src
$ cd workspace/src
$ git clone git@github.com:ilinojkovic/catkin_cython_example.git
$ cd ..
$ catkin_make
$ rosrun catkin_cython_example demo_example_a.py
```

Currently this builds, but doesn't run. Please see [this stack overflow post](https://stackoverflow.com/questions/56145982/error-importing-cython-module-when-called-from-python-after-successful-catkin-m) for details.

### References
- [ros_cython_example](https://github.com/longjie/ros_cython_example) by @longjie
- [cython_catkin_example](https://github.com/marcoesposito1988/cython_catkin_example) by @marcoesposito1988
- [cython_cmake_example](https://github.com/thewtex/cython-cmake-example) by @thewtex
