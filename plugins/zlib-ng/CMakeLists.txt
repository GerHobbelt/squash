include (SquashPlugin)

squash_plugin(
  NAME zlib-ng
  SOURCES squash-zlib-ng.c
  INCLUDE_DIRS
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/zlib-ng
  EMBED_DEPENDENCIES
    zlib
  EMBED_TARGET
    ${CMAKE_CURRENT_SOURCE_DIR}/zlib-ng/libz.so
  EMBED_SUBDIR
    zlib-ng
  EMBED_COMPILER_FLAGS
    -Wno-shift-negative-value)
list (APPEND zlibng_sources ${libzlibng_sources})
