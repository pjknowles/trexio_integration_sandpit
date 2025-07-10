cmake_minimum_required(VERSION 3.30)
project(trexio_integration_sandpit Fortran)


enable_language(Fortran)

add_executable(trexio_integration_sandpit main.F90)

include(FetchContent)
FetchContent_Declare(trexio
        GIT_REPOSITORY https://github.com/TREX-CoE/trexio
        GIT_TAG v2.5.0
)
FetchContent_MakeAvailable(trexio)

target_link_libraries(trexio_integration_sandpit PRIVATE trexio)
target_include_directories(trexio_integration_sandpit PRIVATE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/_deps/trexio-src/include>
)
