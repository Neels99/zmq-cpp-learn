########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(cppzmq_COMPONENT_NAMES "")
if(DEFINED cppzmq_FIND_DEPENDENCY_NAMES)
  list(APPEND cppzmq_FIND_DEPENDENCY_NAMES ZeroMQ)
  list(REMOVE_DUPLICATES cppzmq_FIND_DEPENDENCY_NAMES)
else()
  set(cppzmq_FIND_DEPENDENCY_NAMES ZeroMQ)
endif()
set(ZeroMQ_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(cppzmq_PACKAGE_FOLDER_DEBUG "/home/sl33n/.conan2/p/cppzm0c71a752fad11/p")
set(cppzmq_BUILD_MODULES_PATHS_DEBUG )


set(cppzmq_INCLUDE_DIRS_DEBUG "${cppzmq_PACKAGE_FOLDER_DEBUG}/include")
set(cppzmq_RES_DIRS_DEBUG )
set(cppzmq_DEFINITIONS_DEBUG )
set(cppzmq_SHARED_LINK_FLAGS_DEBUG )
set(cppzmq_EXE_LINK_FLAGS_DEBUG )
set(cppzmq_OBJECTS_DEBUG )
set(cppzmq_COMPILE_DEFINITIONS_DEBUG )
set(cppzmq_COMPILE_OPTIONS_C_DEBUG )
set(cppzmq_COMPILE_OPTIONS_CXX_DEBUG )
set(cppzmq_LIB_DIRS_DEBUG )
set(cppzmq_BIN_DIRS_DEBUG )
set(cppzmq_LIBRARY_TYPE_DEBUG UNKNOWN)
set(cppzmq_IS_HOST_WINDOWS_DEBUG 0)
set(cppzmq_LIBS_DEBUG )
set(cppzmq_SYSTEM_LIBS_DEBUG )
set(cppzmq_FRAMEWORK_DIRS_DEBUG )
set(cppzmq_FRAMEWORKS_DEBUG )
set(cppzmq_BUILD_DIRS_DEBUG )
set(cppzmq_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(cppzmq_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${cppzmq_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${cppzmq_COMPILE_OPTIONS_C_DEBUG}>")
set(cppzmq_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${cppzmq_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${cppzmq_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${cppzmq_EXE_LINK_FLAGS_DEBUG}>")


set(cppzmq_COMPONENTS_DEBUG )