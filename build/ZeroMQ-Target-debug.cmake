# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(zeromq_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(zeromq_FRAMEWORKS_FOUND_DEBUG "${zeromq_FRAMEWORKS_DEBUG}" "${zeromq_FRAMEWORK_DIRS_DEBUG}")

set(zeromq_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET zeromq_DEPS_TARGET)
    add_library(zeromq_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET zeromq_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${zeromq_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${zeromq_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:libsodium::libsodium>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### zeromq_DEPS_TARGET to all of them
conan_package_library_targets("${zeromq_LIBS_DEBUG}"    # libraries
                              "${zeromq_LIB_DIRS_DEBUG}" # package_libdir
                              "${zeromq_BIN_DIRS_DEBUG}" # package_bindir
                              "${zeromq_LIBRARY_TYPE_DEBUG}"
                              "${zeromq_IS_HOST_WINDOWS_DEBUG}"
                              zeromq_DEPS_TARGET
                              zeromq_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "zeromq"    # package_name
                              "${zeromq_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${zeromq_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Debug ########################################

    ########## COMPONENT libzmq-static #############

        set(zeromq_libzmq-static_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(zeromq_libzmq-static_FRAMEWORKS_FOUND_DEBUG "${zeromq_libzmq-static_FRAMEWORKS_DEBUG}" "${zeromq_libzmq-static_FRAMEWORK_DIRS_DEBUG}")

        set(zeromq_libzmq-static_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET zeromq_libzmq-static_DEPS_TARGET)
            add_library(zeromq_libzmq-static_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET zeromq_libzmq-static_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${zeromq_libzmq-static_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${zeromq_libzmq-static_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${zeromq_libzmq-static_DEPENDENCIES_DEBUG}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'zeromq_libzmq-static_DEPS_TARGET' to all of them
        conan_package_library_targets("${zeromq_libzmq-static_LIBS_DEBUG}"
                              "${zeromq_libzmq-static_LIB_DIRS_DEBUG}"
                              "${zeromq_libzmq-static_BIN_DIRS_DEBUG}" # package_bindir
                              "${zeromq_libzmq-static_LIBRARY_TYPE_DEBUG}"
                              "${zeromq_libzmq-static_IS_HOST_WINDOWS_DEBUG}"
                              zeromq_libzmq-static_DEPS_TARGET
                              zeromq_libzmq-static_LIBRARIES_TARGETS
                              "_DEBUG"
                              "zeromq_libzmq-static"
                              "${zeromq_libzmq-static_NO_SONAME_MODE_DEBUG}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET libzmq-static
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${zeromq_libzmq-static_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${zeromq_libzmq-static_LIBRARIES_TARGETS}>
                     )

        if("${zeromq_libzmq-static_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET libzmq-static
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         zeromq_libzmq-static_DEPS_TARGET)
        endif()

        set_property(TARGET libzmq-static APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${zeromq_libzmq-static_LINKER_FLAGS_DEBUG}>)
        set_property(TARGET libzmq-static APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${zeromq_libzmq-static_INCLUDE_DIRS_DEBUG}>)
        set_property(TARGET libzmq-static APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Debug>:${zeromq_libzmq-static_LIB_DIRS_DEBUG}>)
        set_property(TARGET libzmq-static APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${zeromq_libzmq-static_COMPILE_DEFINITIONS_DEBUG}>)
        set_property(TARGET libzmq-static APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${zeromq_libzmq-static_COMPILE_OPTIONS_DEBUG}>)

    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET libzmq-static APPEND PROPERTY INTERFACE_LINK_LIBRARIES libzmq-static)

########## For the modules (FindXXX)
set(zeromq_LIBRARIES_DEBUG libzmq-static)
