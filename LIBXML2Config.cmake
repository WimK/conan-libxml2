include(SelectLibraryConfigurations)
include(FindPackageHandleStandardArgs)

if(CONAN_LIBS_LIBXML2_RELEASE AND CONAN_LIBS_LIBXML2_DEBUG) #multi-configuration
    set(LIBXML2_LIBRARY_RELEASE ${CONAN_LIBS_LIBXML2_RELEASE})
    set(LIBXML2_LIBRARY_DEBUG ${CONAN_LIBS_LIBXML2_DEBUG})
else()    
    conan_determine_library_build_type(LIBXML2)
    if(LIBXML2_BUILD_TYPE STREQUAL "Debug")
        set(LIBXML2_LIBRARY_DEBUG ${CONAN_LIBS_LIBXML2})
    else()
        set(LIBXML2_LIBRARY_RELEASE ${CONAN_LIBS_LIBXML2})
    endif()
endif()

select_library_configurations(LIBXML2)

set(LIBXML2_REQUIRED_VARS
    LIBXML2_LIBRARIES)

conan_select_include_configurations(LIBXML2)

find_package_handle_standard_args(LIBXML2
    REQUIRED_VARS ${LIBXML2_REQUIRED_VARS})