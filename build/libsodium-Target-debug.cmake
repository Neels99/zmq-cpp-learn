# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(libsodium_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(libsodium_FRAMEWORKS_FOUND_DEBUG "${libsodium_FRAMEWORKS_DEBUG}" "${libsodium_FRAMEWORK_DIRS_DEBUG}")

set(libsodium_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET libsodium_DEPS_TARGET)
    add_library(libsodium_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET libsodium_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${libsodium_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${libsodium_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### libsodium_DEPS_TARGET to all of them
conan_package_library_targets("${libsodium_LIBS_DEBUG}"    # libraries
                              "${libsodium_LIB_DIRS_DEBUG}" # package_libdir
                              "${libsodium_BIN_DIRS_DEBUG}" # package_bindir
                              "${libsodium_LIBRARY_TYPE_DEBUG}"
                              "${libsodium_IS_HOST_WINDOWS_DEBUG}"
                              libsodium_DEPS_TARGET
                              libsodium_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "libsodium"    # package_name
                              "${libsodium_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${libsodium_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET libsodium::libsodium
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${libsodium_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${libsodium_LIBRARIES_TARGETS}>
                 )

    if("${libsodium_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET libsodium::libsodium
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     libsodium_DEPS_TARGET)
    endif()

    set_property(TARGET libsodium::libsodium
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${libsodium_LINKER_FLAGS_DEBUG}>)
    set_property(TARGET libsodium::libsodium
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${libsodium_INCLUDE_DIRS_DEBUG}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET libsodium::libsodium
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${libsodium_LIB_DIRS_DEBUG}>)
    set_property(TARGET libsodium::libsodium
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${libsodium_COMPILE_DEFINITIONS_DEBUG}>)
    set_property(TARGET libsodium::libsodium
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${libsodium_COMPILE_OPTIONS_DEBUG}>)

########## For the modules (FindXXX)
set(libsodium_LIBRARIES_DEBUG libsodium::libsodium)
