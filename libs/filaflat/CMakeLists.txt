cmake_minimum_required(VERSION 3.19)
project(filaflat)

set(TARGET         filaflat)
set(PUBLIC_HDR_DIR include)

# ==================================================================================================
# Sources and headers
# ==================================================================================================
file(GLOB_RECURSE HDRS include/filaflat/*.h)

set(SRCS
        src/ChunkContainer.cpp
        src/DictionaryReader.cpp
        src/MaterialChunk.cpp
        src/Unflattener.cpp)

# ==================================================================================================
# Include and target definitions
# ==================================================================================================
include_directories(${PUBLIC_HDR_DIR})

add_library(${TARGET} ${HDRS} ${SRCS})
if (IOS)
    set_target_properties(
        ${TARGET}
        PROPERTIES 
        FRAMEWORK TRUE
        PUBLIC_HEADER "${HDRS}"
    )
endif()
target_include_directories(${TARGET} PUBLIC ${PUBLIC_HDR_DIR})

target_link_libraries(${TARGET} filabridge utils)

if (FILAMENT_SUPPORTS_VULKAN)
    target_link_libraries(${TARGET} smol-v)
endif()

# ==================================================================================================
# Installation
# ==================================================================================================
# We do not need filaflat headers in the install directory
# install(DIRECTORY ${PUBLIC_HDR_DIR}/filaflat DESTINATION include)
set(INSTALL_TYPE ARCHIVE)
if (IOS)
        set(INSTALL_TYPE FRAMEWORK)
endif()
install(TARGETS ${TARGET} ${INSTALL_TYPE} DESTINATION lib/${DIST_DIR})
