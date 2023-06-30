cmake_minimum_required(VERSION 3.13)

project(your_project
        VERSION 0.0.1
        LANGUAGES CXX)

include(cmake/Policy.cmake NO_POLICY_SCOPE)

add_library(your_project STATIC)
add_library(your_project::your_project ALIAS your_project)
target_include_directories(your_project
                           PUBLIC
                           "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
                           "$<INSTALL_INTERFACE:include>"
)

include(cmake/Option.cmake)
include(cmake/CompileOption.cmake)
include(cmake/Platform.cmake)
include(cmake/Develop.cmake)
include(cmake/Extra.cmake)
# include(cmake/Install.cmake)

# add_subdirectory(lib)
