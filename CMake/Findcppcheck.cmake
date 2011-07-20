# - try to find cppcheck tool
#
# Cache Variables:
# CPPCHECK_EXECUTABLE
#
# Non-cache variables you might use in your CMakeLists.txt:
# CPPCHECK_FOUND
# CPPCHECK_POSSIBLEERROR_ARG
# CPPCHECK_UNUSEDFUNC_ARG
# CPPCHECK_STYLE_ARG
# CPPCHECK_QUIET_ARG
# CPPCHECK_INCLUDEPATH_ARG
# CPPCHECK_FAIL_REGULAR_EXPRESSION
# CPPCHECK_WARN_REGULAR_EXPRESSION
# CPPCHECK_MARK_AS_ADVANCED - whether to mark our vars as advanced even
# if we don't find this program.
#
# Requires these CMake modules:
# FindPackageHandleStandardArgs (known included with CMake >=2.6.2)
#
# Original Author:
# 2009-2010 Ryan Pavlik <rpavlik@iastate.edu> <abiryan@ryand.net>
# http://academic.cleardefinition.com
# Iowa State University HCI Graduate Program/VRAC
#
# Copyright Iowa State University 2009-2010.
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

file(TO_CMAKE_PATH "${CPPCHECK_ROOT_DIR}" CPPCHECK_ROOT_DIR)
set(CPPCHECK_ROOT_DIR
  "${CPPCHECK_ROOT_DIR}"
  CACHE
  PATH
  "Path to search for cppcheck")

# cppcheck app bundles on Mac OS X are GUI, we want command line only
set(_oldappbundlesetting ${CMAKE_FIND_APPBUNDLE})
set(CMAKE_FIND_APPBUNDLE NEVER)

# If we have a custom path, look there first.
if(CPPCHECK_ROOT_DIR)
  find_program(CPPCHECK_EXECUTABLE
    NAMES
      cppcheck
      cli
    PATHS
      "${CPPCHECK_ROOT_DIR}"
    PATH_SUFFIXES
      cli
    NO_DEFAULT_PATH)
endif()

find_program(CPPCHECK_EXECUTABLE NAMES cppcheck)

# Restore original setting for appbundle finding
set(CMAKE_FIND_APPBUNDLE ${_oldappbundlesetting})

if(CPPCHECK_EXECUTABLE)
  # Find out where our test file is
  get_filename_component(_cppcheckmoddir ${CMAKE_CURRENT_LIST_FILE} PATH)
  set(_cppcheckdummyfile "${_cppcheckmoddir}/Findcppcheck.cpp")

  # common to all version of cppcheck
  set(CPPCHECK_QUIET_ARG --quiet)
  set(CPPCHECK_FORCE_ARG --force)
  set(CPPCHECK_VERBOSE_ARG --verbose)
  set(CPPCHECK_INCLUDEPATH_ARG -I)
  set(CPPCHECK_DEFINITION_ARG -D)

  # Check for the two types of command line arguments by just trying them
  execute_process(COMMAND
      ${CPPCHECK_EXECUTABLE}
      --enable=style
      ${CPPCHECK_QUIET_ARG}
      ${_cppcheckdummyfile}
    RESULT_VARIABLE
      _cppcheck_enable_style_result
    OUTPUT_QUIET
    ERROR_QUIET
    )

  if( "${_cppcheck_enable_style_result}" EQUAL 0 )
    set( CPPCHECK_STYLE_ARG --enable=style)
    set( CPPCHECK_ALL_ARG   --enable=all)

    # How to display errors and warnings:
    if(MSVC)
      # supported since cppcheck 1.4???
      # TODO: find the version since it is being supported
      set(CPPCHECK_TEMPLATE_ARG --template vs)
      set(CPPCHECK_FAIL_REGULAR_EXPRESSION "[(]error[)]")
      set(CPPCHECK_WARN_REGULAR_EXPRESSION "[(]style[)]")
    elseif(CMAKE_COMPILER_IS_GNUCXX)
      set(CPPCHECK_TEMPLATE_ARG --template gcc)
      set(CPPCHECK_FAIL_REGULAR_EXPRESSION " error: ")
      set(CPPCHECK_WARN_REGULAR_EXPRESSION " style: ")
    else()
      message(STATUS
        "Warning: FindCppcheck doesn't know how to format error messages for your compiler!")
      set(CPPCHECK_TEMPLATE_ARG --template gcc)
      set(CPPCHECK_FAIL_REGULAR_EXPRESSION " error: ")
      set(CPPCHECK_WARN_REGULAR_EXPRESSION " style: ")
    endif()

  else()
    execute_process(
      COMMAND
        ${CPPCHECK_EXECUTABLE}
        --style
        ${CPPCHECK_QUIET_ARG}
        ${_cppcheckdummyfile}
      RESULT_VARIABLE
        _cppcheck_syle_result
      OUTPUT_QUIET
      ERROR_QUIET
      )
    if( "${_cppcheck_syle_result}" EQUAL 0 )
      set( CPPCHECK_STYLE_ARG --style)
      set(CPPCHECK_FAIL_REGULAR_EXPRESSION "error:")
      set(CPPCHECK_WARN_REGULAR_EXPRESSION "[(]style[)]")
    else()
      message( "cppcheck MUST support at least the following options:
        --style or --enable=style. Please update your version of cppcheck" )
    endif()
  endif()

  execute_process(COMMAND
      ${CPPCHECK_EXECUTABLE}
      --enable=unusedFunctions
      ${CPPCHECK_QUIET_ARG}
      ${_cppcheckdummyfile}
    RESULT_VARIABLE
      _cppcheck_enable_unused_functions_results
    OUTPUT_QUIET
    ERROR_QUIET
    )

  if("${_cppcheck_enable_unused_functions_results}" EQUAL 0)
    # supported since
    set(CPPCHECK_UNUSEDFUNC_ARG --enable=unusedFunctions)

  else()
    execute_process(COMMAND
      ${CPPCHECK_EXECUTABLE}
      --unusedFunctions
      ${CPPCHECK_QUIET_ARG}
      ${_cppcheckdummyfile}
    RESULT_VARIABLE
      _cppcheck_unused_functions_results
    OUTPUT_QUIET
    ERROR_QUIET
    )

    if( _cppcheck_unused_functions_results )
      # Old arguments
      set(CPPCHECK_UNUSEDFUNC_ARG --unused-functions)
    else()
      # No idea - some other issue must be getting in the way
      message(STATUS
        "WARNING: Can't detect whether CPPCHECK wants new or old-style arguments!")
    endif()
  endif()

  execute_process(COMMAND
      ${CPPCHECK_EXECUTABLE}
      --enable=information
      ${CPPCHECK_QUIET_ARG}
      ${_cppcheckdummyfile}
    RESULT_VARIABLE
      _cppcheck_enable_information_results
    OUTPUT_QUIET
    ERROR_QUIET
    )

  if("${_cppcheck_enable_information_results}" EQUAL 0)
    # supported since
    set(CPPCHECK_INFORMATION_ARG --enable=information)

  else()
    execute_process(COMMAND
      ${CPPCHECK_EXECUTABLE}
      --information
      ${CPPCHECK_QUIET_ARG}
      ${_cppcheckdummyfile}
    RESULT_VARIABLE
      _cppcheck_information_results
    OUTPUT_QUIET
    ERROR_QUIET
    )

    if( _cppcheck_information_results )
      # Old arguments
      set(CPPCHECK_INFORMATION_ARG --information)
    else()
      # No idea - some other issue must be getting in the way
      message(STATUS
        "WARNING: Can't detect whether CPPCHECK wants new or old-style arguments!")
    endif()
  endif()

  execute_process(COMMAND
      ${CPPCHECK_EXECUTABLE}
      --enable=missingInclude
      ${CPPCHECK_QUIET_ARG}
      ${_cppcheckdummyfile}
    RESULT_VARIABLE
      _cppcheck_missingInclude_results
    OUTPUT_QUIET
    ERROR_QUIET
    )

  if("${_cppcheck_missingInclude_results}" EQUAL 0)
    # supported since
    set(CPPCHECK_INFORMATION_ARG --enable=missingInclude)

  else()
    execute_process(COMMAND
      ${CPPCHECK_EXECUTABLE}
      --missingInclude
      ${CPPCHECK_QUIET_ARG}
      ${_cppcheckdummyfile}
    RESULT_VARIABLE
      _cppcheck_information_results
    OUTPUT_QUIET
    ERROR_QUIET
    )

    if( _cppcheck_information_results )
      # Old arguments
      set(CPPCHECK_INFORMATION_ARG --missingInclude)
    else()
      # No idea - some other issue must be getting in the way
      message(STATUS
        "WARNING: Can't detect whether CPPCHECK wants new or old-style arguments!")
    endif()
  endif()

endif()

set(CPPCHECK_ALL
"${CPPCHECK_EXECUTABLE} ${CPPCHECK_POSSIBLEERROR_ARG} ${CPPCHECK_UNUSEDFUNC_ARG} ${CPPCHECK_STYLE_ARG} ${CPPCHECK_QUIET_ARG} ${CPPCHECK_INCLUDEPATH_ARG} some/include/path")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(cppcheck
  DEFAULT_MSG
  CPPCHECK_ALL
  CPPCHECK_EXECUTABLE
  CPPCHECK_POSSIBLEERROR_ARG
  CPPCHECK_UNUSEDFUNC_ARG
  CPPCHECK_STYLE_ARG
  CPPCHECK_INCLUDEPATH_ARG
  CPPCHECK_QUIET_ARG)

if(CPPCHECK_FOUND OR CPPCHECK_MARK_AS_ADVANCED)
  mark_as_advanced(CPPCHECK_ROOT_DIR)
endif()

mark_as_advanced(CPPCHECK_EXECUTABLE)
