include(GNUInstallDirs)

install(TARGETS your_project
        EXPORT your_project_targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(DIRECTORY "${your_project_SOURCE_DIR}/include/your_project"
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(DIRECTORY "${your_project_SOURCE_DIR}/include/uring"
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(EXPORT your_project_targets
        FILE your_project_targets.cmake
        NAMESPACE your_project::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/your_project
)

include(CMakePackageConfigHelpers)

configure_package_config_file(${your_project_SOURCE_DIR}/cmake/templates/Config.cmake.in
    "${CMAKE_CURRENT_BINARY_DIR}/your_project-config.cmake"
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/your_project
)

write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/your_project-config-version.cmake"
    COMPATIBILITY SameMinorVersion)

install(FILES
        "${CMAKE_CURRENT_BINARY_DIR}/your_project-config.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/your_project-config-version.cmake"
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/your_project
)

# uninstall target
if(NOT TARGET uninstall)
  configure_file(
    "${your_project_SOURCE_DIR}/cmake/templates/cmake_uninstall.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
    IMMEDIATE @ONLY)

  add_custom_target(uninstall
    COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake)
endif()
