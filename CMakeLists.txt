cmake_minimum_required(VERSION 3.13...3.17)

project(cmake-ci-test LANGUAGES CXX)

add_executable(cmake_test)

target_compile_features(cmake_test PUBLIC cxx_std_11)
set_target_properties(cmake_test PROPERTIES
        CXX_EXTENSIONS OFF)


target_sources(cmake_test PRIVATE src/main.cpp)

