cmake_minimum_required(VERSION 3.30)
project(trexio_integration_sandpit Fortran)


enable_language(Fortran)
option(use_trexio_f "Use trexio_f target instead of trexio" OFF)

add_executable(trexio_integration_sandpit main.F90 )
if (NOT use_trexio_f)
    target_sources(trexio_integration_sandpit PRIVATE trexio.F90)
endif ()

include(FetchContent)
FetchContent_Declare(trexio
        #        GIT_REPOSITORY https://github.com/TREX-CoE/trexio GIT_TAG v2.5.0
        GIT_REPOSITORY https://github.com/pjknowles/trexio GIT_TAG fortran-cmake
)
FetchContent_MakeAvailable(trexio)

if (use_trexio_f)
    target_link_libraries(trexio_integration_sandpit PRIVATE trexio_f)
else ()
    target_link_libraries(trexio_integration_sandpit PRIVATE trexio)
endif ()

#target_include_directories(trexio_integration_sandpit PRIVATE
#        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/_deps/trexio-src/include>
#        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/my_module>
#)

add_subdirectory(my_module)
target_link_libraries(trexio_integration_sandpit PRIVATE my_module)
