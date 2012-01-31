# Find Booredis - Booredis handling library for Qt
#
# This module defines
#  BOOREDIS_FOUND - whether the booredis library was found
#  BOOREDIS_LIBRARIES - the booredis library
#  BOOREDIS_INCLUDE_DIR - the include path of the booredis library
#

if (BOOREDIS_INCLUDE_DIR AND BOOREDIS_LIBRARIES)

  # Already in cache
  set (BOOREDIS_FOUND TRUE)

else (BOOREDIS_INCLUDE_DIR AND BOOREDIS_LIBRARIES)

  if (NOT WIN32)
    # use pkg-config to get the values of BOOREDIS_INCLUDE_DIRS
    # and BOOREDIS_LIBRARY_DIRS to add as hints to the find commands.
    include (FindPkgConfig)
    pkg_check_modules (BOOREDIS REQUIRED Booredis>=0.5)
  endif (NOT WIN32)

  find_library (BOOREDIS_LIBRARIES
    NAMES
    booredis
    PATHS
    ${BOOREDIS_LIBRARY_DIRS}
    ${LIB_INSTALL_DIR}
  )

  find_path (BOOREDIS_INCLUDE_DIR
    NAMES
    booredisasync.h
    PATH_SUFFIXES
    booredis
    PATHS
    ${BOOREDIS_INCLUDE_DIRS}
    ${INCLUDE_INSTALL_DIR}
  )

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(BOOREDIS DEFAULT_MSG BOOREDIS_LIBRARIES BOOREDIS_INCLUDE_DIR)

endif (BOOREDIS_INCLUDE_DIR AND BOOREDIS_LIBRARIES)
