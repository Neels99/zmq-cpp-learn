########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(libsodium_COMPONENT_NAMES "")
if(DEFINED libsodium_FIND_DEPENDENCY_NAMES)
  list(APPEND libsodium_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES libsodium_FIND_DEPENDENCY_NAMES)
else()
  set(libsodium_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(libsodium_PACKAGE_FOLDER_DEBUG "/home/sl33n/.conan2/p/b/libso66dc9d6022b3c/p")
set(libsodium_BUILD_MODULES_PATHS_DEBUG )


set(libsodium_INCLUDE_DIRS_DEBUG )
set(libsodium_RES_DIRS_DEBUG )
set(libsodium_DEFINITIONS_DEBUG "-DSODIUM_STATIC")
set(libsodium_SHARED_LINK_FLAGS_DEBUG )
set(libsodium_EXE_LINK_FLAGS_DEBUG )
set(libsodium_OBJECTS_DEBUG )
set(libsodium_COMPILE_DEFINITIONS_DEBUG "SODIUM_STATIC")
set(libsodium_COMPILE_OPTIONS_C_DEBUG )
set(libsodium_COMPILE_OPTIONS_CXX_DEBUG )
set(libsodium_LIB_DIRS_DEBUG "${libsodium_PACKAGE_FOLDER_DEBUG}/lib")
set(libsodium_BIN_DIRS_DEBUG )
set(libsodium_LIBRARY_TYPE_DEBUG STATIC)
set(libsodium_IS_HOST_WINDOWS_DEBUG 0)
set(libsodium_LIBS_DEBUG sodium)
set(libsodium_SYSTEM_LIBS_DEBUG pthread)
set(libsodium_FRAMEWORK_DIRS_DEBUG )
set(libsodium_FRAMEWORKS_DEBUG )
set(libsodium_BUILD_DIRS_DEBUG )
set(libsodium_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(libsodium_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${libsodium_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${libsodium_COMPILE_OPTIONS_C_DEBUG}>")
set(libsodium_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${libsodium_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${libsodium_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${libsodium_EXE_LINK_FLAGS_DEBUG}>")


set(libsodium_COMPONENTS_DEBUG )