if (NOT "${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
    message(FATAL_ERROR "your_project only supports Linux currently, but the target OS is ${CMAKE_SYSTEM_NAME}.")
endif()
