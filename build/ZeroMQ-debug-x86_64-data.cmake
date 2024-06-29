########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND zeromq_COMPONENT_NAMES libzmq-static)
list(REMOVE_DUPLICATES zeromq_COMPONENT_NAMES)
if(DEFINED zeromq_FIND_DEPENDENCY_NAMES)
  list(APPEND zeromq_FIND_DEPENDENCY_NAMES libsodium)
  list(REMOVE_DUPLICATES zeromq_FIND_DEPENDENCY_NAMES)
else()
  set(zeromq_FIND_DEPENDENCY_NAMES libsodium)
endif()
set(libsodium_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(zeromq_PACKAGE_FOLDER_DEBUG "/home/sl33n/.conan2/p/b/zeromc7dbefd4a73fa/p")
set(zeromq_BUILD_MODULES_PATHS_DEBUG )


set(zeromq_INCLUDE_DIRS_DEBUG "${zeromq_PACKAGE_FOLDER_DEBUG}/include")
set(zeromq_RES_DIRS_DEBUG )
set(zeromq_DEFINITIONS_DEBUG "-DZMQ_STATIC")
set(zeromq_SHARED_LINK_FLAGS_DEBUG )
set(zeromq_EXE_LINK_FLAGS_DEBUG )
set(zeromq_OBJECTS_DEBUG )
set(zeromq_COMPILE_DEFINITIONS_DEBUG "ZMQ_STATIC")
set(zeromq_COMPILE_OPTIONS_C_DEBUG )
set(zeromq_COMPILE_OPTIONS_CXX_DEBUG )
set(zeromq_LIB_DIRS_DEBUG "${zeromq_PACKAGE_FOLDER_DEBUG}/lib")
set(zeromq_BIN_DIRS_DEBUG )
set(zeromq_LIBRARY_TYPE_DEBUG STATIC)
set(zeromq_IS_HOST_WINDOWS_DEBUG 0)
set(zeromq_LIBS_DEBUG zmq)
set(zeromq_SYSTEM_LIBS_DEBUG pthread rt m)
set(zeromq_FRAMEWORK_DIRS_DEBUG )
set(zeromq_FRAMEWORKS_DEBUG )
set(zeromq_BUILD_DIRS_DEBUG )
set(zeromq_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(zeromq_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${zeromq_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${zeromq_COMPILE_OPTIONS_C_DEBUG}>")
set(zeromq_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${zeromq_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${zeromq_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${zeromq_EXE_LINK_FLAGS_DEBUG}>")


set(zeromq_COMPONENTS_DEBUG libzmq-static)
########### COMPONENT libzmq-static VARIABLES ############################################

set(zeromq_libzmq-static_INCLUDE_DIRS_DEBUG "${zeromq_PACKAGE_FOLDER_DEBUG}/include")
set(zeromq_libzmq-static_LIB_DIRS_DEBUG "${zeromq_PACKAGE_FOLDER_DEBUG}/lib")
set(zeromq_libzmq-static_BIN_DIRS_DEBUG )
set(zeromq_libzmq-static_LIBRARY_TYPE_DEBUG STATIC)
set(zeromq_libzmq-static_IS_HOST_WINDOWS_DEBUG 0)
set(zeromq_libzmq-static_RES_DIRS_DEBUG )
set(zeromq_libzmq-static_DEFINITIONS_DEBUG "-DZMQ_STATIC")
set(zeromq_libzmq-static_OBJECTS_DEBUG )
set(zeromq_libzmq-static_COMPILE_DEFINITIONS_DEBUG "ZMQ_STATIC")
set(zeromq_libzmq-static_COMPILE_OPTIONS_C_DEBUG "")
set(zeromq_libzmq-static_COMPILE_OPTIONS_CXX_DEBUG "")
set(zeromq_libzmq-static_LIBS_DEBUG zmq)
set(zeromq_libzmq-static_SYSTEM_LIBS_DEBUG pthread rt m)
set(zeromq_libzmq-static_FRAMEWORK_DIRS_DEBUG )
set(zeromq_libzmq-static_FRAMEWORKS_DEBUG )
set(zeromq_libzmq-static_DEPENDENCIES_DEBUG libsodium::libsodium)
set(zeromq_libzmq-static_SHARED_LINK_FLAGS_DEBUG )
set(zeromq_libzmq-static_EXE_LINK_FLAGS_DEBUG )
set(zeromq_libzmq-static_NO_SONAME_MODE_DEBUG FALSE)

# COMPOUND VARIABLES
set(zeromq_libzmq-static_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${zeromq_libzmq-static_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${zeromq_libzmq-static_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${zeromq_libzmq-static_EXE_LINK_FLAGS_DEBUG}>
)
set(zeromq_libzmq-static_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${zeromq_libzmq-static_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${zeromq_libzmq-static_COMPILE_OPTIONS_C_DEBUG}>")