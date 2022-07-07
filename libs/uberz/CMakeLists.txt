cmake_minimum_required(VERSION 3.19)
project(uberzlib)

set(TARGET uberzlib)
set(PUBLIC_HDR_DIR include)

# ==================================================================================================
# Sources and headers
# ==================================================================================================
set(PUBLIC_HDRS
    include/uberz/ArchiveEnums.h
    include/uberz/ReadableArchive.h
    include/uberz/WritableArchive.h
)

set(SRCS
    src/ReadableArchive.cpp
    src/WritableArchive.cpp
)

# ==================================================================================================
# Include and target definitions
# ==================================================================================================
include_directories(${PUBLIC_HDR_DIR})

add_library(${TARGET} STATIC ${PUBLIC_HDRS} ${SRCS})

if (IOS)
    set_target_properties(
        ${TARGET}
        PROPERTIES 
        FRAMEWORK TRUE
        PUBLIC_HEADER "${PUBLIC_HDRS}"
        OUTPUT_NAME "uberz"
    )
endif()

target_link_libraries(${TARGET} PUBLIC math utils filabridge zstd)

target_include_directories(${TARGET} PUBLIC ${PUBLIC_HDR_DIR})

# ==================================================================================================
# Compiler flags
# ==================================================================================================
if (MSVC)
    target_compile_options(${TARGET} PRIVATE $<$<CONFIG:Release>:/fp:fast>)
else()
    target_compile_options(${TARGET} PRIVATE $<$<CONFIG:Release>:-ffast-math>)
    target_compile_options(${TARGET} PRIVATE -Wno-deprecated-register)
endif()

# ==================================================================================================
# Installation
# ==================================================================================================
set(INSTALL_TYPE ARCHIVE)
if (IOS)
        set(INSTALL_TYPE FRAMEWORK)
endif()
install(TARGETS ${TARGET} ${INSTALL_TYPE} DESTINATION lib/${DIST_DIR})
install(DIRECTORY ${PUBLIC_HDR_DIR}/uberz DESTINATION include)
