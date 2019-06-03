# If the pyx file is a C++ file, we should specify that here.
set_source_files_properties(
        ${CMAKE_CURRENT_SOURCE_DIR}/example_a.pyx
        ${CMAKE_CURRENT_SOURCE_DIR}/example_a_factory.pyx
        PROPERTIES CYTHON_IS_CXX TRUE )

if(APPLE)
    include_directories(/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/numpy/core/include/)
endif(APPLE)

# CAUTION:
#  - You can specify only one .pyx file for each cython module.
#  - The name of the module and the .pyx file should be identical.
cython_add_module(example_a example_a.pyx)
cython_add_module(example_a_factory example_a_factory.pyx example_a)

# Set the targets to be copied in the python package directry.
set_target_properties(example_a example_a_factory
        PROPERTIES
        LIBRARY_OUTPUT_DIRECTORY
        ${CATKIN_DEVEL_PREFIX}/${CATKIN_PACKAGE_PYTHON_DESTINATION})
