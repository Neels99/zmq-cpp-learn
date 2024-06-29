message(STATUS "Conan: Using CMakeDeps conandeps_legacy.cmake aggregator via include()")
message(STATUS "Conan: It is recommended to use explicit find_package() per dependency instead")

find_package(Boost)
find_package(cppzmq)
find_package(ZeroMQ)

set(CONANDEPS_LEGACY  boost::boost  cppzmq  libzmq-static )