link_libraries(cppzmq boost::boost)
add_executable(service1_broker broker.cpp)
add_executable(service1_s1 s1.cpp)
add_executable(service1_s2 s2.cpp)