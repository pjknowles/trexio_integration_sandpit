add_library(my_module my_module.f90 my_header.f90)
set_source_files_properties(my_header.f90 PROPERTIES HEADER_FILE_ONLY TRUE)
target_include_directories(my_module INTERFACE "." ${CMAKE_CURRENT_BINARY_DIR})
