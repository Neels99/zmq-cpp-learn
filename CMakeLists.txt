cmake_minimum_required(VERSION 3.22)
project(zmq-demo)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(ZeroMQ REQUIRED)
find_package(cppzmq REQUIRED)
find_package(Boost REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main libzmq-static cppzmq)

add_subdirectory(first_step)