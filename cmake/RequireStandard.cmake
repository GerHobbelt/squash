function (target_require_c_standard target standard)
  if (${CMAKE_VERSION} VERSION_GREATER 3.1)
    if ("${standard}" STREQUAL "c11")
      set_property (TARGET ${target} PROPERTY C_STANDARD "11")
    elseif ("${standard}" STREQUAL "c99")
      set_property (TARGET ${target} PROPERTY C_STANDARD "99")
    elseif ("${standard}" STREQUAL "c90")
      set_property (TARGET ${target} PROPERTY C_STANDARD "90")
    elseif ("${standard}" STREQUAL "c89")
      set_property (TARGET ${target} PROPERTY C_STANDARD "90")
    else ()
      message (FATAL_ERROR "Unknown standard: ${standard} (valid: c11, c99, c90, c89)")
    endif ()

    set_property (TARGET ${target} PROPERTY C_STANDARD_REQUIRED TRUE)
  else ()
    # TODO: make this portable
    get_target_property (sources ${target} SOURCES)

    foreach (source ${sources})
      if ("${source}" MATCHES "\\.c$")
        set_property (SOURCE "${source}" APPEND_STRING PROPERTY COMPILE_FLAGS " -std=${standard}")
      endif ()
    endforeach (source)

    unset (sources)
  endif ()
endfunction ()

function (target_require_cxx_standard target standard)
  if (${CMAKE_VERSION} VERSION_GREATER 3.1)
    if ("${standard}" STREQUAL "c++14")
      set_property (TARGET ${target} PROPERTY CXX_STANDARD "14")
    elseif ("${standard}" STREQUAL "c++11")
      set_property (TARGET ${target} PROPERTY CXX_STANDARD "11")
    elseif ("${standard}" STREQUAL "c++98")
      set_property (TARGET ${target} PROPERTY CXX_STANDARD "98")
    else ()
      message (FATAL_ERROR "Unknown standard: ${standard} (valid: c++14, c++11, c++98)")
    endif ()

    set_property (TARGET ${target} PROPERTY CXX_STANDARD_REQUIRED TRUE)
  else ()
    # TODO: make this portable
    get_target_property (sources ${target} SOURCES)

    foreach (source ${sources})
      if ("${source}" MATCHES "\\.(cpp|cxx|cc)$")
        set_property (SOURCE "${source}" APPEND_STRING PROPERTY COMPILE_FLAGS " -std=${standard}")
      endif ()
    endforeach (source)

    unset (sources)
  endif ()
endfunction ()
