# ----------------------------------------------------------------------------
#   Gcc
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
#   Clang
# ----------------------------------------------------------------------------
if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    target_compile_options(your_project PUBLIC -fsized-deallocation)
endif()

if(WITH_LIBCXX AND CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    target_compile_options(your_project PRIVATE -stdlib=libc++)
    target_link_options(your_project
                        PRIVATE -stdlib=libc++
                        PRIVATE -lc++abi)
endif()
